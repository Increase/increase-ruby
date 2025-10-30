# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::WireTransfersTest < Increase::Test::ResourceTest
  def test_reverse
    response = @increase.simulations.wire_transfers.reverse("wire_transfer_5akynk7dqsq25qwk9q2u")

    assert_pattern do
      response => Increase::WireTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        approval: Increase::WireTransfer::Approval | nil,
        cancellation: Increase::WireTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::WireTransfer::CreatedBy | nil,
        creditor: Increase::WireTransfer::Creditor | nil,
        currency: Increase::WireTransfer::Currency,
        debtor: Increase::WireTransfer::Debtor | nil,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        inbound_wire_drawdown_request_id: String | nil,
        network: Increase::WireTransfer::Network,
        pending_transaction_id: String | nil,
        remittance: Increase::WireTransfer::Remittance | nil,
        reversal: Increase::WireTransfer::Reversal | nil,
        routing_number: String,
        source_account_number_id: String | nil,
        status: Increase::WireTransfer::Status,
        submission: Increase::WireTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::WireTransfer::Type
      }
    end
  end

  def test_submit
    response = @increase.simulations.wire_transfers.submit("wire_transfer_5akynk7dqsq25qwk9q2u")

    assert_pattern do
      response => Increase::WireTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        approval: Increase::WireTransfer::Approval | nil,
        cancellation: Increase::WireTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::WireTransfer::CreatedBy | nil,
        creditor: Increase::WireTransfer::Creditor | nil,
        currency: Increase::WireTransfer::Currency,
        debtor: Increase::WireTransfer::Debtor | nil,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        inbound_wire_drawdown_request_id: String | nil,
        network: Increase::WireTransfer::Network,
        pending_transaction_id: String | nil,
        remittance: Increase::WireTransfer::Remittance | nil,
        reversal: Increase::WireTransfer::Reversal | nil,
        routing_number: String,
        source_account_number_id: String | nil,
        status: Increase::WireTransfer::Status,
        submission: Increase::WireTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::WireTransfer::Type
      }
    end
  end
end
