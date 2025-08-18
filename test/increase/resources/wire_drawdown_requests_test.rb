# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::WireDrawdownRequestsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.wire_drawdown_requests.create(
        account_number_id: "account_number_v18nkfqm6afpsrvy82b2",
        amount: 10_000,
        creditor_address: {city: "New York", country: "US", line1: "33 Liberty Street"},
        creditor_name: "National Phonograph Company",
        debtor_address: {city: "New York", country: "US", line1: "33 Liberty Street"},
        debtor_name: "Ian Crease",
        unstructured_remittance_information: "Invoice 29582"
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
        creditor_address: Increase::WireDrawdownRequest::CreditorAddress,
        creditor_name: String,
        currency: String,
        debtor_account_number: String,
        debtor_address: Increase::WireDrawdownRequest::DebtorAddress,
        debtor_name: String,
        debtor_routing_number: String,
        fulfillment_inbound_wire_transfer_id: String | nil,
        idempotency_key: String | nil,
        status: Increase::WireDrawdownRequest::Status,
        submission: Increase::WireDrawdownRequest::Submission | nil,
        type: Increase::WireDrawdownRequest::Type,
        unstructured_remittance_information: String
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
        creditor_address: Increase::WireDrawdownRequest::CreditorAddress,
        creditor_name: String,
        currency: String,
        debtor_account_number: String,
        debtor_address: Increase::WireDrawdownRequest::DebtorAddress,
        debtor_name: String,
        debtor_routing_number: String,
        fulfillment_inbound_wire_transfer_id: String | nil,
        idempotency_key: String | nil,
        status: Increase::WireDrawdownRequest::Status,
        submission: Increase::WireDrawdownRequest::Submission | nil,
        type: Increase::WireDrawdownRequest::Type,
        unstructured_remittance_information: String
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
        creditor_address: Increase::WireDrawdownRequest::CreditorAddress,
        creditor_name: String,
        currency: String,
        debtor_account_number: String,
        debtor_address: Increase::WireDrawdownRequest::DebtorAddress,
        debtor_name: String,
        debtor_routing_number: String,
        fulfillment_inbound_wire_transfer_id: String | nil,
        idempotency_key: String | nil,
        status: Increase::WireDrawdownRequest::Status,
        submission: Increase::WireDrawdownRequest::Submission | nil,
        type: Increase::WireDrawdownRequest::Type,
        unstructured_remittance_information: String
      }
    end
  end
end
