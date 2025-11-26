# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::OAuthConnectionsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.oauth_connections.retrieve("connection_dauknoksyr4wilz4e6my")

    assert_pattern do
      response => Increase::OAuthConnection
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        deleted_at: Time | nil,
        group_id: String,
        oauth_application_id: String,
        status: Increase::OAuthConnection::Status,
        type: Increase::OAuthConnection::Type
      }
    end
  end

  def test_list
    response = @increase.oauth_connections.list

    assert_pattern do
      response => Increase::Models::OAuthConnectionListResponse
    end

    assert_pattern do
      response => {
        data: ^(Increase::Internal::Type::ArrayOf[Increase::OAuthConnection]),
        next_cursor: String | nil
      }
    end
  end
end
