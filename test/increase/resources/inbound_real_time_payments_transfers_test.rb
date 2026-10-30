# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::InboundRealTimePaymentsTransfersTest < Increase::Test::ResourceTest
  def test_retrieve
    response =
      @increase.inbound_real_time_payments_transfers.retrieve(
        "inbound_real_time_payments_transfer_63hlz498vcxg644hcrzr"
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
        end_to_end_identification: String | nil,
        return_of_real_time_payments_transfer_id: String | nil,
        status: Increase::InboundRealTimePaymentsTransfer::Status,
        transaction_identification: String,
        type: Increase::InboundRealTimePaymentsTransfer::Type,
        unstructured_remittance_information: String | nil
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
        end_to_end_identification: String | nil,
        return_of_real_time_payments_transfer_id: String | nil,
        status: Increase::InboundRealTimePaymentsTransfer::Status,
        transaction_identification: String,
        type: Increase::InboundRealTimePaymentsTransfer::Type,
        unstructured_remittance_information: String | nil
      }
    end
  end

  def test_return_
    response =
      @increase.inbound_real_time_payments_transfers.return_(
        "inbound_real_time_payments_transfer_63hlz498vcxg644hcrzr"
      )

    assert_pattern do
      response => Increase::RealTimePaymentsTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::RealTimePaymentsTransfer::Acknowledgement | nil,
        amount: Integer,
        approval: Increase::RealTimePaymentsTransfer::Approval | nil,
        cancellation: Increase::RealTimePaymentsTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::RealTimePaymentsTransfer::CreatedBy | nil,
        creditor_name: String,
        currency: Increase::RealTimePaymentsTransfer::Currency,
        debtor_name: String | nil,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        inbound_real_time_payments_request_for_payment_id: String | nil,
        pending_transaction_id: String | nil,
        rejection: Increase::RealTimePaymentsTransfer::Rejection | nil,
        return_of_inbound_real_time_payments_transfer_id: String | nil,
        routing_number: String,
        source_account_number_id: String,
        status: Increase::RealTimePaymentsTransfer::Status,
        submission: Increase::RealTimePaymentsTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::RealTimePaymentsTransfer::Type,
        ultimate_creditor_name: String | nil,
        ultimate_debtor_name: String | nil,
        unstructured_remittance_information: String
      }
    end
  end
end
