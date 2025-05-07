# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::SupplementalDocumentsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.supplemental_documents.create(
        entity_id: "entity_n8y8tnk2p9339ti393yi",
        file_id: "file_makxrc67oh9l6sg7w9yc"
      )

    assert_pattern do
      response => Increase::EntitySupplementalDocument
    end

    assert_pattern do
      response => {
        created_at: Time,
        entity_id: String,
        file_id: String,
        idempotency_key: String | nil,
        type: Increase::EntitySupplementalDocument::Type
      }
    end
  end

  def test_list_required_params
    response = @increase.supplemental_documents.list(entity_id: "entity_id")

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::EntitySupplementalDocument
    end

    assert_pattern do
      row => {
        created_at: Time,
        entity_id: String,
        file_id: String,
        idempotency_key: String | nil,
        type: Increase::EntitySupplementalDocument::Type
      }
    end
  end
end
