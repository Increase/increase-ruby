# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::RealTimePaymentsTransfersTest < Increase::Test::ResourceTest
  def test_complete
    response =
      @increase.simulations.real_time_payments_transfers.complete(
        "real_time_payments_transfer_iyuhl5kdn7ssmup83mvq"
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
end
