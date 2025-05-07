# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::FilesTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.files.create(file: Pathname(__FILE__), purpose: :check_image_front)

    assert_pattern do
      response => Increase::File
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        description: String | nil,
        direction: Increase::File::Direction,
        filename: String | nil,
        idempotency_key: String | nil,
        mime_type: String,
        purpose: Increase::File::Purpose,
        type: Increase::File::Type
      }
    end
  end

  def test_retrieve
    response = @increase.files.retrieve("file_id")

    assert_pattern do
      response => Increase::File
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        description: String | nil,
        direction: Increase::File::Direction,
        filename: String | nil,
        idempotency_key: String | nil,
        mime_type: String,
        purpose: Increase::File::Purpose,
        type: Increase::File::Type
      }
    end
  end

  def test_list
    response = @increase.files.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::File
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        description: String | nil,
        direction: Increase::File::Direction,
        filename: String | nil,
        idempotency_key: String | nil,
        mime_type: String,
        purpose: Increase::File::Purpose,
        type: Increase::File::Type
      }
    end
  end
end
