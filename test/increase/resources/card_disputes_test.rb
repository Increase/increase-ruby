# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::CardDisputesTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.card_disputes.create(
        disputed_transaction_id: "transaction_uyrp7fld2ium70oa7oi",
        explanation: "Unauthorized recurring transaction."
      )

    assert_pattern do
      response => Increase::CardDispute
    end

    assert_pattern do
      response => {
        id: String,
        acceptance: Increase::CardDispute::Acceptance | nil,
        amount: Integer | nil,
        created_at: Time,
        disputed_transaction_id: String,
        explanation: String,
        idempotency_key: String | nil,
        loss: Increase::CardDispute::Loss | nil,
        rejection: Increase::CardDispute::Rejection | nil,
        status: Increase::CardDispute::Status,
        type: Increase::CardDispute::Type,
        win: Increase::CardDispute::Win | nil
      }
    end
  end

  def test_retrieve
    response = @increase.card_disputes.retrieve("card_dispute_id")

    assert_pattern do
      response => Increase::CardDispute
    end

    assert_pattern do
      response => {
        id: String,
        acceptance: Increase::CardDispute::Acceptance | nil,
        amount: Integer | nil,
        created_at: Time,
        disputed_transaction_id: String,
        explanation: String,
        idempotency_key: String | nil,
        loss: Increase::CardDispute::Loss | nil,
        rejection: Increase::CardDispute::Rejection | nil,
        status: Increase::CardDispute::Status,
        type: Increase::CardDispute::Type,
        win: Increase::CardDispute::Win | nil
      }
    end
  end

  def test_list
    response = @increase.card_disputes.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::CardDispute
    end

    assert_pattern do
      row => {
        id: String,
        acceptance: Increase::CardDispute::Acceptance | nil,
        amount: Integer | nil,
        created_at: Time,
        disputed_transaction_id: String,
        explanation: String,
        idempotency_key: String | nil,
        loss: Increase::CardDispute::Loss | nil,
        rejection: Increase::CardDispute::Rejection | nil,
        status: Increase::CardDispute::Status,
        type: Increase::CardDispute::Type,
        win: Increase::CardDispute::Win | nil
      }
    end
  end
end
