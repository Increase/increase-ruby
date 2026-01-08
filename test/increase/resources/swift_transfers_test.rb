# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::SwiftTransfersTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.swift_transfers.create(
        account_id: "account_in71c4amph0vgo2qllky",
        account_number: "987654321",
        bank_identification_code: "ECBFDEFFTPP",
        creditor_address: {city: "Frankfurt", country: "DE", line1: "Sonnemannstrasse 20"},
        creditor_name: "Ian Crease",
        debtor_address: {city: "New York", country: "US", line1: "33 Liberty Street"},
        debtor_name: "National Phonograph Company",
        instructed_amount: 100,
        instructed_currency: :USD,
        source_account_number_id: "account_number_v18nkfqm6afpsrvy82b2",
        unstructured_remittance_information: "New Swift transfer"
      )

    assert_pattern do
      response => Increase::SwiftTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        bank_identification_code: String,
        created_at: Time,
        created_by: Increase::SwiftTransfer::CreatedBy,
        creditor_address: Increase::SwiftTransfer::CreditorAddress,
        creditor_name: String,
        debtor_address: Increase::SwiftTransfer::DebtorAddress,
        debtor_name: String,
        idempotency_key: String | nil,
        instructed_amount: Integer,
        instructed_currency: Increase::SwiftTransfer::InstructedCurrency,
        pending_transaction_id: String | nil,
        routing_number: String | nil,
        source_account_number_id: String,
        status: Increase::SwiftTransfer::Status,
        transaction_id: String | nil,
        type: Increase::SwiftTransfer::Type,
        unique_end_to_end_transaction_reference: String,
        unstructured_remittance_information: String
      }
    end
  end

  def test_retrieve
    response = @increase.swift_transfers.retrieve("swift_transfer_29h21xkng03788zwd3fh")

    assert_pattern do
      response => Increase::SwiftTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        bank_identification_code: String,
        created_at: Time,
        created_by: Increase::SwiftTransfer::CreatedBy,
        creditor_address: Increase::SwiftTransfer::CreditorAddress,
        creditor_name: String,
        debtor_address: Increase::SwiftTransfer::DebtorAddress,
        debtor_name: String,
        idempotency_key: String | nil,
        instructed_amount: Integer,
        instructed_currency: Increase::SwiftTransfer::InstructedCurrency,
        pending_transaction_id: String | nil,
        routing_number: String | nil,
        source_account_number_id: String,
        status: Increase::SwiftTransfer::Status,
        transaction_id: String | nil,
        type: Increase::SwiftTransfer::Type,
        unique_end_to_end_transaction_reference: String,
        unstructured_remittance_information: String
      }
    end
  end

  def test_list
    response = @increase.swift_transfers.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::SwiftTransfer
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        bank_identification_code: String,
        created_at: Time,
        created_by: Increase::SwiftTransfer::CreatedBy,
        creditor_address: Increase::SwiftTransfer::CreditorAddress,
        creditor_name: String,
        debtor_address: Increase::SwiftTransfer::DebtorAddress,
        debtor_name: String,
        idempotency_key: String | nil,
        instructed_amount: Integer,
        instructed_currency: Increase::SwiftTransfer::InstructedCurrency,
        pending_transaction_id: String | nil,
        routing_number: String | nil,
        source_account_number_id: String,
        status: Increase::SwiftTransfer::Status,
        transaction_id: String | nil,
        type: Increase::SwiftTransfer::Type,
        unique_end_to_end_transaction_reference: String,
        unstructured_remittance_information: String
      }
    end
  end

  def test_approve
    response = @increase.swift_transfers.approve("swift_transfer_29h21xkng03788zwd3fh")

    assert_pattern do
      response => Increase::SwiftTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        bank_identification_code: String,
        created_at: Time,
        created_by: Increase::SwiftTransfer::CreatedBy,
        creditor_address: Increase::SwiftTransfer::CreditorAddress,
        creditor_name: String,
        debtor_address: Increase::SwiftTransfer::DebtorAddress,
        debtor_name: String,
        idempotency_key: String | nil,
        instructed_amount: Integer,
        instructed_currency: Increase::SwiftTransfer::InstructedCurrency,
        pending_transaction_id: String | nil,
        routing_number: String | nil,
        source_account_number_id: String,
        status: Increase::SwiftTransfer::Status,
        transaction_id: String | nil,
        type: Increase::SwiftTransfer::Type,
        unique_end_to_end_transaction_reference: String,
        unstructured_remittance_information: String
      }
    end
  end

  def test_cancel
    response = @increase.swift_transfers.cancel("swift_transfer_29h21xkng03788zwd3fh")

    assert_pattern do
      response => Increase::SwiftTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        bank_identification_code: String,
        created_at: Time,
        created_by: Increase::SwiftTransfer::CreatedBy,
        creditor_address: Increase::SwiftTransfer::CreditorAddress,
        creditor_name: String,
        debtor_address: Increase::SwiftTransfer::DebtorAddress,
        debtor_name: String,
        idempotency_key: String | nil,
        instructed_amount: Integer,
        instructed_currency: Increase::SwiftTransfer::InstructedCurrency,
        pending_transaction_id: String | nil,
        routing_number: String | nil,
        source_account_number_id: String,
        status: Increase::SwiftTransfer::Status,
        transaction_id: String | nil,
        type: Increase::SwiftTransfer::Type,
        unique_end_to_end_transaction_reference: String,
        unstructured_remittance_information: String
      }
    end
  end
end
