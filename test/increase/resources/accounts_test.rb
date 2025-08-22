# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::AccountsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.accounts.create(name: "New Account!")

    assert_pattern do
      response => Increase::Account
    end

    assert_pattern do
      response => {
        id: String,
        account_revenue_rate: String | nil,
        bank: Increase::Account::Bank,
        closed_at: Time | nil,
        created_at: Time,
        currency: Increase::Account::Currency,
        entity_id: String,
        idempotency_key: String | nil,
        informational_entity_id: String | nil,
        interest_accrued: String,
        interest_accrued_at: Date | nil,
        interest_rate: String,
        name: String,
        program_id: String,
        status: Increase::Account::Status,
        type: Increase::Account::Type
      }
    end
  end

  def test_retrieve
    response = @increase.accounts.retrieve("account_id")

    assert_pattern do
      response => Increase::Account
    end

    assert_pattern do
      response => {
        id: String,
        account_revenue_rate: String | nil,
        bank: Increase::Account::Bank,
        closed_at: Time | nil,
        created_at: Time,
        currency: Increase::Account::Currency,
        entity_id: String,
        idempotency_key: String | nil,
        informational_entity_id: String | nil,
        interest_accrued: String,
        interest_accrued_at: Date | nil,
        interest_rate: String,
        name: String,
        program_id: String,
        status: Increase::Account::Status,
        type: Increase::Account::Type
      }
    end
  end

  def test_update
    response = @increase.accounts.update("account_id")

    assert_pattern do
      response => Increase::Account
    end

    assert_pattern do
      response => {
        id: String,
        account_revenue_rate: String | nil,
        bank: Increase::Account::Bank,
        closed_at: Time | nil,
        created_at: Time,
        currency: Increase::Account::Currency,
        entity_id: String,
        idempotency_key: String | nil,
        informational_entity_id: String | nil,
        interest_accrued: String,
        interest_accrued_at: Date | nil,
        interest_rate: String,
        name: String,
        program_id: String,
        status: Increase::Account::Status,
        type: Increase::Account::Type
      }
    end
  end

  def test_list
    response = @increase.accounts.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Account
    end

    assert_pattern do
      row => {
        id: String,
        account_revenue_rate: String | nil,
        bank: Increase::Account::Bank,
        closed_at: Time | nil,
        created_at: Time,
        currency: Increase::Account::Currency,
        entity_id: String,
        idempotency_key: String | nil,
        informational_entity_id: String | nil,
        interest_accrued: String,
        interest_accrued_at: Date | nil,
        interest_rate: String,
        name: String,
        program_id: String,
        status: Increase::Account::Status,
        type: Increase::Account::Type
      }
    end
  end

  def test_balance
    response = @increase.accounts.balance("account_id")

    assert_pattern do
      response => Increase::BalanceLookup
    end

    assert_pattern do
      response => {
        account_id: String,
        available_balance: Integer,
        current_balance: Integer,
        type: Increase::BalanceLookup::Type
      }
    end
  end

  def test_close
    response = @increase.accounts.close("account_id")

    assert_pattern do
      response => Increase::Account
    end

    assert_pattern do
      response => {
        id: String,
        account_revenue_rate: String | nil,
        bank: Increase::Account::Bank,
        closed_at: Time | nil,
        created_at: Time,
        currency: Increase::Account::Currency,
        entity_id: String,
        idempotency_key: String | nil,
        informational_entity_id: String | nil,
        interest_accrued: String,
        interest_accrued_at: Date | nil,
        interest_rate: String,
        name: String,
        program_id: String,
        status: Increase::Account::Status,
        type: Increase::Account::Type
      }
    end
  end
end
