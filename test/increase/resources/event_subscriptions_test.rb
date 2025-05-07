# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::EventSubscriptionsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.event_subscriptions.create(url: "https://website.com/webhooks")

    assert_pattern do
      response => Increase::EventSubscription
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        idempotency_key: String | nil,
        oauth_connection_id: String | nil,
        selected_event_category: Increase::EventSubscription::SelectedEventCategory | nil,
        status: Increase::EventSubscription::Status,
        type: Increase::EventSubscription::Type,
        url: String
      }
    end
  end

  def test_retrieve
    response = @increase.event_subscriptions.retrieve("event_subscription_id")

    assert_pattern do
      response => Increase::EventSubscription
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        idempotency_key: String | nil,
        oauth_connection_id: String | nil,
        selected_event_category: Increase::EventSubscription::SelectedEventCategory | nil,
        status: Increase::EventSubscription::Status,
        type: Increase::EventSubscription::Type,
        url: String
      }
    end
  end

  def test_update
    response = @increase.event_subscriptions.update("event_subscription_id")

    assert_pattern do
      response => Increase::EventSubscription
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        idempotency_key: String | nil,
        oauth_connection_id: String | nil,
        selected_event_category: Increase::EventSubscription::SelectedEventCategory | nil,
        status: Increase::EventSubscription::Status,
        type: Increase::EventSubscription::Type,
        url: String
      }
    end
  end

  def test_list
    response = @increase.event_subscriptions.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::EventSubscription
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        idempotency_key: String | nil,
        oauth_connection_id: String | nil,
        selected_event_category: Increase::EventSubscription::SelectedEventCategory | nil,
        status: Increase::EventSubscription::Status,
        type: Increase::EventSubscription::Type,
        url: String
      }
    end
  end
end
