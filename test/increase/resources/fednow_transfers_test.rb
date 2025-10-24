# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::FednowTransfersTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.fednow_transfers.create(
        account_id: "account_in71c4amph0vgo2qllky",
        amount: 100,
        creditor_name: "Ian Crease",
        debtor_name: "National Phonograph Company",
        source_account_number_id: "account_number_v18nkfqm6afpsrvy82b2",
        unstructured_remittance_information: "Invoice 29582"
      )

    assert_pattern do
      response => Increase::FednowTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::FednowTransfer::Acknowledgement | nil,
        amount: Integer,
        created_at: Time,
        created_by: Increase::FednowTransfer::CreatedBy | nil,
        creditor_name: String,
        currency: Increase::FednowTransfer::Currency,
        debtor_name: String,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        pending_transaction_id: String | nil,
        rejection: Increase::FednowTransfer::Rejection | nil,
        routing_number: String,
        source_account_number_id: String,
        status: Increase::FednowTransfer::Status,
        submission: Increase::FednowTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::FednowTransfer::Type,
        unique_end_to_end_transaction_reference: String,
        unstructured_remittance_information: String
      }
    end
  end

  def test_retrieve
    response = @increase.fednow_transfers.retrieve("fednow_transfer_4i0mptrdu1mueg1196bg")

    assert_pattern do
      response => Increase::FednowTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::FednowTransfer::Acknowledgement | nil,
        amount: Integer,
        created_at: Time,
        created_by: Increase::FednowTransfer::CreatedBy | nil,
        creditor_name: String,
        currency: Increase::FednowTransfer::Currency,
        debtor_name: String,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        pending_transaction_id: String | nil,
        rejection: Increase::FednowTransfer::Rejection | nil,
        routing_number: String,
        source_account_number_id: String,
        status: Increase::FednowTransfer::Status,
        submission: Increase::FednowTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::FednowTransfer::Type,
        unique_end_to_end_transaction_reference: String,
        unstructured_remittance_information: String
      }
    end
  end

  def test_list
    response = @increase.fednow_transfers.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::FednowTransfer
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::FednowTransfer::Acknowledgement | nil,
        amount: Integer,
        created_at: Time,
        created_by: Increase::FednowTransfer::CreatedBy | nil,
        creditor_name: String,
        currency: Increase::FednowTransfer::Currency,
        debtor_name: String,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        pending_transaction_id: String | nil,
        rejection: Increase::FednowTransfer::Rejection | nil,
        routing_number: String,
        source_account_number_id: String,
        status: Increase::FednowTransfer::Status,
        submission: Increase::FednowTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::FednowTransfer::Type,
        unique_end_to_end_transaction_reference: String,
        unstructured_remittance_information: String
      }
    end
  end

  def test_approve
    response = @increase.fednow_transfers.approve("fednow_transfer_4i0mptrdu1mueg1196bg")

    assert_pattern do
      response => Increase::FednowTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::FednowTransfer::Acknowledgement | nil,
        amount: Integer,
        created_at: Time,
        created_by: Increase::FednowTransfer::CreatedBy | nil,
        creditor_name: String,
        currency: Increase::FednowTransfer::Currency,
        debtor_name: String,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        pending_transaction_id: String | nil,
        rejection: Increase::FednowTransfer::Rejection | nil,
        routing_number: String,
        source_account_number_id: String,
        status: Increase::FednowTransfer::Status,
        submission: Increase::FednowTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::FednowTransfer::Type,
        unique_end_to_end_transaction_reference: String,
        unstructured_remittance_information: String
      }
    end
  end

  def test_cancel
    response = @increase.fednow_transfers.cancel("fednow_transfer_4i0mptrdu1mueg1196bg")

    assert_pattern do
      response => Increase::FednowTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::FednowTransfer::Acknowledgement | nil,
        amount: Integer,
        created_at: Time,
        created_by: Increase::FednowTransfer::CreatedBy | nil,
        creditor_name: String,
        currency: Increase::FednowTransfer::Currency,
        debtor_name: String,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        pending_transaction_id: String | nil,
        rejection: Increase::FednowTransfer::Rejection | nil,
        routing_number: String,
        source_account_number_id: String,
        status: Increase::FednowTransfer::Status,
        submission: Increase::FednowTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::FednowTransfer::Type,
        unique_end_to_end_transaction_reference: String,
        unstructured_remittance_information: String
      }
    end
  end
end
