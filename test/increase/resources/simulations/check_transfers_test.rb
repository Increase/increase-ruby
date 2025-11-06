# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::CheckTransfersTest < Increase::Test::ResourceTest
  def test_mail
    response = @increase.simulations.check_transfers.mail("check_transfer_30b43acfu9vw8fyc4f5")

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
