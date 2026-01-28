# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::CardDisputesTest < Increase::Test::ResourceTest
  def test_action_required_params
    response =
      @increase.simulations.card_disputes.action("card_dispute_h9sc95nbl1cgltpp7men", network: :visa)

    assert_pattern do
      response => Increase::CardDispute
    end

    assert_pattern do
      response => {
        id: String,
        amount: Integer,
        card_id: String,
        created_at: Time,
        disputed_transaction_id: String,
        idempotency_key: String | nil,
        loss: Increase::CardDispute::Loss | nil,
        network: Increase::CardDispute::Network,
        status: Increase::CardDispute::Status,
        type: Increase::CardDispute::Type,
        user_submission_required_by: Time | nil,
        visa: Increase::CardDispute::Visa | nil,
        win: Increase::CardDispute::Win | nil,
        withdrawal: Increase::CardDispute::Withdrawal | nil
      }
    end
  end
end
