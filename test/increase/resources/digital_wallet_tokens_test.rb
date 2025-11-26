# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::DigitalWalletTokensTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.digital_wallet_tokens.retrieve("digital_wallet_token_izi62go3h51p369jrie0")

    assert_pattern do
      response => Increase::DigitalWalletToken
    end

    assert_pattern do
      response => {
        id: String,
        card_id: String,
        cardholder: Increase::DigitalWalletToken::Cardholder,
        created_at: Time,
        device: Increase::DigitalWalletToken::Device,
        status: Increase::DigitalWalletToken::Status,
        token_requestor: Increase::DigitalWalletToken::TokenRequestor,
        type: Increase::DigitalWalletToken::Type,
        updates: ^(Increase::Internal::Type::ArrayOf[Increase::DigitalWalletToken::Update])
      }
    end
  end

  def test_list
    response = @increase.digital_wallet_tokens.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::DigitalWalletToken
    end

    assert_pattern do
      row => {
        id: String,
        card_id: String,
        cardholder: Increase::DigitalWalletToken::Cardholder,
        created_at: Time,
        device: Increase::DigitalWalletToken::Device,
        status: Increase::DigitalWalletToken::Status,
        token_requestor: Increase::DigitalWalletToken::TokenRequestor,
        type: Increase::DigitalWalletToken::Type,
        updates: ^(Increase::Internal::Type::ArrayOf[Increase::DigitalWalletToken::Update])
      }
    end
  end
end
