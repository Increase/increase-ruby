# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::CardTokensTest < Increase::Test::ResourceTest
  def test_create
    response = @increase.simulations.card_tokens.create

    assert_pattern do
      response => Increase::CardToken
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        expiration_date: Date,
        last4: String,
        length: Integer,
        prefix: String,
        type: Increase::CardToken::Type
      }
    end
  end
end
