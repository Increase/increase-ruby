# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::CheckTransfersTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.check_transfers.create(
        account_id: "account_in71c4amph0vgo2qllky",
        amount: 1000,
        fulfillment_method: :physical_check,
        source_account_number_id: "account_number_v18nkfqm6afpsrvy82b2"
      )

    assert_pattern do
      response => Increase::CheckTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        approval: Increase::CheckTransfer::Approval | nil,
        approved_inbound_check_deposit_id: String | nil,
        balance_check: Increase::CheckTransfer::BalanceCheck | nil,
        cancellation: Increase::CheckTransfer::Cancellation | nil,
        check_number: String,
        created_at: Time,
        created_by: Increase::CheckTransfer::CreatedBy | nil,
        currency: Increase::CheckTransfer::Currency,
        fulfillment_method: Increase::CheckTransfer::FulfillmentMethod,
        idempotency_key: String | nil,
        mailing: Increase::CheckTransfer::Mailing | nil,
        pending_transaction_id: String | nil,
        physical_check: Increase::CheckTransfer::PhysicalCheck | nil,
        routing_number: String,
        source_account_number_id: String | nil,
        status: Increase::CheckTransfer::Status,
        stop_payment_request: Increase::CheckTransfer::StopPaymentRequest | nil,
        submission: Increase::CheckTransfer::Submission | nil,
        third_party: Increase::CheckTransfer::ThirdParty | nil,
        type: Increase::CheckTransfer::Type,
        valid_until_date: Date | nil
      }
    end
  end

  def test_retrieve
    response = @increase.check_transfers.retrieve("check_transfer_30b43acfu9vw8fyc4f5")

    assert_pattern do
      response => Increase::CheckTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        approval: Increase::CheckTransfer::Approval | nil,
        approved_inbound_check_deposit_id: String | nil,
        balance_check: Increase::CheckTransfer::BalanceCheck | nil,
        cancellation: Increase::CheckTransfer::Cancellation | nil,
        check_number: String,
        created_at: Time,
        created_by: Increase::CheckTransfer::CreatedBy | nil,
        currency: Increase::CheckTransfer::Currency,
        fulfillment_method: Increase::CheckTransfer::FulfillmentMethod,
        idempotency_key: String | nil,
        mailing: Increase::CheckTransfer::Mailing | nil,
        pending_transaction_id: String | nil,
        physical_check: Increase::CheckTransfer::PhysicalCheck | nil,
        routing_number: String,
        source_account_number_id: String | nil,
        status: Increase::CheckTransfer::Status,
        stop_payment_request: Increase::CheckTransfer::StopPaymentRequest | nil,
        submission: Increase::CheckTransfer::Submission | nil,
        third_party: Increase::CheckTransfer::ThirdParty | nil,
        type: Increase::CheckTransfer::Type,
        valid_until_date: Date | nil
      }
    end
  end

  def test_list
    response = @increase.check_transfers.list

    assert_pattern do
      response => Increase::Models::CheckTransferListResponse
    end

    assert_pattern do
      response => {
        data: ^(Increase::Internal::Type::ArrayOf[Increase::CheckTransfer]),
        next_cursor: String | nil
      }
    end
  end

  def test_approve
    response = @increase.check_transfers.approve("check_transfer_30b43acfu9vw8fyc4f5")

    assert_pattern do
      response => Increase::CheckTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        approval: Increase::CheckTransfer::Approval | nil,
        approved_inbound_check_deposit_id: String | nil,
        balance_check: Increase::CheckTransfer::BalanceCheck | nil,
        cancellation: Increase::CheckTransfer::Cancellation | nil,
        check_number: String,
        created_at: Time,
        created_by: Increase::CheckTransfer::CreatedBy | nil,
        currency: Increase::CheckTransfer::Currency,
        fulfillment_method: Increase::CheckTransfer::FulfillmentMethod,
        idempotency_key: String | nil,
        mailing: Increase::CheckTransfer::Mailing | nil,
        pending_transaction_id: String | nil,
        physical_check: Increase::CheckTransfer::PhysicalCheck | nil,
        routing_number: String,
        source_account_number_id: String | nil,
        status: Increase::CheckTransfer::Status,
        stop_payment_request: Increase::CheckTransfer::StopPaymentRequest | nil,
        submission: Increase::CheckTransfer::Submission | nil,
        third_party: Increase::CheckTransfer::ThirdParty | nil,
        type: Increase::CheckTransfer::Type,
        valid_until_date: Date | nil
      }
    end
  end

  def test_cancel
    response = @increase.check_transfers.cancel("check_transfer_30b43acfu9vw8fyc4f5")

    assert_pattern do
      response => Increase::CheckTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        approval: Increase::CheckTransfer::Approval | nil,
        approved_inbound_check_deposit_id: String | nil,
        balance_check: Increase::CheckTransfer::BalanceCheck | nil,
        cancellation: Increase::CheckTransfer::Cancellation | nil,
        check_number: String,
        created_at: Time,
        created_by: Increase::CheckTransfer::CreatedBy | nil,
        currency: Increase::CheckTransfer::Currency,
        fulfillment_method: Increase::CheckTransfer::FulfillmentMethod,
        idempotency_key: String | nil,
        mailing: Increase::CheckTransfer::Mailing | nil,
        pending_transaction_id: String | nil,
        physical_check: Increase::CheckTransfer::PhysicalCheck | nil,
        routing_number: String,
        source_account_number_id: String | nil,
        status: Increase::CheckTransfer::Status,
        stop_payment_request: Increase::CheckTransfer::StopPaymentRequest | nil,
        submission: Increase::CheckTransfer::Submission | nil,
        third_party: Increase::CheckTransfer::ThirdParty | nil,
        type: Increase::CheckTransfer::Type,
        valid_until_date: Date | nil
      }
    end
  end

  def test_stop_payment
    response = @increase.check_transfers.stop_payment("check_transfer_30b43acfu9vw8fyc4f5")

    assert_pattern do
      response => Increase::CheckTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number: String,
        amount: Integer,
        approval: Increase::CheckTransfer::Approval | nil,
        approved_inbound_check_deposit_id: String | nil,
        balance_check: Increase::CheckTransfer::BalanceCheck | nil,
        cancellation: Increase::CheckTransfer::Cancellation | nil,
        check_number: String,
        created_at: Time,
        created_by: Increase::CheckTransfer::CreatedBy | nil,
        currency: Increase::CheckTransfer::Currency,
        fulfillment_method: Increase::CheckTransfer::FulfillmentMethod,
        idempotency_key: String | nil,
        mailing: Increase::CheckTransfer::Mailing | nil,
        pending_transaction_id: String | nil,
        physical_check: Increase::CheckTransfer::PhysicalCheck | nil,
        routing_number: String,
        source_account_number_id: String | nil,
        status: Increase::CheckTransfer::Status,
        stop_payment_request: Increase::CheckTransfer::StopPaymentRequest | nil,
        submission: Increase::CheckTransfer::Submission | nil,
        third_party: Increase::CheckTransfer::ThirdParty | nil,
        type: Increase::CheckTransfer::Type,
        valid_until_date: Date | nil
      }
    end
  end
end
