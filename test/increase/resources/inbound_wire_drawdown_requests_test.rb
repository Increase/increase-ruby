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
        beneficiary_account_number: String,
        beneficiary_address_line1: String | nil,
        beneficiary_address_line2: String | nil,
        beneficiary_address_line3: String | nil,
        beneficiary_name: String | nil,
        beneficiary_routing_number: String,
        created_at: Time,
        currency: String,
        message_to_recipient: String | nil,
        originator_account_number: String | nil,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
        originator_routing_number: String,
        originator_to_beneficiary_information_line1: String | nil,
        originator_to_beneficiary_information_line2: String | nil,
        originator_to_beneficiary_information_line3: String | nil,
        originator_to_beneficiary_information_line4: String | nil,
        recipient_account_number_id: String,
        type: Increase::InboundWireDrawdownRequest::Type
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
        beneficiary_account_number: String,
        beneficiary_address_line1: String | nil,
        beneficiary_address_line2: String | nil,
        beneficiary_address_line3: String | nil,
        beneficiary_name: String | nil,
        beneficiary_routing_number: String,
        created_at: Time,
        currency: String,
        message_to_recipient: String | nil,
        originator_account_number: String | nil,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
        originator_routing_number: String,
        originator_to_beneficiary_information_line1: String | nil,
        originator_to_beneficiary_information_line2: String | nil,
        originator_to_beneficiary_information_line3: String | nil,
        originator_to_beneficiary_information_line4: String | nil,
        recipient_account_number_id: String,
        type: Increase::InboundWireDrawdownRequest::Type
      }
    end
  end
end
