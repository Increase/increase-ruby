# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::InboundMailItemsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.simulations.inbound_mail_items.create(amount: 1000)

    assert_pattern do
      response => Increase::InboundMailItem
    end

    assert_pattern do
      response => {
        id: String,
        checks: ^(Increase::Internal::Type::ArrayOf[Increase::InboundMailItem::Check]),
        created_at: Time,
        file_id: String,
        lockbox_address_id: String,
        lockbox_recipient_id: String | nil,
        recipient_name: String | nil,
        rejection_reason: Increase::InboundMailItem::RejectionReason | nil,
        status: Increase::InboundMailItem::Status,
        type: Increase::InboundMailItem::Type
      }
    end
  end
end
