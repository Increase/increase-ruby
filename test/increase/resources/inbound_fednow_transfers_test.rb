# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::InboundFednowTransfersTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.inbound_fednow_transfers.retrieve("inbound_fednow_transfer_ctxxbc07oh5ke5w1hk20")

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

  def test_list
    response = @increase.inbound_fednow_transfers.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::InboundFednowTransfer
    end

    assert_pattern do
      row => {
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
