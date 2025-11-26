# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::TransactionsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.transactions.retrieve("transaction_uyrp7fld2ium70oa7oi")

    assert_pattern do
      response => Increase::Transaction
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        amount: Integer,
        created_at: Time,
        currency: Increase::Transaction::Currency,
        description: String,
        route_id: String | nil,
        route_type: Increase::Transaction::RouteType | nil,
        source: Increase::Transaction::Source,
        type: Increase::Transaction::Type
      }
    end
  end

  def test_list
    response = @increase.transactions.list

    assert_pattern do
      response => Increase::Models::TransactionListResponse
    end

    assert_pattern do
      response => {
        data: ^(Increase::Internal::Type::ArrayOf[Increase::Transaction]),
        next_cursor: String | nil
      }
    end
  end
end
