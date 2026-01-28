# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::CardDisputesTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.card_disputes.create(
        disputed_transaction_id: "transaction_uyrp7fld2ium70oa7oi",
        network: :visa
      )

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

  def test_retrieve
    response = @increase.card_disputes.retrieve("card_dispute_h9sc95nbl1cgltpp7men")

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

  def test_submit_user_submission_required_params
    response =
      @increase.card_disputes.submit_user_submission("card_dispute_h9sc95nbl1cgltpp7men", network: :visa)

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

  def test_withdraw
    response = @increase.card_disputes.withdraw("card_dispute_h9sc95nbl1cgltpp7men")

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
