# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::ExportsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.exports.create(category: :transaction_csv)

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

  def test_retrieve
    response = @increase.exports.retrieve("export_id")

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

  def test_list
    response = @increase.exports.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Export
    end

    assert_pattern do
      row => {
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
