# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::InboundRealTimePaymentsTransfersTest < Increase::Test::ResourceTest
  def test_retrieve
    response =
      @increase.inbound_real_time_payments_transfers.retrieve("inbound_real_time_payments_transfer_id")

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

  def test_list
    response = @increase.inbound_real_time_payments_transfers.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::InboundRealTimePaymentsTransfer
    end

    assert_pattern do
      row => {
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
