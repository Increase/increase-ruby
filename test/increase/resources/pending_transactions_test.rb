# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::PendingTransactionsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.pending_transactions.create(account_id: "account_in71c4amph0vgo2qllky", amount: -1000)

    assert_pattern do
      response => Increase::PendingTransaction
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        amount: Integer,
        completed_at: Time | nil,
        created_at: Time,
        currency: Increase::PendingTransaction::Currency,
        description: String,
        held_amount: Integer,
        route_id: String | nil,
        route_type: Increase::PendingTransaction::RouteType | nil,
        source: Increase::PendingTransaction::Source,
        status: Increase::PendingTransaction::Status,
        type: Increase::PendingTransaction::Type
      }
    end
  end

  def test_retrieve
    response = @increase.pending_transactions.retrieve("pending_transaction_k1sfetcau2qbvjbzgju4")

    assert_pattern do
      response => Increase::PendingTransaction
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        amount: Integer,
        completed_at: Time | nil,
        created_at: Time,
        currency: Increase::PendingTransaction::Currency,
        description: String,
        held_amount: Integer,
        route_id: String | nil,
        route_type: Increase::PendingTransaction::RouteType | nil,
        source: Increase::PendingTransaction::Source,
        status: Increase::PendingTransaction::Status,
        type: Increase::PendingTransaction::Type
      }
    end
  end

  def test_list
    response = @increase.pending_transactions.list

    assert_pattern do
      response => Increase::Models::PendingTransactionListResponse
    end

    assert_pattern do
      response => {
        data: ^(Increase::Internal::Type::ArrayOf[Increase::PendingTransaction]),
        next_cursor: String | nil
      }
    end
  end

  def test_release
    response = @increase.pending_transactions.release("pending_transaction_k1sfetcau2qbvjbzgju4")

    assert_pattern do
      response => Increase::PendingTransaction
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        amount: Integer,
        completed_at: Time | nil,
        created_at: Time,
        currency: Increase::PendingTransaction::Currency,
        description: String,
        held_amount: Integer,
        route_id: String | nil,
        route_type: Increase::PendingTransaction::RouteType | nil,
        source: Increase::PendingTransaction::Source,
        status: Increase::PendingTransaction::Status,
        type: Increase::PendingTransaction::Type
      }
    end
  end
end
