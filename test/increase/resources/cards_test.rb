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
    response = @increase.cards.retrieve("card_oubs0hwk5rn6knuecxg2")

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
    response = @increase.cards.update("card_oubs0hwk5rn6knuecxg2")

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
      response => Increase::Models::CardListResponse
    end

    assert_pattern do
      response => {
        data: ^(Increase::Internal::Type::ArrayOf[Increase::Card]),
        next_cursor: String | nil
      }
    end
  end

  def test_create_details_iframe
    response = @increase.cards.create_details_iframe("card_oubs0hwk5rn6knuecxg2")

    assert_pattern do
      response => Increase::CardIframeURL
    end

    assert_pattern do
      response => {
        expires_at: Time,
        iframe_url: String,
        type: Increase::CardIframeURL::Type
      }
    end
  end

  def test_details
    response = @increase.cards.details("card_oubs0hwk5rn6knuecxg2")

    assert_pattern do
      response => Increase::CardDetails
    end

    assert_pattern do
      response => {
        card_id: String,
        expiration_month: Integer,
        expiration_year: Integer,
        pin: String,
        primary_account_number: String,
        type: Increase::CardDetails::Type,
        verification_code: String
      }
    end
  end

  def test_update_pin_required_params
    response = @increase.cards.update_pin("card_oubs0hwk5rn6knuecxg2", pin: "1234")

    assert_pattern do
      response => Increase::CardDetails
    end

    assert_pattern do
      response => {
        card_id: String,
        expiration_month: Integer,
        expiration_year: Integer,
        pin: String,
        primary_account_number: String,
        type: Increase::CardDetails::Type,
        verification_code: String
      }
    end
  end
end
