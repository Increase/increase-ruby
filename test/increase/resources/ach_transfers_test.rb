# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::ACHTransfersTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.ach_transfers.create(
        account_id: "account_in71c4amph0vgo2qllky",
        amount: 100,
        statement_descriptor: "New ACH transfer"
      )

    assert_pattern do
      response => Increase::ACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::ACHTransfer::Acknowledgement | nil,
        addenda: Increase::ACHTransfer::Addenda | nil,
        amount: Integer,
        approval: Increase::ACHTransfer::Approval | nil,
        cancellation: Increase::ACHTransfer::Cancellation | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_id: String,
        company_name: String | nil,
        created_at: Time,
        created_by: Increase::ACHTransfer::CreatedBy | nil,
        currency: Increase::ACHTransfer::Currency,
        destination_account_holder: Increase::ACHTransfer::DestinationAccountHolder,
        external_account_id: String | nil,
        funding: Increase::ACHTransfer::Funding,
        idempotency_key: String | nil,
        inbound_funds_hold: Increase::ACHTransfer::InboundFundsHold | nil,
        individual_id: String | nil,
        individual_name: String | nil,
        network: Increase::ACHTransfer::Network,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::ACHTransfer::NotificationsOfChange]),
        pending_transaction_id: String | nil,
        preferred_effective_date: Increase::ACHTransfer::PreferredEffectiveDate,
        return_: Increase::ACHTransfer::Return | nil,
        routing_number: String,
        settlement: Increase::ACHTransfer::Settlement | nil,
        standard_entry_class_code: Increase::ACHTransfer::StandardEntryClassCode,
        statement_descriptor: String,
        status: Increase::ACHTransfer::Status,
        submission: Increase::ACHTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::ACHTransfer::Type
      }
    end
  end

  def test_retrieve
    response = @increase.ach_transfers.retrieve("ach_transfer_uoxatyh3lt5evrsdvo7q")

    assert_pattern do
      response => Increase::ACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::ACHTransfer::Acknowledgement | nil,
        addenda: Increase::ACHTransfer::Addenda | nil,
        amount: Integer,
        approval: Increase::ACHTransfer::Approval | nil,
        cancellation: Increase::ACHTransfer::Cancellation | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_id: String,
        company_name: String | nil,
        created_at: Time,
        created_by: Increase::ACHTransfer::CreatedBy | nil,
        currency: Increase::ACHTransfer::Currency,
        destination_account_holder: Increase::ACHTransfer::DestinationAccountHolder,
        external_account_id: String | nil,
        funding: Increase::ACHTransfer::Funding,
        idempotency_key: String | nil,
        inbound_funds_hold: Increase::ACHTransfer::InboundFundsHold | nil,
        individual_id: String | nil,
        individual_name: String | nil,
        network: Increase::ACHTransfer::Network,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::ACHTransfer::NotificationsOfChange]),
        pending_transaction_id: String | nil,
        preferred_effective_date: Increase::ACHTransfer::PreferredEffectiveDate,
        return_: Increase::ACHTransfer::Return | nil,
        routing_number: String,
        settlement: Increase::ACHTransfer::Settlement | nil,
        standard_entry_class_code: Increase::ACHTransfer::StandardEntryClassCode,
        statement_descriptor: String,
        status: Increase::ACHTransfer::Status,
        submission: Increase::ACHTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::ACHTransfer::Type
      }
    end
  end

  def test_list
    response = @increase.ach_transfers.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::ACHTransfer
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::ACHTransfer::Acknowledgement | nil,
        addenda: Increase::ACHTransfer::Addenda | nil,
        amount: Integer,
        approval: Increase::ACHTransfer::Approval | nil,
        cancellation: Increase::ACHTransfer::Cancellation | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_id: String,
        company_name: String | nil,
        created_at: Time,
        created_by: Increase::ACHTransfer::CreatedBy | nil,
        currency: Increase::ACHTransfer::Currency,
        destination_account_holder: Increase::ACHTransfer::DestinationAccountHolder,
        external_account_id: String | nil,
        funding: Increase::ACHTransfer::Funding,
        idempotency_key: String | nil,
        inbound_funds_hold: Increase::ACHTransfer::InboundFundsHold | nil,
        individual_id: String | nil,
        individual_name: String | nil,
        network: Increase::ACHTransfer::Network,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::ACHTransfer::NotificationsOfChange]),
        pending_transaction_id: String | nil,
        preferred_effective_date: Increase::ACHTransfer::PreferredEffectiveDate,
        return_: Increase::ACHTransfer::Return | nil,
        routing_number: String,
        settlement: Increase::ACHTransfer::Settlement | nil,
        standard_entry_class_code: Increase::ACHTransfer::StandardEntryClassCode,
        statement_descriptor: String,
        status: Increase::ACHTransfer::Status,
        submission: Increase::ACHTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::ACHTransfer::Type
      }
    end
  end

  def test_approve
    response = @increase.ach_transfers.approve("ach_transfer_uoxatyh3lt5evrsdvo7q")

    assert_pattern do
      response => Increase::ACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::ACHTransfer::Acknowledgement | nil,
        addenda: Increase::ACHTransfer::Addenda | nil,
        amount: Integer,
        approval: Increase::ACHTransfer::Approval | nil,
        cancellation: Increase::ACHTransfer::Cancellation | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_id: String,
        company_name: String | nil,
        created_at: Time,
        created_by: Increase::ACHTransfer::CreatedBy | nil,
        currency: Increase::ACHTransfer::Currency,
        destination_account_holder: Increase::ACHTransfer::DestinationAccountHolder,
        external_account_id: String | nil,
        funding: Increase::ACHTransfer::Funding,
        idempotency_key: String | nil,
        inbound_funds_hold: Increase::ACHTransfer::InboundFundsHold | nil,
        individual_id: String | nil,
        individual_name: String | nil,
        network: Increase::ACHTransfer::Network,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::ACHTransfer::NotificationsOfChange]),
        pending_transaction_id: String | nil,
        preferred_effective_date: Increase::ACHTransfer::PreferredEffectiveDate,
        return_: Increase::ACHTransfer::Return | nil,
        routing_number: String,
        settlement: Increase::ACHTransfer::Settlement | nil,
        standard_entry_class_code: Increase::ACHTransfer::StandardEntryClassCode,
        statement_descriptor: String,
        status: Increase::ACHTransfer::Status,
        submission: Increase::ACHTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::ACHTransfer::Type
      }
    end
  end

  def test_cancel
    response = @increase.ach_transfers.cancel("ach_transfer_uoxatyh3lt5evrsdvo7q")

    assert_pattern do
      response => Increase::ACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::ACHTransfer::Acknowledgement | nil,
        addenda: Increase::ACHTransfer::Addenda | nil,
        amount: Integer,
        approval: Increase::ACHTransfer::Approval | nil,
        cancellation: Increase::ACHTransfer::Cancellation | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_id: String,
        company_name: String | nil,
        created_at: Time,
        created_by: Increase::ACHTransfer::CreatedBy | nil,
        currency: Increase::ACHTransfer::Currency,
        destination_account_holder: Increase::ACHTransfer::DestinationAccountHolder,
        external_account_id: String | nil,
        funding: Increase::ACHTransfer::Funding,
        idempotency_key: String | nil,
        inbound_funds_hold: Increase::ACHTransfer::InboundFundsHold | nil,
        individual_id: String | nil,
        individual_name: String | nil,
        network: Increase::ACHTransfer::Network,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::ACHTransfer::NotificationsOfChange]),
        pending_transaction_id: String | nil,
        preferred_effective_date: Increase::ACHTransfer::PreferredEffectiveDate,
        return_: Increase::ACHTransfer::Return | nil,
        routing_number: String,
        settlement: Increase::ACHTransfer::Settlement | nil,
        standard_entry_class_code: Increase::ACHTransfer::StandardEntryClassCode,
        statement_descriptor: String,
        status: Increase::ACHTransfer::Status,
        submission: Increase::ACHTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::ACHTransfer::Type
      }
    end
  end
end
