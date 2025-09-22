# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::WireTransfersTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.wire_transfers.create(
        account_id: "account_in71c4amph0vgo2qllky",
        amount: 100,
        beneficiary_name: "Ian Crease"
      )

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
        beneficiary_address_line1: String | nil,
        beneficiary_address_line2: String | nil,
        beneficiary_address_line3: String | nil,
        beneficiary_name: String | nil,
        cancellation: Increase::WireTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::WireTransfer::CreatedBy | nil,
        currency: Increase::WireTransfer::Currency,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        inbound_wire_drawdown_request_id: String | nil,
        message_to_recipient: String,
        network: Increase::WireTransfer::Network,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
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

  def test_retrieve
    response = @increase.wire_transfers.retrieve("wire_transfer_5akynk7dqsq25qwk9q2u")

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
        beneficiary_address_line1: String | nil,
        beneficiary_address_line2: String | nil,
        beneficiary_address_line3: String | nil,
        beneficiary_name: String | nil,
        cancellation: Increase::WireTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::WireTransfer::CreatedBy | nil,
        currency: Increase::WireTransfer::Currency,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        inbound_wire_drawdown_request_id: String | nil,
        message_to_recipient: String,
        network: Increase::WireTransfer::Network,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
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

  def test_list
    response = @increase.wire_transfers.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::WireTransfer
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        approval: Increase::WireTransfer::Approval | nil,
        beneficiary_address_line1: String | nil,
        beneficiary_address_line2: String | nil,
        beneficiary_address_line3: String | nil,
        beneficiary_name: String | nil,
        cancellation: Increase::WireTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::WireTransfer::CreatedBy | nil,
        currency: Increase::WireTransfer::Currency,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        inbound_wire_drawdown_request_id: String | nil,
        message_to_recipient: String,
        network: Increase::WireTransfer::Network,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
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

  def test_approve
    response = @increase.wire_transfers.approve("wire_transfer_5akynk7dqsq25qwk9q2u")

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
        beneficiary_address_line1: String | nil,
        beneficiary_address_line2: String | nil,
        beneficiary_address_line3: String | nil,
        beneficiary_name: String | nil,
        cancellation: Increase::WireTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::WireTransfer::CreatedBy | nil,
        currency: Increase::WireTransfer::Currency,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        inbound_wire_drawdown_request_id: String | nil,
        message_to_recipient: String,
        network: Increase::WireTransfer::Network,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
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

  def test_cancel
    response = @increase.wire_transfers.cancel("wire_transfer_5akynk7dqsq25qwk9q2u")

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
        beneficiary_address_line1: String | nil,
        beneficiary_address_line2: String | nil,
        beneficiary_address_line3: String | nil,
        beneficiary_name: String | nil,
        cancellation: Increase::WireTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::WireTransfer::CreatedBy | nil,
        currency: Increase::WireTransfer::Currency,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        inbound_wire_drawdown_request_id: String | nil,
        message_to_recipient: String,
        network: Increase::WireTransfer::Network,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
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
