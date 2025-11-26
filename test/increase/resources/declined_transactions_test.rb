# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::DeclinedTransactionsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.declined_transactions.retrieve("declined_transaction_17jbn0yyhvkt4v4ooym8")

    assert_pattern do
      response => Increase::DeclinedTransaction
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        amount: Integer,
        created_at: Time,
        currency: Increase::DeclinedTransaction::Currency,
        description: String,
        route_id: String | nil,
        route_type: Increase::DeclinedTransaction::RouteType | nil,
        source: Increase::DeclinedTransaction::Source,
        type: Increase::DeclinedTransaction::Type
      }
    end
  end

  def test_list
    response = @increase.declined_transactions.list

    assert_pattern do
      response => Increase::Models::DeclinedTransactionListResponse
    end

    assert_pattern do
      response => {
        data: ^(Increase::Internal::Type::ArrayOf[Increase::DeclinedTransaction]),
        next_cursor: String | nil
      }
    end
  end
end
