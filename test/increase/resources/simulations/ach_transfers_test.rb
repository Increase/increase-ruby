# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::ACHTransfersTest < Increase::Test::ResourceTest
  def test_acknowledge
    response = @increase.simulations.ach_transfers.acknowledge("ach_transfer_id")

    assert_pattern do
      response => Increase::Models::ACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::Models::ACHTransfer::Acknowledgement | nil,
        addenda: Increase::Models::ACHTransfer::Addenda | nil,
        amount: Integer,
        approval: Increase::Models::ACHTransfer::Approval | nil,
        cancellation: Increase::Models::ACHTransfer::Cancellation | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_name: String | nil,
        created_at: Time,
        created_by: Increase::Models::ACHTransfer::CreatedBy | nil,
        currency: Increase::Models::ACHTransfer::Currency,
        destination_account_holder: Increase::Models::ACHTransfer::DestinationAccountHolder,
        external_account_id: String | nil,
        funding: Increase::Models::ACHTransfer::Funding,
        idempotency_key: String | nil,
        inbound_funds_hold: Increase::Models::ACHTransfer::InboundFundsHold | nil,
        individual_id: String | nil,
        individual_name: String | nil,
        network: Increase::Models::ACHTransfer::Network,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::Models::ACHTransfer::NotificationsOfChange]),
        pending_transaction_id: String | nil,
        preferred_effective_date: Increase::Models::ACHTransfer::PreferredEffectiveDate,
        return_: Increase::Models::ACHTransfer::Return | nil,
        routing_number: String,
        settlement: Increase::Models::ACHTransfer::Settlement | nil,
        standard_entry_class_code: Increase::Models::ACHTransfer::StandardEntryClassCode,
        statement_descriptor: String,
        status: Increase::Models::ACHTransfer::Status,
        submission: Increase::Models::ACHTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::Models::ACHTransfer::Type
      }
    end
  end

  def test_create_notification_of_change_required_params
    response =
      @increase.simulations.ach_transfers.create_notification_of_change(
        "ach_transfer_id",
        change_code: :incorrect_account_number,
        corrected_data: "123456789"
      )

    assert_pattern do
      response => Increase::Models::ACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::Models::ACHTransfer::Acknowledgement | nil,
        addenda: Increase::Models::ACHTransfer::Addenda | nil,
        amount: Integer,
        approval: Increase::Models::ACHTransfer::Approval | nil,
        cancellation: Increase::Models::ACHTransfer::Cancellation | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_name: String | nil,
        created_at: Time,
        created_by: Increase::Models::ACHTransfer::CreatedBy | nil,
        currency: Increase::Models::ACHTransfer::Currency,
        destination_account_holder: Increase::Models::ACHTransfer::DestinationAccountHolder,
        external_account_id: String | nil,
        funding: Increase::Models::ACHTransfer::Funding,
        idempotency_key: String | nil,
        inbound_funds_hold: Increase::Models::ACHTransfer::InboundFundsHold | nil,
        individual_id: String | nil,
        individual_name: String | nil,
        network: Increase::Models::ACHTransfer::Network,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::Models::ACHTransfer::NotificationsOfChange]),
        pending_transaction_id: String | nil,
        preferred_effective_date: Increase::Models::ACHTransfer::PreferredEffectiveDate,
        return_: Increase::Models::ACHTransfer::Return | nil,
        routing_number: String,
        settlement: Increase::Models::ACHTransfer::Settlement | nil,
        standard_entry_class_code: Increase::Models::ACHTransfer::StandardEntryClassCode,
        statement_descriptor: String,
        status: Increase::Models::ACHTransfer::Status,
        submission: Increase::Models::ACHTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::Models::ACHTransfer::Type
      }
    end
  end

  def test_return_
    response = @increase.simulations.ach_transfers.return_("ach_transfer_id")

    assert_pattern do
      response => Increase::Models::ACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::Models::ACHTransfer::Acknowledgement | nil,
        addenda: Increase::Models::ACHTransfer::Addenda | nil,
        amount: Integer,
        approval: Increase::Models::ACHTransfer::Approval | nil,
        cancellation: Increase::Models::ACHTransfer::Cancellation | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_name: String | nil,
        created_at: Time,
        created_by: Increase::Models::ACHTransfer::CreatedBy | nil,
        currency: Increase::Models::ACHTransfer::Currency,
        destination_account_holder: Increase::Models::ACHTransfer::DestinationAccountHolder,
        external_account_id: String | nil,
        funding: Increase::Models::ACHTransfer::Funding,
        idempotency_key: String | nil,
        inbound_funds_hold: Increase::Models::ACHTransfer::InboundFundsHold | nil,
        individual_id: String | nil,
        individual_name: String | nil,
        network: Increase::Models::ACHTransfer::Network,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::Models::ACHTransfer::NotificationsOfChange]),
        pending_transaction_id: String | nil,
        preferred_effective_date: Increase::Models::ACHTransfer::PreferredEffectiveDate,
        return_: Increase::Models::ACHTransfer::Return | nil,
        routing_number: String,
        settlement: Increase::Models::ACHTransfer::Settlement | nil,
        standard_entry_class_code: Increase::Models::ACHTransfer::StandardEntryClassCode,
        statement_descriptor: String,
        status: Increase::Models::ACHTransfer::Status,
        submission: Increase::Models::ACHTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::Models::ACHTransfer::Type
      }
    end
  end

  def test_settle
    response = @increase.simulations.ach_transfers.settle("ach_transfer_id")

    assert_pattern do
      response => Increase::Models::ACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::Models::ACHTransfer::Acknowledgement | nil,
        addenda: Increase::Models::ACHTransfer::Addenda | nil,
        amount: Integer,
        approval: Increase::Models::ACHTransfer::Approval | nil,
        cancellation: Increase::Models::ACHTransfer::Cancellation | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_name: String | nil,
        created_at: Time,
        created_by: Increase::Models::ACHTransfer::CreatedBy | nil,
        currency: Increase::Models::ACHTransfer::Currency,
        destination_account_holder: Increase::Models::ACHTransfer::DestinationAccountHolder,
        external_account_id: String | nil,
        funding: Increase::Models::ACHTransfer::Funding,
        idempotency_key: String | nil,
        inbound_funds_hold: Increase::Models::ACHTransfer::InboundFundsHold | nil,
        individual_id: String | nil,
        individual_name: String | nil,
        network: Increase::Models::ACHTransfer::Network,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::Models::ACHTransfer::NotificationsOfChange]),
        pending_transaction_id: String | nil,
        preferred_effective_date: Increase::Models::ACHTransfer::PreferredEffectiveDate,
        return_: Increase::Models::ACHTransfer::Return | nil,
        routing_number: String,
        settlement: Increase::Models::ACHTransfer::Settlement | nil,
        standard_entry_class_code: Increase::Models::ACHTransfer::StandardEntryClassCode,
        statement_descriptor: String,
        status: Increase::Models::ACHTransfer::Status,
        submission: Increase::Models::ACHTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::Models::ACHTransfer::Type
      }
    end
  end

  def test_submit
    response = @increase.simulations.ach_transfers.submit("ach_transfer_id")

    assert_pattern do
      response => Increase::Models::ACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        acknowledgement: Increase::Models::ACHTransfer::Acknowledgement | nil,
        addenda: Increase::Models::ACHTransfer::Addenda | nil,
        amount: Integer,
        approval: Increase::Models::ACHTransfer::Approval | nil,
        cancellation: Increase::Models::ACHTransfer::Cancellation | nil,
        company_descriptive_date: String | nil,
        company_discretionary_data: String | nil,
        company_entry_description: String | nil,
        company_name: String | nil,
        created_at: Time,
        created_by: Increase::Models::ACHTransfer::CreatedBy | nil,
        currency: Increase::Models::ACHTransfer::Currency,
        destination_account_holder: Increase::Models::ACHTransfer::DestinationAccountHolder,
        external_account_id: String | nil,
        funding: Increase::Models::ACHTransfer::Funding,
        idempotency_key: String | nil,
        inbound_funds_hold: Increase::Models::ACHTransfer::InboundFundsHold | nil,
        individual_id: String | nil,
        individual_name: String | nil,
        network: Increase::Models::ACHTransfer::Network,
        notifications_of_change: ^(Increase::Internal::Type::ArrayOf[Increase::Models::ACHTransfer::NotificationsOfChange]),
        pending_transaction_id: String | nil,
        preferred_effective_date: Increase::Models::ACHTransfer::PreferredEffectiveDate,
        return_: Increase::Models::ACHTransfer::Return | nil,
        routing_number: String,
        settlement: Increase::Models::ACHTransfer::Settlement | nil,
        standard_entry_class_code: Increase::Models::ACHTransfer::StandardEntryClassCode,
        statement_descriptor: String,
        status: Increase::Models::ACHTransfer::Status,
        submission: Increase::Models::ACHTransfer::Submission | nil,
        transaction_id: String | nil,
        type: Increase::Models::ACHTransfer::Type
      }
    end
  end
end
