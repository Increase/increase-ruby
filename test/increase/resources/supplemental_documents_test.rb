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
      response => Increase::Models::SupplementalDocumentListResponse
    end

    assert_pattern do
      response => {
        data: ^(Increase::Internal::Type::ArrayOf[Increase::EntitySupplementalDocument]),
        next_cursor: String | nil
      }
    end
  end
end
