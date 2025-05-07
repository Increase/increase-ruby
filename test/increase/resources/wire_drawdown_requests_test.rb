# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::WireDrawdownRequestsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.wire_drawdown_requests.create(
        account_number_id: "account_number_v18nkfqm6afpsrvy82b2",
        amount: 10_000,
        message_to_recipient: "Invoice 29582",
        recipient_account_number: "987654321",
        recipient_name: "Ian Crease",
        recipient_routing_number: "101050001"
      )

    assert_pattern do
      response => Increase::WireDrawdownRequest
    end

    assert_pattern do
      response => {
        id: String,
        account_number_id: String,
        amount: Integer,
        created_at: Time,
        currency: String,
        fulfillment_inbound_wire_transfer_id: String | nil,
        idempotency_key: String | nil,
        message_to_recipient: String,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
        recipient_account_number: String,
        recipient_address_line1: String | nil,
        recipient_address_line2: String | nil,
        recipient_address_line3: String | nil,
        recipient_name: String | nil,
        recipient_routing_number: String,
        status: Increase::WireDrawdownRequest::Status,
        submission: Increase::WireDrawdownRequest::Submission | nil,
        type: Increase::WireDrawdownRequest::Type
      }
    end
  end

  def test_retrieve
    response = @increase.wire_drawdown_requests.retrieve("wire_drawdown_request_id")

    assert_pattern do
      response => Increase::WireDrawdownRequest
    end

    assert_pattern do
      response => {
        id: String,
        account_number_id: String,
        amount: Integer,
        created_at: Time,
        currency: String,
        fulfillment_inbound_wire_transfer_id: String | nil,
        idempotency_key: String | nil,
        message_to_recipient: String,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
        recipient_account_number: String,
        recipient_address_line1: String | nil,
        recipient_address_line2: String | nil,
        recipient_address_line3: String | nil,
        recipient_name: String | nil,
        recipient_routing_number: String,
        status: Increase::WireDrawdownRequest::Status,
        submission: Increase::WireDrawdownRequest::Submission | nil,
        type: Increase::WireDrawdownRequest::Type
      }
    end
  end

  def test_list
    response = @increase.wire_drawdown_requests.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::WireDrawdownRequest
    end

    assert_pattern do
      row => {
        id: String,
        account_number_id: String,
        amount: Integer,
        created_at: Time,
        currency: String,
        fulfillment_inbound_wire_transfer_id: String | nil,
        idempotency_key: String | nil,
        message_to_recipient: String,
        originator_address_line1: String | nil,
        originator_address_line2: String | nil,
        originator_address_line3: String | nil,
        originator_name: String | nil,
        recipient_account_number: String,
        recipient_address_line1: String | nil,
        recipient_address_line2: String | nil,
        recipient_address_line3: String | nil,
        recipient_name: String | nil,
        recipient_routing_number: String,
        status: Increase::WireDrawdownRequest::Status,
        submission: Increase::WireDrawdownRequest::Submission | nil,
        type: Increase::WireDrawdownRequest::Type
      }
    end
  end
end
