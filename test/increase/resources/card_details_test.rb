# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::CardDetailsTest < Increase::Test::ResourceTest
  def test_update_required_params
    response = @increase.card_details.update("card_id", pin: "1234")

    assert_pattern do
      response => Increase::CardDetailsAPI
    end

    assert_pattern do
      response => {
        card_id: String,
        expiration_month: Integer,
        expiration_year: Integer,
        pin: String,
        primary_account_number: String,
        type: Increase::CardDetailsAPI::Type,
        verification_code: String
      }
    end
  end

  def test_create_details_iframe
    response = @increase.card_details.create_details_iframe("card_id")

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
    response = @increase.card_details.details("card_id")

    assert_pattern do
      response => Increase::CardDetailsAPI
    end

    assert_pattern do
      response => {
        card_id: String,
        expiration_month: Integer,
        expiration_year: Integer,
        pin: String,
        primary_account_number: String,
        type: Increase::CardDetailsAPI::Type,
        verification_code: String
      }
    end
  end
end
