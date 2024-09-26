# frozen_string_literal: true

require "time"

require_relative "test_helper"

class IncreaseTest < Test::Unit::TestCase
  def test_raises_on_both_base_url_and_environment
    assert_raise_with_message(ArgumentError, /both environment and base_url given/) do
      Increase::Client.new(
        base_url: "https://localhost:8000",
        environment: "production"
      )
    end
  end

  def test_raises_on_unknown_environment
    assert_raise_with_message(ArgumentError, /environment must be one of/) do
      Increase::Client.new(environment: "wrong")
    end
  end

  def test_raises_on_missing_non_nullable_opts
    assert_raise_with_message(ArgumentError, /is required/) do
      Increase::Client.new
    end
  end

  class MockResponse
    attr_accessor :code, :header, :body, :content_type

    def initialize(code, data, headers)
      self.code = code
      self.header = headers
      self.body = JSON.generate(data)
      self.content_type = "application/json"
    end
  end

  class MockRequester
    attr_accessor :response_code, :response_data, :response_headers, :attempts

    def initialize(response_code, response_data, response_headers)
      self.response_code = response_code
      self.response_data = response_data
      self.response_headers = response_headers
      self.attempts = []
    end

    def execute(req)
      # Deep copy the request because it is mutated on each retry.
      attempts.push(Marshal.load(Marshal.dump(req)))
      MockResponse.new(response_code, response_data, response_headers)
    end
  end

  def test_client_default_request_default_retry_attempts
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    increase.requester = requester
    assert_raise(Increase::HTTP::InternalServerError) do
      increase.accounts.create({name: "New Account!"})
    end
    assert_equal(3, requester.attempts.length)
  end

  def test_client_given_request_default_retry_attempts
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 3)
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    increase.requester = requester
    assert_raise(Increase::HTTP::InternalServerError) do
      increase.accounts.create({name: "New Account!"})
    end
    assert_equal(4, requester.attempts.length)
  end

  def test_client_default_request_given_retry_attempts
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    increase.requester = requester
    assert_raise(Increase::HTTP::InternalServerError) do
      increase.accounts.create({name: "New Account!"}, max_retries: 3)
    end
    assert_equal(4, requester.attempts.length)
  end

  def test_client_given_request_given_retry_attempts
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 3)
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    increase.requester = requester
    assert_raise(Increase::HTTP::InternalServerError) do
      increase.accounts.create({name: "New Account!"}, max_retries: 4)
    end
    assert_equal(5, requester.attempts.length)
  end

  def test_client_retry_after_seconds
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 1)
    requester = MockRequester.new(500, {}, {"retry-after" => "1.3", "x-stainless-mock-sleep" => "true"})
    increase.requester = requester
    assert_raise(Increase::HTTP::InternalServerError) do
      increase.accounts.create({name: "New Account!"})
    end
    assert_equal(2, requester.attempts.length)
    assert_equal(requester.attempts.last[:headers]["X-Stainless-Mock-Slept"], 1.3)
  end

  def test_client_retry_after_date
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 1)
    requester = MockRequester.new(
      500,
      {},
      {
        "retry-after" => (Time.now + 2).httpdate,
        "x-stainless-mock-sleep" => "true",
        "x-stainless-mock-sleep-base" => Time.now.httpdate
      }
    )
    increase.requester = requester
    assert_raise(Increase::HTTP::InternalServerError) do
      increase.accounts.create({name: "New Account!"})
    end
    assert_equal(2, requester.attempts.length)
    assert_equal(requester.attempts.last[:headers]["X-Stainless-Mock-Slept"], 2)
  end

  def test_client_retry_after_ms
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 1)
    requester = MockRequester.new(500, {}, {"retry-after-ms" => "1300", "x-stainless-mock-sleep" => "true"})
    increase.requester = requester
    assert_raise(Increase::HTTP::InternalServerError) do
      increase.accounts.create({name: "New Account!"})
    end
    assert_equal(2, requester.attempts.length)
    assert_equal(requester.attempts.last[:headers]["X-Stainless-Mock-Slept"], 1.3)
  end

  def test_retry_count_header
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    increase.requester = requester

    assert_raise(Increase::HTTP::InternalServerError) do
      increase.accounts.create({name: "New Account!"})
    end

    retry_count_headers = requester.attempts.map { |a| a[:headers]["X-Stainless-Retry-Count"] }
    assert_equal(%w[0 1 2], retry_count_headers)
  end

  def test_omit_retry_count_header
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    increase.requester = requester

    assert_raise(Increase::HTTP::InternalServerError) do
      increase.accounts.create({name: "New Account!"}, extra_headers: {"X-Stainless-Retry-Count" => nil})
    end

    retry_count_headers = requester.attempts.map { |a| a[:headers]["X-Stainless-Retry-Count"] }
    assert_equal([nil, nil, nil], retry_count_headers)
  end

  def test_overwrite_retry_count_header
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    increase.requester = requester

    assert_raise(Increase::HTTP::InternalServerError) do
      increase.accounts.create({name: "New Account!"}, extra_headers: {"X-Stainless-Retry-Count" => "42"})
    end

    retry_count_headers = requester.attempts.map { |a| a[:headers]["X-Stainless-Retry-Count"] }
    assert_equal(%w[42 42 42], retry_count_headers)
  end

  def test_client_redirect_307
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(307, {}, {"location" => "/redirected"})
    increase.requester = requester
    assert_raise(Increase::HTTP::APIConnectionError) do
      increase.accounts.create({name: "New Account!"}, extra_headers: {})
    end
    assert_equal(requester.attempts[1][:path], "/redirected")
    assert_equal(requester.attempts[1][:method], requester.attempts[0][:method])
    assert_equal(requester.attempts[1][:body], requester.attempts[0][:body])
    assert_equal(
      requester.attempts[1][:headers]["Content-Type"],
      requester.attempts[0][:headers]["Content-Type"]
    )
  end

  def test_client_redirect_303
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(303, {}, {"location" => "/redirected"})
    increase.requester = requester
    assert_raise(Increase::HTTP::APIConnectionError) do
      increase.accounts.create({name: "New Account!"}, extra_headers: {})
    end
    assert_equal(requester.attempts[1][:path], "/redirected")
    assert_equal(requester.attempts[1][:method], :get)
    assert_equal(requester.attempts[1][:body], nil)
    assert_equal(requester.attempts[1][:headers]["Content-Type"], nil)
  end

  def test_client_redirect_auth_keep_same_origin
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(307, {}, {"location" => "/redirected"})
    increase.requester = requester
    assert_raise(Increase::HTTP::APIConnectionError) do
      increase.accounts.create({name: "New Account!"}, extra_headers: {"Authorization" => "Bearer xyz"})
    end
    assert_equal(
      requester.attempts[1][:headers]["Authorization"],
      requester.attempts[0][:headers]["Authorization"]
    )
  end

  def test_client_redirect_auth_strip_cross_origin
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(307, {}, {"location" => "https://example.com/redirected"})
    increase.requester = requester
    assert_raise(Increase::HTTP::APIConnectionError) do
      increase.accounts.create({name: "New Account!"}, extra_headers: {"Authorization" => "Bearer xyz"})
    end
    assert_equal(requester.attempts[1][:headers]["Authorization"], nil)
  end

  def test_client_default_idempotency_key_on_writes
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    increase.requester = requester
    assert_raise(Increase::HTTP::InternalServerError) do
      increase.accounts.create({name: "New Account!"}, max_retries: 1)
    end
    idempotency_headers = requester.attempts.map { |a| a[:headers]["Idempotency-Key"] }
    assert_kind_of(String, idempotency_headers[0])
    assert_not_empty(idempotency_headers[0])
    assert_equal(idempotency_headers[0], idempotency_headers[1])
  end

  def test_request_option_idempotency_key_on_writes
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    increase.requester = requester
    assert_raise(Increase::HTTP::InternalServerError) do
      increase.accounts.create({name: "New Account!"}, max_retries: 1, idempotency_key: "user-supplied-key")
    end
    requester.attempts.each { |a| assert_equal(a[:headers]["Idempotency-Key"], "user-supplied-key") }
  end

  def test_default_headers
    increase = Increase::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(200, {}, {"x-stainless-mock-sleep" => "true"})
    increase.requester = requester
    increase.accounts.create({name: "New Account!"})
    headers = requester.attempts[0][:headers]
    assert_not_empty(headers["X-Stainless-Lang"])
    assert_not_empty(headers["X-Stainless-Package-Version"])
    assert_not_empty(headers["X-Stainless-Runtime"])
    assert_not_empty(headers["X-Stainless-Runtime-Version"])
  end
end
