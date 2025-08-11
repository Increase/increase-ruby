# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::InboundWireTransfersTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.inbound_wire_transfers.retrieve("inbound_wire_transfer_id")

    assert_pattern do
      response => Increase::InboundWireTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        beneficiary_address_line1: String | nil,
        beneficiary_address_line2: String | nil,
        beneficiary_address_line3: String | nil,
        beneficiary_name: String | nil,
        beneficiary_reference: String | nil,
        created_at: Time,
        description: String,
        input_message_accountability_data: String | nil,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
        originator_routing_number: String | nil,
        originator_to_beneficiary_information: String | nil,
        originator_to_beneficiary_information_line1: String | nil,
        originator_to_beneficiary_information_line2: String | nil,
        originator_to_beneficiary_information_line3: String | nil,
        originator_to_beneficiary_information_line4: String | nil,
        reversal: Increase::InboundWireTransfer::Reversal | nil,
        sender_reference: String | nil,
        status: Increase::InboundWireTransfer::Status,
        type: Increase::InboundWireTransfer::Type,
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
        beneficiary_address_line1: String | nil,
        beneficiary_address_line2: String | nil,
        beneficiary_address_line3: String | nil,
        beneficiary_name: String | nil,
        beneficiary_reference: String | nil,
        created_at: Time,
        description: String,
        input_message_accountability_data: String | nil,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
        originator_routing_number: String | nil,
        originator_to_beneficiary_information: String | nil,
        originator_to_beneficiary_information_line1: String | nil,
        originator_to_beneficiary_information_line2: String | nil,
        originator_to_beneficiary_information_line3: String | nil,
        originator_to_beneficiary_information_line4: String | nil,
        reversal: Increase::InboundWireTransfer::Reversal | nil,
        sender_reference: String | nil,
        status: Increase::InboundWireTransfer::Status,
        type: Increase::InboundWireTransfer::Type,
        wire_drawdown_request_id: String | nil
      }
    end
  end

  def test_reverse_required_params
    response =
      @increase.inbound_wire_transfers.reverse("inbound_wire_transfer_id", reason: :creditor_request)

    assert_pattern do
      response => Increase::InboundWireTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        beneficiary_address_line1: String | nil,
        beneficiary_address_line2: String | nil,
        beneficiary_address_line3: String | nil,
        beneficiary_name: String | nil,
        beneficiary_reference: String | nil,
        created_at: Time,
        description: String,
        input_message_accountability_data: String | nil,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
        originator_routing_number: String | nil,
        originator_to_beneficiary_information: String | nil,
        originator_to_beneficiary_information_line1: String | nil,
        originator_to_beneficiary_information_line2: String | nil,
        originator_to_beneficiary_information_line3: String | nil,
        originator_to_beneficiary_information_line4: String | nil,
        reversal: Increase::InboundWireTransfer::Reversal | nil,
        sender_reference: String | nil,
        status: Increase::InboundWireTransfer::Status,
        type: Increase::InboundWireTransfer::Type,
        wire_drawdown_request_id: String | nil
      }
    end
  end
end
