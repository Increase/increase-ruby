# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::AccountTransfersTest < Increase::Test::ResourceTest
  def test_complete
    response = @increase.simulations.account_transfers.complete("account_transfer_id")

    assert_pattern do
      response => Increase::AccountTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        amount: Integer,
        approval: Increase::AccountTransfer::Approval | nil,
        cancellation: Increase::AccountTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::AccountTransfer::CreatedBy | nil,
        currency: Increase::AccountTransfer::Currency,
        description: String,
        destination_account_id: String,
        destination_transaction_id: String | nil,
        idempotency_key: String | nil,
        network: Increase::AccountTransfer::Network,
        pending_transaction_id: String | nil,
        status: Increase::AccountTransfer::Status,
        transaction_id: String | nil,
        type: Increase::AccountTransfer::Type
      }
    end
  end
end
