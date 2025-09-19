# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::PhysicalCardsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.simulations.physical_cards.create("physical_card_id", category: :delivered)

    assert_pattern do
      response => Increase::PhysicalCard
    end

    assert_pattern do
      response => {
        id: String,
        card_id: String,
        cardholder: Increase::PhysicalCard::Cardholder,
        created_at: Time,
        idempotency_key: String | nil,
        physical_card_profile_id: String | nil,
        shipment: Increase::PhysicalCard::Shipment,
        status: Increase::PhysicalCard::Status,
        type: Increase::PhysicalCard::Type
      }
    end
  end

  def test_advance_shipment_required_params
    response =
      @increase.simulations.physical_cards.advance_shipment("physical_card_id", shipment_status: :shipped)

    assert_pattern do
      response => Increase::PhysicalCard
    end

    assert_pattern do
      response => {
        id: String,
        card_id: String,
        cardholder: Increase::PhysicalCard::Cardholder,
        created_at: Time,
        idempotency_key: String | nil,
        physical_card_profile_id: String | nil,
        shipment: Increase::PhysicalCard::Shipment,
        status: Increase::PhysicalCard::Status,
        type: Increase::PhysicalCard::Type
      }
    end
  end
end
