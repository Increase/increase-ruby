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
    response = @increase.files.retrieve("file_makxrc67oh9l6sg7w9yc")

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
      response => Increase::Models::FileListResponse
    end

    assert_pattern do
      response => {
        data: ^(Increase::Internal::Type::ArrayOf[Increase::File]),
        next_cursor: String | nil
      }
    end
  end
end
