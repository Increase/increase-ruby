# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::CardsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.cards.create(account_id: "account_in71c4amph0vgo2qllky")

    assert_pattern do
      response => Increase::Card
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        billing_address: Increase::Card::BillingAddress,
        created_at: Time,
        description: String | nil,
        digital_wallet: Increase::Card::DigitalWallet | nil,
        entity_id: String | nil,
        expiration_month: Integer,
        expiration_year: Integer,
        idempotency_key: String | nil,
        last4: String,
        status: Increase::Card::Status,
        type: Increase::Card::Type
      }
    end
  end

  def test_retrieve
    response = @increase.cards.retrieve("card_id")

    assert_pattern do
      response => Increase::Card
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        billing_address: Increase::Card::BillingAddress,
        created_at: Time,
        description: String | nil,
        digital_wallet: Increase::Card::DigitalWallet | nil,
        entity_id: String | nil,
        expiration_month: Integer,
        expiration_year: Integer,
        idempotency_key: String | nil,
        last4: String,
        status: Increase::Card::Status,
        type: Increase::Card::Type
      }
    end
  end

  def test_update
    response = @increase.cards.update("card_id")

    assert_pattern do
      response => Increase::Card
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        billing_address: Increase::Card::BillingAddress,
        created_at: Time,
        description: String | nil,
        digital_wallet: Increase::Card::DigitalWallet | nil,
        entity_id: String | nil,
        expiration_month: Integer,
        expiration_year: Integer,
        idempotency_key: String | nil,
        last4: String,
        status: Increase::Card::Status,
        type: Increase::Card::Type
      }
    end
  end

  def test_list
    response = @increase.cards.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Card
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        billing_address: Increase::Card::BillingAddress,
        created_at: Time,
        description: String | nil,
        digital_wallet: Increase::Card::DigitalWallet | nil,
        entity_id: String | nil,
        expiration_month: Integer,
        expiration_year: Integer,
        idempotency_key: String | nil,
        last4: String,
        status: Increase::Card::Status,
        type: Increase::Card::Type
      }
    end
  end
end
