# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::RealTimePaymentsTransfersTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.real_time_payments_transfers.create(
        amount: 100,
        creditor_name: "Ian Crease",
        remittance_information: "Invoice 29582",
        source_account_number_id: "account_number_v18nkfqm6afpsrvy82b2"
      )

    assert_pattern do
      response => Increase::RealTimePaymentsTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        acknowledgement: Increase::RealTimePaymentsTransfer::Acknowledgement | nil,
        amount: Integer,
        approval: Increase::RealTimePaymentsTransfer::Approval | nil,
        cancellation: Increase::RealTimePaymentsTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::RealTimePaymentsTransfer::CreatedBy | nil,
        creditor_name: String,
        currency: Increase::RealTimePaymentsTransfer::Currency,
        debtor_name: String | nil,
        destination_account_number: String,
        destination_routing_number: String,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        pending_transaction_id: String | nil,
        rejection: Increase::RealTimePaymentsTransfer::Rejection | nil,
        remittance_information: String,
        source_account_number_id: String,
        status: Increase::RealTimePaymentsTransfer::Status,
        submission: Increase::RealTimePaymentsTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::RealTimePaymentsTransfer::Type,
        ultimate_creditor_name: String | nil,
        ultimate_debtor_name: String | nil
      }
    end
  end

  def test_retrieve
    response =
      @increase.real_time_payments_transfers.retrieve("real_time_payments_transfer_iyuhl5kdn7ssmup83mvq")

    assert_pattern do
      response => Increase::RealTimePaymentsTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        acknowledgement: Increase::RealTimePaymentsTransfer::Acknowledgement | nil,
        amount: Integer,
        approval: Increase::RealTimePaymentsTransfer::Approval | nil,
        cancellation: Increase::RealTimePaymentsTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::RealTimePaymentsTransfer::CreatedBy | nil,
        creditor_name: String,
        currency: Increase::RealTimePaymentsTransfer::Currency,
        debtor_name: String | nil,
        destination_account_number: String,
        destination_routing_number: String,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        pending_transaction_id: String | nil,
        rejection: Increase::RealTimePaymentsTransfer::Rejection | nil,
        remittance_information: String,
        source_account_number_id: String,
        status: Increase::RealTimePaymentsTransfer::Status,
        submission: Increase::RealTimePaymentsTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::RealTimePaymentsTransfer::Type,
        ultimate_creditor_name: String | nil,
        ultimate_debtor_name: String | nil
      }
    end
  end

  def test_list
    response = @increase.real_time_payments_transfers.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::RealTimePaymentsTransfer
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        acknowledgement: Increase::RealTimePaymentsTransfer::Acknowledgement | nil,
        amount: Integer,
        approval: Increase::RealTimePaymentsTransfer::Approval | nil,
        cancellation: Increase::RealTimePaymentsTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::RealTimePaymentsTransfer::CreatedBy | nil,
        creditor_name: String,
        currency: Increase::RealTimePaymentsTransfer::Currency,
        debtor_name: String | nil,
        destination_account_number: String,
        destination_routing_number: String,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        pending_transaction_id: String | nil,
        rejection: Increase::RealTimePaymentsTransfer::Rejection | nil,
        remittance_information: String,
        source_account_number_id: String,
        status: Increase::RealTimePaymentsTransfer::Status,
        submission: Increase::RealTimePaymentsTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::RealTimePaymentsTransfer::Type,
        ultimate_creditor_name: String | nil,
        ultimate_debtor_name: String | nil
      }
    end
  end

  def test_approve
    response =
      @increase.real_time_payments_transfers.approve("real_time_payments_transfer_iyuhl5kdn7ssmup83mvq")

    assert_pattern do
      response => Increase::RealTimePaymentsTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        acknowledgement: Increase::RealTimePaymentsTransfer::Acknowledgement | nil,
        amount: Integer,
        approval: Increase::RealTimePaymentsTransfer::Approval | nil,
        cancellation: Increase::RealTimePaymentsTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::RealTimePaymentsTransfer::CreatedBy | nil,
        creditor_name: String,
        currency: Increase::RealTimePaymentsTransfer::Currency,
        debtor_name: String | nil,
        destination_account_number: String,
        destination_routing_number: String,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        pending_transaction_id: String | nil,
        rejection: Increase::RealTimePaymentsTransfer::Rejection | nil,
        remittance_information: String,
        source_account_number_id: String,
        status: Increase::RealTimePaymentsTransfer::Status,
        submission: Increase::RealTimePaymentsTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::RealTimePaymentsTransfer::Type,
        ultimate_creditor_name: String | nil,
        ultimate_debtor_name: String | nil
      }
    end
  end

  def test_cancel
    response =
      @increase.real_time_payments_transfers.cancel("real_time_payments_transfer_iyuhl5kdn7ssmup83mvq")

    assert_pattern do
      response => Increase::RealTimePaymentsTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        acknowledgement: Increase::RealTimePaymentsTransfer::Acknowledgement | nil,
        amount: Integer,
        approval: Increase::RealTimePaymentsTransfer::Approval | nil,
        cancellation: Increase::RealTimePaymentsTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::RealTimePaymentsTransfer::CreatedBy | nil,
        creditor_name: String,
        currency: Increase::RealTimePaymentsTransfer::Currency,
        debtor_name: String | nil,
        destination_account_number: String,
        destination_routing_number: String,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        pending_transaction_id: String | nil,
        rejection: Increase::RealTimePaymentsTransfer::Rejection | nil,
        remittance_information: String,
        source_account_number_id: String,
        status: Increase::RealTimePaymentsTransfer::Status,
        submission: Increase::RealTimePaymentsTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::RealTimePaymentsTransfer::Type,
        ultimate_creditor_name: String | nil,
        ultimate_debtor_name: String | nil
      }
    end
  end
end
