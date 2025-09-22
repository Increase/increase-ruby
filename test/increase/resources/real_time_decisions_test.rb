# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::RealTimeDecisionsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.real_time_decisions.retrieve("real_time_decision_j76n2e810ezcg3zh5qtn")

    assert_pattern do
      response => Increase::RealTimeDecision
    end

    assert_pattern do
      response => {
        id: String,
        card_authentication: Increase::RealTimeDecision::CardAuthentication | nil,
        card_authentication_challenge: Increase::RealTimeDecision::CardAuthenticationChallenge | nil,
        card_authorization: Increase::RealTimeDecision::CardAuthorization | nil,
        category: Increase::RealTimeDecision::Category,
        created_at: Time,
        digital_wallet_authentication: Increase::RealTimeDecision::DigitalWalletAuthentication | nil,
        digital_wallet_token: Increase::RealTimeDecision::DigitalWalletToken | nil,
        status: Increase::RealTimeDecision::Status,
        timeout_at: Time,
        type: Increase::RealTimeDecision::Type
      }
    end
  end

  def test_action
    response = @increase.real_time_decisions.action("real_time_decision_j76n2e810ezcg3zh5qtn")

    assert_pattern do
      response => Increase::RealTimeDecision
    end

    assert_pattern do
      response => {
        id: String,
        card_authentication: Increase::RealTimeDecision::CardAuthentication | nil,
        card_authentication_challenge: Increase::RealTimeDecision::CardAuthenticationChallenge | nil,
        card_authorization: Increase::RealTimeDecision::CardAuthorization | nil,
        category: Increase::RealTimeDecision::Category,
        created_at: Time,
        digital_wallet_authentication: Increase::RealTimeDecision::DigitalWalletAuthentication | nil,
        digital_wallet_token: Increase::RealTimeDecision::DigitalWalletToken | nil,
        status: Increase::RealTimeDecision::Status,
        timeout_at: Time,
        type: Increase::RealTimeDecision::Type
      }
    end
  end
end
