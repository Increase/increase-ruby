# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::FednowTransfersTest < Increase::Test::ResourceTest
  def test_complete
    response = @increase.simulations.fednow_transfers.complete("fednow_transfer_4i0mptrdu1mueg1196bg")

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
        creditor_address: Increase::FednowTransfer::CreditorAddress | nil,
        creditor_name: String,
        currency: Increase::FednowTransfer::Currency,
        debtor_address: Increase::FednowTransfer::DebtorAddress | nil,
        debtor_name: String,
        external_account_id: String | nil,
        idempotency_key: String | nil,
        pending_transaction_id: String | nil,
        rejection: Increase::FednowTransfer::Rejection | nil,
        returns: ^(Increase::Internal::Type::ArrayOf[Increase::FednowTransfer::Return]),
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
