# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::ExportsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.simulations.exports.create(category: :form_1099_int)

    assert_pattern do
      response => Increase::Export
    end

    assert_pattern do
      response => {
        id: String,
        category: Increase::Export::Category,
        created_at: Time,
        file_download_url: String | nil,
        file_id: String | nil,
        idempotency_key: String | nil,
        status: Increase::Export::Status,
        type: Increase::Export::Type
      }
    end
  end
end
