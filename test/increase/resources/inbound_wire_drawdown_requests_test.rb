# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::InboundWireDrawdownRequestsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.inbound_wire_drawdown_requests.retrieve("inbound_wire_drawdown_request_id")

    assert_pattern do
      response => Increase::InboundWireDrawdownRequest
    end

    assert_pattern do
      response => {
        id: String,
        amount: Integer,
        created_at: Time,
        creditor_account_number: String,
        creditor_address_line1: String | nil,
        creditor_address_line2: String | nil,
        creditor_address_line3: String | nil,
        creditor_name: String | nil,
        creditor_routing_number: String,
        currency: String,
        debtor_address_line1: String | nil,
        debtor_address_line2: String | nil,
        debtor_address_line3: String | nil,
        debtor_name: String | nil,
        end_to_end_identification: String | nil,
        input_message_accountability_data: String | nil,
        instruction_identification: String | nil,
        recipient_account_number_id: String,
        type: Increase::InboundWireDrawdownRequest::Type,
        unique_end_to_end_transaction_reference: String | nil,
        unstructured_remittance_information: String | nil
      }
    end
  end

  def test_list
    response = @increase.inbound_wire_drawdown_requests.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::InboundWireDrawdownRequest
    end

    assert_pattern do
      row => {
        id: String,
        amount: Integer,
        created_at: Time,
        creditor_account_number: String,
        creditor_address_line1: String | nil,
        creditor_address_line2: String | nil,
        creditor_address_line3: String | nil,
        creditor_name: String | nil,
        creditor_routing_number: String,
        currency: String,
        debtor_address_line1: String | nil,
        debtor_address_line2: String | nil,
        debtor_address_line3: String | nil,
        debtor_name: String | nil,
        end_to_end_identification: String | nil,
        input_message_accountability_data: String | nil,
        instruction_identification: String | nil,
        recipient_account_number_id: String,
        type: Increase::InboundWireDrawdownRequest::Type,
        unique_end_to_end_transaction_reference: String | nil,
        unstructured_remittance_information: String | nil
      }
    end
  end
end
