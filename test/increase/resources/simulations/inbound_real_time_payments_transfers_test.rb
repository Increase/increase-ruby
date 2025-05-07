# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::InboundRealTimePaymentsTransfersTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.simulations.inbound_real_time_payments_transfers.create(
        account_number_id: "account_number_v18nkfqm6afpsrvy82b2",
        amount: 1000
      )

    assert_pattern do
      response => Increase::InboundRealTimePaymentsTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        confirmation: Increase::InboundRealTimePaymentsTransfer::Confirmation | nil,
        created_at: Time,
        creditor_name: String,
        currency: Increase::InboundRealTimePaymentsTransfer::Currency,
        debtor_account_number: String,
        debtor_name: String,
        debtor_routing_number: String,
        decline: Increase::InboundRealTimePaymentsTransfer::Decline | nil,
        remittance_information: String | nil,
        status: Increase::InboundRealTimePaymentsTransfer::Status,
        transaction_identification: String,
        type: Increase::InboundRealTimePaymentsTransfer::Type
      }
    end
  end
end
