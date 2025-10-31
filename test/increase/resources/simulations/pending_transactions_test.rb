# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::PendingTransactionsTest < Increase::Test::ResourceTest
  def test_release_inbound_funds_hold
    response =
      @increase.simulations.pending_transactions.release_inbound_funds_hold(
        "pending_transaction_k1sfetcau2qbvjbzgju4"
      )

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
