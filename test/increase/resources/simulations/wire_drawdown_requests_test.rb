# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::WireDrawdownRequestsTest < Increase::Test::ResourceTest
  def test_refuse
    response = @increase.simulations.wire_drawdown_requests.refuse("wire_drawdown_request_id")

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
        debtor_external_account_id: String | nil,
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
