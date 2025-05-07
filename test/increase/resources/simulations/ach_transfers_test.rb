# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::ACHTransfersTest < Increase::Test::ResourceTest
  def test_acknowledge
    response = @increase.simulations.ach_transfers.acknowledge("ach_transfer_id")

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

  def test_create_notification_of_change_required_params
    response =
      @increase.simulations.ach_transfers.create_notification_of_change(
        "ach_transfer_id",
        change_code: :incorrect_routing_number,
        corrected_data: "123456789"
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

  def test_return_
    response = @increase.simulations.ach_transfers.return_("ach_transfer_id")

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

  def test_settle
    response = @increase.simulations.ach_transfers.settle("ach_transfer_id")

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

  def test_submit
    response = @increase.simulations.ach_transfers.submit("ach_transfer_id")

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
