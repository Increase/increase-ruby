# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::InboundWireTransfersTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.inbound_wire_transfers.retrieve("inbound_wire_transfer_f228m6bmhtcxjco9pwp0")

    assert_pattern do
      response => Increase::InboundWireTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        created_at: Time,
        creditor_address_line1: String | nil,
        creditor_address_line2: String | nil,
        creditor_address_line3: String | nil,
        creditor_name: String | nil,
        debtor_address_line1: String | nil,
        debtor_address_line2: String | nil,
        debtor_address_line3: String | nil,
        debtor_name: String | nil,
        description: String,
        end_to_end_identification: String | nil,
        input_message_accountability_data: String | nil,
        instructing_agent_routing_number: String | nil,
        instruction_identification: String | nil,
        reversal: Increase::InboundWireTransfer::Reversal | nil,
        status: Increase::InboundWireTransfer::Status,
        type: Increase::InboundWireTransfer::Type,
        unique_end_to_end_transaction_reference: String | nil,
        unstructured_remittance_information: String | nil,
        wire_drawdown_request_id: String | nil
      }
    end
  end

  def test_list
    response = @increase.inbound_wire_transfers.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::InboundWireTransfer
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        created_at: Time,
        creditor_address_line1: String | nil,
        creditor_address_line2: String | nil,
        creditor_address_line3: String | nil,
        creditor_name: String | nil,
        debtor_address_line1: String | nil,
        debtor_address_line2: String | nil,
        debtor_address_line3: String | nil,
        debtor_name: String | nil,
        description: String,
        end_to_end_identification: String | nil,
        input_message_accountability_data: String | nil,
        instructing_agent_routing_number: String | nil,
        instruction_identification: String | nil,
        reversal: Increase::InboundWireTransfer::Reversal | nil,
        status: Increase::InboundWireTransfer::Status,
        type: Increase::InboundWireTransfer::Type,
        unique_end_to_end_transaction_reference: String | nil,
        unstructured_remittance_information: String | nil,
        wire_drawdown_request_id: String | nil
      }
    end
  end

  def test_reverse_required_params
    response =
      @increase.inbound_wire_transfers.reverse(
        "inbound_wire_transfer_f228m6bmhtcxjco9pwp0",
        reason: :creditor_request
      )

    assert_pattern do
      response => Increase::InboundWireTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        created_at: Time,
        creditor_address_line1: String | nil,
        creditor_address_line2: String | nil,
        creditor_address_line3: String | nil,
        creditor_name: String | nil,
        debtor_address_line1: String | nil,
        debtor_address_line2: String | nil,
        debtor_address_line3: String | nil,
        debtor_name: String | nil,
        description: String,
        end_to_end_identification: String | nil,
        input_message_accountability_data: String | nil,
        instructing_agent_routing_number: String | nil,
        instruction_identification: String | nil,
        reversal: Increase::InboundWireTransfer::Reversal | nil,
        status: Increase::InboundWireTransfer::Status,
        type: Increase::InboundWireTransfer::Type,
        unique_end_to_end_transaction_reference: String | nil,
        unstructured_remittance_information: String | nil,
        wire_drawdown_request_id: String | nil
      }
    end
  end
end
