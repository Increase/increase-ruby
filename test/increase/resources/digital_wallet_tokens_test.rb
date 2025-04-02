# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::DigitalWalletTokensTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.digital_wallet_tokens.retrieve("digital_wallet_token_id")

    assert_pattern do
      response => Increase::Models::DigitalWalletToken
    end

    assert_pattern do
      response => {
        id: String,
        card_id: String,
        cardholder: Increase::Models::DigitalWalletToken::Cardholder,
        created_at: Time,
        device: Increase::Models::DigitalWalletToken::Device,
        status: Increase::Models::DigitalWalletToken::Status,
        token_requestor: Increase::Models::DigitalWalletToken::TokenRequestor,
        type: Increase::Models::DigitalWalletToken::Type,
        updates: ^(Increase::ArrayOf[Increase::Models::DigitalWalletToken::Update])
      }
    end
  end

  def test_list
    response = @increase.digital_wallet_tokens.list

    assert_pattern do
      response => Increase::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Models::DigitalWalletToken
    end

    assert_pattern do
      row => {
        id: String,
        card_id: String,
        cardholder: Increase::Models::DigitalWalletToken::Cardholder,
        created_at: Time,
        device: Increase::Models::DigitalWalletToken::Device,
        status: Increase::Models::DigitalWalletToken::Status,
        token_requestor: Increase::Models::DigitalWalletToken::TokenRequestor,
        type: Increase::Models::DigitalWalletToken::Type,
        updates: ^(Increase::ArrayOf[Increase::Models::DigitalWalletToken::Update])
      }
    end
  end
end
