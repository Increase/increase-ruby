# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::CardPushTransfersTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.card_push_transfers.create(
        amount: 100,
        business_application_identifier: :funds_disbursement,
        card_token_id: "outbound_card_token_zlt0ml6youq3q7vcdlg0",
        merchant_category_code: "1234",
        merchant_city_name: "New York",
        merchant_name: "Acme Corp",
        merchant_name_prefix: "Acme",
        merchant_postal_code: "10045",
        merchant_state: "NY",
        recipient_name: "Ian Crease",
        sender_address_city: "New York",
        sender_address_line1: "33 Liberty Street",
        sender_address_postal_code: "10045",
        sender_address_state: "NY",
        sender_name: "Ian Crease",
        source_account_number_id: "account_number_v18nkfqm6afpsrvy82b2"
      )

    assert_pattern do
      response => Increase::CardPushTransfer
    end

    assert_pattern do
      response => {
        id: String,
        acceptance: Increase::CardPushTransfer::Acceptance | nil,
        account_id: String,
        amount: Integer,
        approval: Increase::CardPushTransfer::Approval | nil,
        business_application_identifier: Increase::CardPushTransfer::BusinessApplicationIdentifier,
        cancellation: Increase::CardPushTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::CardPushTransfer::CreatedBy | nil,
        currency: Increase::CardPushTransfer::Currency,
        decline: Increase::CardPushTransfer::Decline | nil,
        idempotency_key: String | nil,
        merchant_category_code: String,
        merchant_city_name: String,
        merchant_name: String,
        merchant_name_prefix: String,
        merchant_postal_code: String,
        merchant_state: String,
        recipient_name: String,
        sender_address_city: String,
        sender_address_line1: String,
        sender_address_postal_code: String,
        sender_address_state: String,
        sender_name: String,
        source_account_number_id: String,
        status: Increase::CardPushTransfer::Status,
        submission: Increase::CardPushTransfer::Submission | nil,
        type: Increase::CardPushTransfer::Type
      }
    end
  end

  def test_retrieve
    response = @increase.card_push_transfers.retrieve("outbound_card_push_transfer_e0z9rdpamraczh4tvwye")

    assert_pattern do
      response => Increase::CardPushTransfer
    end

    assert_pattern do
      response => {
        id: String,
        acceptance: Increase::CardPushTransfer::Acceptance | nil,
        account_id: String,
        amount: Integer,
        approval: Increase::CardPushTransfer::Approval | nil,
        business_application_identifier: Increase::CardPushTransfer::BusinessApplicationIdentifier,
        cancellation: Increase::CardPushTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::CardPushTransfer::CreatedBy | nil,
        currency: Increase::CardPushTransfer::Currency,
        decline: Increase::CardPushTransfer::Decline | nil,
        idempotency_key: String | nil,
        merchant_category_code: String,
        merchant_city_name: String,
        merchant_name: String,
        merchant_name_prefix: String,
        merchant_postal_code: String,
        merchant_state: String,
        recipient_name: String,
        sender_address_city: String,
        sender_address_line1: String,
        sender_address_postal_code: String,
        sender_address_state: String,
        sender_name: String,
        source_account_number_id: String,
        status: Increase::CardPushTransfer::Status,
        submission: Increase::CardPushTransfer::Submission | nil,
        type: Increase::CardPushTransfer::Type
      }
    end
  end

  def test_list
    response = @increase.card_push_transfers.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::CardPushTransfer
    end

    assert_pattern do
      row => {
        id: String,
        acceptance: Increase::CardPushTransfer::Acceptance | nil,
        account_id: String,
        amount: Integer,
        approval: Increase::CardPushTransfer::Approval | nil,
        business_application_identifier: Increase::CardPushTransfer::BusinessApplicationIdentifier,
        cancellation: Increase::CardPushTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::CardPushTransfer::CreatedBy | nil,
        currency: Increase::CardPushTransfer::Currency,
        decline: Increase::CardPushTransfer::Decline | nil,
        idempotency_key: String | nil,
        merchant_category_code: String,
        merchant_city_name: String,
        merchant_name: String,
        merchant_name_prefix: String,
        merchant_postal_code: String,
        merchant_state: String,
        recipient_name: String,
        sender_address_city: String,
        sender_address_line1: String,
        sender_address_postal_code: String,
        sender_address_state: String,
        sender_name: String,
        source_account_number_id: String,
        status: Increase::CardPushTransfer::Status,
        submission: Increase::CardPushTransfer::Submission | nil,
        type: Increase::CardPushTransfer::Type
      }
    end
  end

  def test_approve
    response = @increase.card_push_transfers.approve("outbound_card_push_transfer_e0z9rdpamraczh4tvwye")

    assert_pattern do
      response => Increase::CardPushTransfer
    end

    assert_pattern do
      response => {
        id: String,
        acceptance: Increase::CardPushTransfer::Acceptance | nil,
        account_id: String,
        amount: Integer,
        approval: Increase::CardPushTransfer::Approval | nil,
        business_application_identifier: Increase::CardPushTransfer::BusinessApplicationIdentifier,
        cancellation: Increase::CardPushTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::CardPushTransfer::CreatedBy | nil,
        currency: Increase::CardPushTransfer::Currency,
        decline: Increase::CardPushTransfer::Decline | nil,
        idempotency_key: String | nil,
        merchant_category_code: String,
        merchant_city_name: String,
        merchant_name: String,
        merchant_name_prefix: String,
        merchant_postal_code: String,
        merchant_state: String,
        recipient_name: String,
        sender_address_city: String,
        sender_address_line1: String,
        sender_address_postal_code: String,
        sender_address_state: String,
        sender_name: String,
        source_account_number_id: String,
        status: Increase::CardPushTransfer::Status,
        submission: Increase::CardPushTransfer::Submission | nil,
        type: Increase::CardPushTransfer::Type
      }
    end
  end

  def test_cancel
    response = @increase.card_push_transfers.cancel("outbound_card_push_transfer_e0z9rdpamraczh4tvwye")

    assert_pattern do
      response => Increase::CardPushTransfer
    end

    assert_pattern do
      response => {
        id: String,
        acceptance: Increase::CardPushTransfer::Acceptance | nil,
        account_id: String,
        amount: Integer,
        approval: Increase::CardPushTransfer::Approval | nil,
        business_application_identifier: Increase::CardPushTransfer::BusinessApplicationIdentifier,
        cancellation: Increase::CardPushTransfer::Cancellation | nil,
        created_at: Time,
        created_by: Increase::CardPushTransfer::CreatedBy | nil,
        currency: Increase::CardPushTransfer::Currency,
        decline: Increase::CardPushTransfer::Decline | nil,
        idempotency_key: String | nil,
        merchant_category_code: String,
        merchant_city_name: String,
        merchant_name: String,
        merchant_name_prefix: String,
        merchant_postal_code: String,
        merchant_state: String,
        recipient_name: String,
        sender_address_city: String,
        sender_address_line1: String,
        sender_address_postal_code: String,
        sender_address_state: String,
        sender_name: String,
        source_account_number_id: String,
        status: Increase::CardPushTransfer::Status,
        submission: Increase::CardPushTransfer::Submission | nil,
        type: Increase::CardPushTransfer::Type
      }
    end
  end
end
