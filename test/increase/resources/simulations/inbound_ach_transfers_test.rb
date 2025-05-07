# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::InboundACHTransfersTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.simulations.inbound_ach_transfers.create(
        account_number_id: "account_number_v18nkfqm6afpsrvy82b2",
        amount: 1000
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
        expected_settlement_schedule: Increase::InboundACHTransfer::ExpectedSettlementSchedule,
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
        standard_entry_class_code: Increase::InboundACHTransfer::StandardEntryClassCode,
        status: Increase::InboundACHTransfer::Status,
        trace_number: String,
        transfer_return: Increase::InboundACHTransfer::TransferReturn | nil,
        type: Increase::InboundACHTransfer::Type
      }
    end
  end
end
