# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::ExternalAccountsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.external_accounts.create(
        account_number: "987654321",
        description: "Landlord",
        routing_number: "101050001"
      )

    assert_pattern do
      response => Increase::ExternalAccount
    end

    assert_pattern do
      response => {
        id: String,
        account_holder: Increase::ExternalAccount::AccountHolder,
        account_number: String,
        created_at: Time,
        description: String,
        funding: Increase::ExternalAccount::Funding,
        idempotency_key: String | nil,
        routing_number: String,
        status: Increase::ExternalAccount::Status,
        type: Increase::ExternalAccount::Type,
        verification_status: Increase::ExternalAccount::VerificationStatus
      }
    end
  end

  def test_retrieve
    response = @increase.external_accounts.retrieve("external_account_id")

    assert_pattern do
      response => Increase::ExternalAccount
    end

    assert_pattern do
      response => {
        id: String,
        account_holder: Increase::ExternalAccount::AccountHolder,
        account_number: String,
        created_at: Time,
        description: String,
        funding: Increase::ExternalAccount::Funding,
        idempotency_key: String | nil,
        routing_number: String,
        status: Increase::ExternalAccount::Status,
        type: Increase::ExternalAccount::Type,
        verification_status: Increase::ExternalAccount::VerificationStatus
      }
    end
  end

  def test_update
    response = @increase.external_accounts.update("external_account_id")

    assert_pattern do
      response => Increase::ExternalAccount
    end

    assert_pattern do
      response => {
        id: String,
        account_holder: Increase::ExternalAccount::AccountHolder,
        account_number: String,
        created_at: Time,
        description: String,
        funding: Increase::ExternalAccount::Funding,
        idempotency_key: String | nil,
        routing_number: String,
        status: Increase::ExternalAccount::Status,
        type: Increase::ExternalAccount::Type,
        verification_status: Increase::ExternalAccount::VerificationStatus
      }
    end
  end

  def test_list
    response = @increase.external_accounts.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::ExternalAccount
    end

    assert_pattern do
      row => {
        id: String,
        account_holder: Increase::ExternalAccount::AccountHolder,
        account_number: String,
        created_at: Time,
        description: String,
        funding: Increase::ExternalAccount::Funding,
        idempotency_key: String | nil,
        routing_number: String,
        status: Increase::ExternalAccount::Status,
        type: Increase::ExternalAccount::Type,
        verification_status: Increase::ExternalAccount::VerificationStatus
      }
    end
  end
end
