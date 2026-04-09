# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::EntityOnboardingSessionsTest < Increase::Test::ResourceTest
  def test_submit
    response =
      @increase.simulations.entity_onboarding_sessions.submit("entity_onboarding_session_wid2ug11fsmvh3k9hymd")

    assert_pattern do
      response => Increase::EntityOnboardingSession
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        entity_id: String | nil,
        expires_at: Time,
        idempotency_key: String | nil,
        program_id: String,
        redirect_url: String,
        session_url: String | nil,
        status: Increase::EntityOnboardingSession::Status,
        type: Increase::EntityOnboardingSession::Type
      }
    end
  end
end
