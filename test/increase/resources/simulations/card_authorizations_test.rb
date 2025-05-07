# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::CardAuthorizationsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.simulations.card_authorizations.create(amount: 1000)

    assert_pattern do
      response => Increase::Models::Simulations::CardAuthorizationCreateResponse
    end

    assert_pattern do
      response => {
        declined_transaction: Increase::DeclinedTransaction | nil,
        pending_transaction: Increase::PendingTransaction | nil,
        type: Increase::Models::Simulations::CardAuthorizationCreateResponse::Type
      }
    end
  end
end
