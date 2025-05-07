# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::IntrafiExclusionsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.intrafi_exclusions.create(bank_name: "Example Bank", entity_id: "entity_n8y8tnk2p9339ti393yi")

    assert_pattern do
      response => Increase::IntrafiExclusion
    end

    assert_pattern do
      response => {
        id: String,
        bank_name: String,
        created_at: Time,
        entity_id: String,
        excluded_at: Time | nil,
        fdic_certificate_number: String | nil,
        idempotency_key: String | nil,
        status: Increase::IntrafiExclusion::Status,
        submitted_at: Time | nil,
        type: Increase::IntrafiExclusion::Type
      }
    end
  end

  def test_retrieve
    response = @increase.intrafi_exclusions.retrieve("intrafi_exclusion_id")

    assert_pattern do
      response => Increase::IntrafiExclusion
    end

    assert_pattern do
      response => {
        id: String,
        bank_name: String,
        created_at: Time,
        entity_id: String,
        excluded_at: Time | nil,
        fdic_certificate_number: String | nil,
        idempotency_key: String | nil,
        status: Increase::IntrafiExclusion::Status,
        submitted_at: Time | nil,
        type: Increase::IntrafiExclusion::Type
      }
    end
  end

  def test_list
    response = @increase.intrafi_exclusions.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::IntrafiExclusion
    end

    assert_pattern do
      row => {
        id: String,
        bank_name: String,
        created_at: Time,
        entity_id: String,
        excluded_at: Time | nil,
        fdic_certificate_number: String | nil,
        idempotency_key: String | nil,
        status: Increase::IntrafiExclusion::Status,
        submitted_at: Time | nil,
        type: Increase::IntrafiExclusion::Type
      }
    end
  end

  def test_archive
    response = @increase.intrafi_exclusions.archive("intrafi_exclusion_id")

    assert_pattern do
      response => Increase::IntrafiExclusion
    end

    assert_pattern do
      response => {
        id: String,
        bank_name: String,
        created_at: Time,
        entity_id: String,
        excluded_at: Time | nil,
        fdic_certificate_number: String | nil,
        idempotency_key: String | nil,
        status: Increase::IntrafiExclusion::Status,
        submitted_at: Time | nil,
        type: Increase::IntrafiExclusion::Type
      }
    end
  end
end
