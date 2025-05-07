# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::CardSettlementsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.simulations.card_settlements.create(
        card_id: "card_oubs0hwk5rn6knuecxg2",
        pending_transaction_id: "pending_transaction_k1sfetcau2qbvjbzgju4"
      )

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
end
