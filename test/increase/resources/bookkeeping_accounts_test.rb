# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::BookkeepingAccountsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.bookkeeping_accounts.create(name: "New Account!")

    assert_pattern do
      response => Increase::BookkeepingAccount
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String | nil,
        compliance_category: Increase::BookkeepingAccount::ComplianceCategory | nil,
        entity_id: String | nil,
        idempotency_key: String | nil,
        name: String,
        type: Increase::BookkeepingAccount::Type
      }
    end
  end

  def test_update_required_params
    response =
      @increase.bookkeeping_accounts.update(
        "bookkeeping_account_e37p1f1iuocw5intf35v",
        name: "Deprecated Account"
      )

    assert_pattern do
      response => Increase::BookkeepingAccount
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String | nil,
        compliance_category: Increase::BookkeepingAccount::ComplianceCategory | nil,
        entity_id: String | nil,
        idempotency_key: String | nil,
        name: String,
        type: Increase::BookkeepingAccount::Type
      }
    end
  end

  def test_list
    response = @increase.bookkeeping_accounts.list

    assert_pattern do
      response => Increase::Models::BookkeepingAccountListResponse
    end

    assert_pattern do
      response => {
        data: ^(Increase::Internal::Type::ArrayOf[Increase::BookkeepingAccount]),
        next_cursor: String | nil
      }
    end
  end

  def test_balance
    response = @increase.bookkeeping_accounts.balance("bookkeeping_account_e37p1f1iuocw5intf35v")

    assert_pattern do
      response => Increase::BookkeepingBalanceLookup
    end

    assert_pattern do
      response => {
        balance: Integer,
        bookkeeping_account_id: String,
        type: Increase::BookkeepingBalanceLookup::Type
      }
    end
  end
end
