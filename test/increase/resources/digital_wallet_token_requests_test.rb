# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::DigitalWalletTokenRequestsTest < Increase::Test::ResourceTest
  def test_retrieve
    response =
      @increase.digital_wallet_token_requests.retrieve("digital_wallet_token_request_dlsq0yabf7ev4xvke6ek")

    assert_pattern do
      response => Increase::DigitalWalletTokenRequest
    end

    assert_pattern do
      response => {
        id: String,
        card_id: String,
        created_at: Time,
        declined: Increase::DigitalWalletTokenRequest::Declined | nil,
        device: Increase::DigitalWalletTokenRequest::Device,
        outcome: Increase::DigitalWalletTokenRequest::Outcome,
        provisioned: Increase::DigitalWalletTokenRequest::Provisioned | nil,
        token_reference_identifier: String,
        token_requestor: Increase::DigitalWalletTokenRequest::TokenRequestor,
        type: Increase::DigitalWalletTokenRequest::Type
      }
    end
  end

  def test_list
    response = @increase.digital_wallet_token_requests.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::DigitalWalletTokenRequest
    end

    assert_pattern do
      row => {
        id: String,
        card_id: String,
        created_at: Time,
        declined: Increase::DigitalWalletTokenRequest::Declined | nil,
        device: Increase::DigitalWalletTokenRequest::Device,
        outcome: Increase::DigitalWalletTokenRequest::Outcome,
        provisioned: Increase::DigitalWalletTokenRequest::Provisioned | nil,
        token_reference_identifier: String,
        token_requestor: Increase::DigitalWalletTokenRequest::TokenRequestor,
        type: Increase::DigitalWalletTokenRequest::Type
      }
    end
  end
end
