# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::CardTokensTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.card_tokens.retrieve("outbound_card_token_zlt0ml6youq3q7vcdlg0")

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

  def test_list
    response = @increase.card_tokens.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::CardToken
    end

    assert_pattern do
      row => {
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

  def test_capabilities
    response = @increase.card_tokens.capabilities("outbound_card_token_zlt0ml6youq3q7vcdlg0")

    assert_pattern do
      response => Increase::CardTokenCapabilities
    end

    assert_pattern do
      response => {
        routes: ^(Increase::Internal::Type::ArrayOf[Increase::CardTokenCapabilities::Route]),
        type: Increase::CardTokenCapabilities::Type
      }
    end
  end
end
