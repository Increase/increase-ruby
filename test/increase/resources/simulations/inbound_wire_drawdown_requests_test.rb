# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::InboundWireDrawdownRequestsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.simulations.inbound_wire_drawdown_requests.create(
        amount: 10_000,
        beneficiary_account_number: "987654321",
        beneficiary_routing_number: "101050001",
        currency: "USD",
        message_to_recipient: "Invoice 29582",
        originator_account_number: "987654321",
        originator_routing_number: "101050001",
        recipient_account_number_id: "account_number_v18nkfqm6afpsrvy82b2"
      )

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
end
