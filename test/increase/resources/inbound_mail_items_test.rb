# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::InboundMailItemsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.inbound_mail_items.retrieve("inbound_mail_item_q6rrg7mmqpplx80zceev")

    assert_pattern do
      response => Increase::InboundMailItem
    end

    assert_pattern do
      response => {
        id: String,
        checks: ^(Increase::Internal::Type::ArrayOf[Increase::InboundMailItem::Check]),
        created_at: Time,
        file_id: String,
        lockbox_id: String | nil,
        recipient_name: String | nil,
        rejection_reason: Increase::InboundMailItem::RejectionReason | nil,
        status: Increase::InboundMailItem::Status,
        type: Increase::InboundMailItem::Type
      }
    end
  end

  def test_list
    response = @increase.inbound_mail_items.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::InboundMailItem
    end

    assert_pattern do
      row => {
        id: String,
        checks: ^(Increase::Internal::Type::ArrayOf[Increase::InboundMailItem::Check]),
        created_at: Time,
        file_id: String,
        lockbox_id: String | nil,
        recipient_name: String | nil,
        rejection_reason: Increase::InboundMailItem::RejectionReason | nil,
        status: Increase::InboundMailItem::Status,
        type: Increase::InboundMailItem::Type
      }
    end
  end

  def test_action_required_params
    response =
      @increase.inbound_mail_items.action(
        "inbound_mail_item_q6rrg7mmqpplx80zceev",
        checks: [{action: :deposit}, {action: :ignore}]
      )

    assert_pattern do
      response => Increase::InboundMailItem
    end

    assert_pattern do
      response => {
        id: String,
        checks: ^(Increase::Internal::Type::ArrayOf[Increase::InboundMailItem::Check]),
        created_at: Time,
        file_id: String,
        lockbox_id: String | nil,
        recipient_name: String | nil,
        rejection_reason: Increase::InboundMailItem::RejectionReason | nil,
        status: Increase::InboundMailItem::Status,
        type: Increase::InboundMailItem::Type
      }
    end
  end
end
