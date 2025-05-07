# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::FileLinksTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.file_links.create(file_id: "file_makxrc67oh9l6sg7w9yc")

    assert_pattern do
      response => Increase::FileLink
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        expires_at: Time,
        file_id: String,
        idempotency_key: String | nil,
        type: Increase::FileLink::Type,
        unauthenticated_url: String
      }
    end
  end
end
