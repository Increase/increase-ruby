# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::InboundFednowTransfersTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.simulations.inbound_fednow_transfers.create(
        account_number_id: "account_number_v18nkfqm6afpsrvy82b2",
        amount: 1000
      )

    assert_pattern do
      response => Increase::InboundFednowTransfer
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        confirmation: Increase::InboundFednowTransfer::Confirmation | nil,
        created_at: Time,
        creditor_name: String,
        currency: Increase::InboundFednowTransfer::Currency,
        debtor_account_number: String,
        debtor_name: String,
        debtor_routing_number: String,
        decline: Increase::InboundFednowTransfer::Decline | nil,
        status: Increase::InboundFednowTransfer::Status,
        transaction_id: String | nil,
        type: Increase::InboundFednowTransfer::Type,
        unstructured_remittance_information: String | nil
      }
    end
  end
end
