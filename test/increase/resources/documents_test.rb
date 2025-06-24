# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::DocumentsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.documents.create(category: :account_verification_letter)

    assert_pattern do
      response => Increase::Document
    end

    assert_pattern do
      response => {
        id: String,
        account_verification_letter: Increase::Document::AccountVerificationLetter | nil,
        category: Increase::Document::Category,
        created_at: Time,
        entity_id: String | nil,
        file_id: String,
        funding_instructions: Increase::Document::FundingInstructions | nil,
        idempotency_key: String | nil,
        type: Increase::Document::Type
      }
    end
  end

  def test_retrieve
    response = @increase.documents.retrieve("document_id")

    assert_pattern do
      response => Increase::Document
    end

    assert_pattern do
      response => {
        id: String,
        account_verification_letter: Increase::Document::AccountVerificationLetter | nil,
        category: Increase::Document::Category,
        created_at: Time,
        entity_id: String | nil,
        file_id: String,
        funding_instructions: Increase::Document::FundingInstructions | nil,
        idempotency_key: String | nil,
        type: Increase::Document::Type
      }
    end
  end

  def test_list
    response = @increase.documents.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Document
    end

    assert_pattern do
      row => {
        id: String,
        account_verification_letter: Increase::Document::AccountVerificationLetter | nil,
        category: Increase::Document::Category,
        created_at: Time,
        entity_id: String | nil,
        file_id: String,
        funding_instructions: Increase::Document::FundingInstructions | nil,
        idempotency_key: String | nil,
        type: Increase::Document::Type
      }
    end
  end
end
