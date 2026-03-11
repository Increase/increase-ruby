# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::EventsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.events.retrieve("event_001dzz0r20rzr4zrhrr1364hy80")

    assert_pattern do
      response => Increase::Event
    end

    assert_pattern do
      response => {
        id: String,
        associated_object_id: String,
        associated_object_type: String,
        category: Increase::Event::Category,
        created_at: Time,
        type: Increase::Event::Type
      }
    end
  end

  def test_list
    response = @increase.events.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Event
    end

    assert_pattern do
      row => {
        id: String,
        associated_object_id: String,
        associated_object_type: String,
        category: Increase::Event::Category,
        created_at: Time,
        type: Increase::Event::Type
      }
    end
  end

  def test_unwrap
    key = "whsec_c2VjcmV0Cg=="
    raw_key = "secret\n"

    webhook = StandardWebhooks::Webhook.new(key)

    data =
      "{\"id\":\"event_001dzz0r20rzr4zrhrr1364hy80\",\"associated_object_id\":\"account_in71c4amph0vgo2qllky\",\"associated_object_type\":\"account\",\"category\":\"account.created\",\"created_at\":\"2020-01-31T23:59:59Z\",\"type\":\"event\"}"
    message_id = "1"
    timestamp = Time.now.to_i.to_s
    signature = webhook.sign(message_id, timestamp, data)
    headers =
      {"webhook-id" => message_id, "webhook-timestamp" => timestamp, "webhook-signature" => signature}

    @increase.events.unwrap(data, headers: headers, key: raw_key)

    bad_headers = [
      headers.merge("webhook-id" => "bad"),
      headers.merge("webhook-timestamp" => "0"),
      headers.merge("webhook-signature" => webhook.sign(message_id, timestamp, "xxx"))
    ]
    bad_headers.each do |bad_header|
      assert_raises(StandardWebhooks::WebhookVerificationError) do
        @increase.events.unwrap(data, headers: bad_header, key: raw_key)
      end
    end
  end
end
