# frozen_string_literal: true

require_relative "test_helper"

class Increase::Test::WebhooksTest < Minitest::Test
  def setup
    @timestamp = Time.now.utc.iso8601
    @secret = "whsec_test_secret"
    @payload = "{\"type\":\"event\",\"id\":\"event_123abc\",\"created_at\":\"2020-01-31T23:59:59Z\"}"
    @signed_payload = OpenSSL::HMAC.hexdigest(
      OpenSSL::Digest.new("sha256"),
      @secret,
      "#{@timestamp}.#{@payload}"
    )
    @signature = "t=#{@timestamp},v1=#{@signed_payload}"
  end

  def test_unwrap
    unwrapped = Increase::Webhooks.unwrap(@payload, @signature, @secret)
    assert_equal(unwrapped, JSON.parse(@payload))

    assert_raises(StandardError, "None of the given webhook signatures match the expected signature.") do
      Increase::Webhooks.unwrap(@payload, @signature, "wrong_secret")
    end
  end

  def test_verify_signature_valid
    assert_nil(Increase::Webhooks.verify_signature(@payload, @signature, @secret))
  end

  def test_verify_signature_invalid_secret
    assert_raises(StandardError, "None of the given webhook signatures match the expected signature.") do
      Increase::Webhooks.verify_signature(@payload, @signature, "wrong_secret")
    end
  end

  def test_verify_signature_invalid_payload
    wrong_payload = "{\"type\":\"event\",\"id\":\"event_different\"}"

    assert_raises(StandardError, "None of the given webhook signatures match the expected signature.") do
      Increase::Webhooks.verify_signature(wrong_payload, @signature, @secret)
    end
  end

  def test_verify_signature_invalid_signature_format
    invalid_signature = "???"

    assert_raises(StandardError, "Unable to parse webhook signature.") do
      Increase::Webhooks.verify_signature(@payload, invalid_signature, @secret)
    end
  end
end
