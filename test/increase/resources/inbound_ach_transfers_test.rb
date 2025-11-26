# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::InboundACHTransfersTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.inbound_ach_transfers.retrieve("inbound_ach_transfer_tdrwqr3fq9gnnq49odev")

    assert_pattern do
      response => Increase::InboundACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        acceptance: Increase::InboundACHTransfer::Acceptance | nil,
        account_id: String,
        account_number_id: String,
        addenda: Increase::InboundACHTransfer::Addenda | nil,
        amount: Integer,
        automatically_resolves_at: Time,
        created_at: Time,
        decline: Increase::InboundACHTransfer::Decline | nil,
        direction: Increase::InboundACHTransfer::Direction,
        effective_date: Date,
        international_addenda: Increase::InboundACHTransfer::InternationalAddenda | nil,
        notification_of_change: Increase::InboundACHTransfer::NotificationOfChange | nil,
        originator_company_descriptive_date: String | nil,
        originator_company_discretionary_data: String | nil,
        originator_company_entry_description: String,
        originator_company_id: String,
        originator_company_name: String,
        originator_routing_number: String,
        receiver_id_number: String | nil,
        receiver_name: String | nil,
        settlement: Increase::InboundACHTransfer::Settlement,
        standard_entry_class_code: Increase::InboundACHTransfer::StandardEntryClassCode,
        status: Increase::InboundACHTransfer::Status,
        trace_number: String,
        transfer_return: Increase::InboundACHTransfer::TransferReturn | nil,
        type: Increase::InboundACHTransfer::Type
      }
    end
  end

  def test_list
    response = @increase.inbound_ach_transfers.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::InboundACHTransfer
    end

    assert_pattern do
      row => {
        id: String,
        acceptance: Increase::InboundACHTransfer::Acceptance | nil,
        account_id: String,
        account_number_id: String,
        addenda: Increase::InboundACHTransfer::Addenda | nil,
        amount: Integer,
        automatically_resolves_at: Time,
        created_at: Time,
        decline: Increase::InboundACHTransfer::Decline | nil,
        direction: Increase::InboundACHTransfer::Direction,
        effective_date: Date,
        international_addenda: Increase::InboundACHTransfer::InternationalAddenda | nil,
        notification_of_change: Increase::InboundACHTransfer::NotificationOfChange | nil,
        originator_company_descriptive_date: String | nil,
        originator_company_discretionary_data: String | nil,
        originator_company_entry_description: String,
        originator_company_id: String,
        originator_company_name: String,
        originator_routing_number: String,
        receiver_id_number: String | nil,
        receiver_name: String | nil,
        settlement: Increase::InboundACHTransfer::Settlement,
        standard_entry_class_code: Increase::InboundACHTransfer::StandardEntryClassCode,
        status: Increase::InboundACHTransfer::Status,
        trace_number: String,
        transfer_return: Increase::InboundACHTransfer::TransferReturn | nil,
        type: Increase::InboundACHTransfer::Type
      }
    end
  end

  def test_create_notification_of_change
    response =
      @increase.inbound_ach_transfers.create_notification_of_change("inbound_ach_transfer_tdrwqr3fq9gnnq49odev")

    assert_pattern do
      response => Increase::InboundACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        acceptance: Increase::InboundACHTransfer::Acceptance | nil,
        account_id: String,
        account_number_id: String,
        addenda: Increase::InboundACHTransfer::Addenda | nil,
        amount: Integer,
        automatically_resolves_at: Time,
        created_at: Time,
        decline: Increase::InboundACHTransfer::Decline | nil,
        direction: Increase::InboundACHTransfer::Direction,
        effective_date: Date,
        international_addenda: Increase::InboundACHTransfer::InternationalAddenda | nil,
        notification_of_change: Increase::InboundACHTransfer::NotificationOfChange | nil,
        originator_company_descriptive_date: String | nil,
        originator_company_discretionary_data: String | nil,
        originator_company_entry_description: String,
        originator_company_id: String,
        originator_company_name: String,
        originator_routing_number: String,
        receiver_id_number: String | nil,
        receiver_name: String | nil,
        settlement: Increase::InboundACHTransfer::Settlement,
        standard_entry_class_code: Increase::InboundACHTransfer::StandardEntryClassCode,
        status: Increase::InboundACHTransfer::Status,
        trace_number: String,
        transfer_return: Increase::InboundACHTransfer::TransferReturn | nil,
        type: Increase::InboundACHTransfer::Type
      }
    end
  end

  def test_decline
    response = @increase.inbound_ach_transfers.decline("inbound_ach_transfer_tdrwqr3fq9gnnq49odev")

    assert_pattern do
      response => Increase::InboundACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        acceptance: Increase::InboundACHTransfer::Acceptance | nil,
        account_id: String,
        account_number_id: String,
        addenda: Increase::InboundACHTransfer::Addenda | nil,
        amount: Integer,
        automatically_resolves_at: Time,
        created_at: Time,
        decline: Increase::InboundACHTransfer::Decline | nil,
        direction: Increase::InboundACHTransfer::Direction,
        effective_date: Date,
        international_addenda: Increase::InboundACHTransfer::InternationalAddenda | nil,
        notification_of_change: Increase::InboundACHTransfer::NotificationOfChange | nil,
        originator_company_descriptive_date: String | nil,
        originator_company_discretionary_data: String | nil,
        originator_company_entry_description: String,
        originator_company_id: String,
        originator_company_name: String,
        originator_routing_number: String,
        receiver_id_number: String | nil,
        receiver_name: String | nil,
        settlement: Increase::InboundACHTransfer::Settlement,
        standard_entry_class_code: Increase::InboundACHTransfer::StandardEntryClassCode,
        status: Increase::InboundACHTransfer::Status,
        trace_number: String,
        transfer_return: Increase::InboundACHTransfer::TransferReturn | nil,
        type: Increase::InboundACHTransfer::Type
      }
    end
  end

  def test_transfer_return_required_params
    response =
      @increase.inbound_ach_transfers.transfer_return(
        "inbound_ach_transfer_tdrwqr3fq9gnnq49odev",
        reason: :payment_stopped
      )

    assert_pattern do
      response => Increase::InboundACHTransfer
    end

    assert_pattern do
      response => {
        id: String,
        acceptance: Increase::InboundACHTransfer::Acceptance | nil,
        account_id: String,
        account_number_id: String,
        addenda: Increase::InboundACHTransfer::Addenda | nil,
        amount: Integer,
        automatically_resolves_at: Time,
        created_at: Time,
        decline: Increase::InboundACHTransfer::Decline | nil,
        direction: Increase::InboundACHTransfer::Direction,
        effective_date: Date,
        international_addenda: Increase::InboundACHTransfer::InternationalAddenda | nil,
        notification_of_change: Increase::InboundACHTransfer::NotificationOfChange | nil,
        originator_company_descriptive_date: String | nil,
        originator_company_discretionary_data: String | nil,
        originator_company_entry_description: String,
        originator_company_id: String,
        originator_company_name: String,
        originator_routing_number: String,
        receiver_id_number: String | nil,
        receiver_name: String | nil,
        settlement: Increase::InboundACHTransfer::Settlement,
        standard_entry_class_code: Increase::InboundACHTransfer::StandardEntryClassCode,
        status: Increase::InboundACHTransfer::Status,
        trace_number: String,
        transfer_return: Increase::InboundACHTransfer::TransferReturn | nil,
        type: Increase::InboundACHTransfer::Type
      }
    end
  end
end
