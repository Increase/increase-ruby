# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::ACHPrenotificationsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.ach_prenotifications.create(
        account_id: "account_in71c4amph0vgo2qllky",
        account_number: "987654321",
        routing_number: "101050001"
      )

    assert_pattern do
      response => Increase::ACHPrenotification
    end

    assert_pattern do
      response => {
        id: String,
        account_number: String,
        addendum: String | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_name: String | nil,
        created_at: Time,
        credit_debit_indicator: Increase::ACHPrenotification::CreditDebitIndicator | nil,
        effective_date: Time | nil,
        idempotency_key: String | nil,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::ACHPrenotification::NotificationsOfChange]),
        prenotification_return: Increase::ACHPrenotification::PrenotificationReturn | nil,
        routing_number: String,
        status: Increase::ACHPrenotification::Status,
        type: Increase::ACHPrenotification::Type
      }
    end
  end

  def test_retrieve
    response = @increase.ach_prenotifications.retrieve("ach_prenotification_id")

    assert_pattern do
      response => Increase::ACHPrenotification
    end

    assert_pattern do
      response => {
        id: String,
        account_number: String,
        addendum: String | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_name: String | nil,
        created_at: Time,
        credit_debit_indicator: Increase::ACHPrenotification::CreditDebitIndicator | nil,
        effective_date: Time | nil,
        idempotency_key: String | nil,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::ACHPrenotification::NotificationsOfChange]),
        prenotification_return: Increase::ACHPrenotification::PrenotificationReturn | nil,
        routing_number: String,
        status: Increase::ACHPrenotification::Status,
        type: Increase::ACHPrenotification::Type
      }
    end
  end

  def test_list
    response = @increase.ach_prenotifications.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::ACHPrenotification
    end

    assert_pattern do
      row => {
        id: String,
        account_number: String,
        addendum: String | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_name: String | nil,
        created_at: Time,
        credit_debit_indicator: Increase::ACHPrenotification::CreditDebitIndicator | nil,
        effective_date: Time | nil,
        idempotency_key: String | nil,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::ACHPrenotification::NotificationsOfChange]),
        prenotification_return: Increase::ACHPrenotification::PrenotificationReturn | nil,
        routing_number: String,
        status: Increase::ACHPrenotification::Status,
        type: Increase::ACHPrenotification::Type
      }
    end
  end
end
