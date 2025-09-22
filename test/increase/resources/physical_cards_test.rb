# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::PhysicalCardsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.physical_cards.create(
        card_id: "card_oubs0hwk5rn6knuecxg2",
        cardholder: {first_name: "Ian", last_name: "Crease"},
        shipment: {
          address: {
            city: "New York",
            line1: "33 Liberty Street",
            name: "Ian Crease",
            postal_code: "10045",
            state: "NY"
          },
          method: :usps
        }
      )

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

  def test_retrieve
    response = @increase.physical_cards.retrieve("physical_card_ode8duyq5v2ynhjoharl")

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

  def test_update_required_params
    response = @increase.physical_cards.update("physical_card_ode8duyq5v2ynhjoharl", status: :disabled)

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

  def test_list
    response = @increase.physical_cards.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::PhysicalCard
    end

    assert_pattern do
      row => {
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
