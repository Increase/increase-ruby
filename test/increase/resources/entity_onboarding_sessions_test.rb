# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::EntityOnboardingSessionsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.entity_onboarding_sessions.create(
        program_id: "program_i2v2os4mwza1oetokh9i",
        redirect_url: "https://example.com/onboarding/session"
      )

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

  def test_retrieve
    response =
      @increase.entity_onboarding_sessions.retrieve("entity_onboarding_session_wid2ug11fsmvh3k9hymd")

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

  def test_list
    response = @increase.entity_onboarding_sessions.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::EntityOnboardingSession
    end

    assert_pattern do
      row => {
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

  def test_expire
    response = @increase.entity_onboarding_sessions.expire("entity_onboarding_session_wid2ug11fsmvh3k9hymd")

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
