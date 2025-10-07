# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::OAuthTokensTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.oauth_tokens.create(grant_type: :authorization_code)

    assert_pattern do
      response => Increase::OAuthToken
    end

    assert_pattern do
      response => {
        access_token: String,
        group_id: String,
        token_type: Increase::OAuthToken::TokenType,
        type: Increase::OAuthToken::Type
      }
    end
  end
end
