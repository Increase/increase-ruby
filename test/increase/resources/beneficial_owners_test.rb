# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::BeneficialOwnersTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.beneficial_owners.create(
        entity_id: "entity_n8y8tnk2p9339ti393yi",
        individual: {
          address: {city: "New York", country: "US", line1: "33 Liberty Street"},
          date_of_birth: "1970-01-31",
          identification: {method: :social_security_number, number: "078051120"},
          name: "Ian Crease"
        },
        prongs: [:control]
      )

    assert_pattern do
      response => Increase::EntityBeneficialOwner
    end

    assert_pattern do
      response => {
        id: String,
        company_title: String | nil,
        created_at: Time,
        idempotency_key: String | nil,
        individual: Increase::EntityBeneficialOwner::Individual,
        prongs: ^(Increase::Internal::Type::ArrayOf[enum: Increase::EntityBeneficialOwner::Prong]),
        type: Increase::EntityBeneficialOwner::Type
      }
    end
  end

  def test_retrieve
    response =
      @increase.beneficial_owners.retrieve("entity_setup_beneficial_owner_submission_vgkyk7dj5eb4sfhdbkx7")

    assert_pattern do
      response => Increase::EntityBeneficialOwner
    end

    assert_pattern do
      response => {
        id: String,
        company_title: String | nil,
        created_at: Time,
        idempotency_key: String | nil,
        individual: Increase::EntityBeneficialOwner::Individual,
        prongs: ^(Increase::Internal::Type::ArrayOf[enum: Increase::EntityBeneficialOwner::Prong]),
        type: Increase::EntityBeneficialOwner::Type
      }
    end
  end

  def test_update
    response =
      @increase.beneficial_owners.update("entity_setup_beneficial_owner_submission_vgkyk7dj5eb4sfhdbkx7")

    assert_pattern do
      response => Increase::EntityBeneficialOwner
    end

    assert_pattern do
      response => {
        id: String,
        company_title: String | nil,
        created_at: Time,
        idempotency_key: String | nil,
        individual: Increase::EntityBeneficialOwner::Individual,
        prongs: ^(Increase::Internal::Type::ArrayOf[enum: Increase::EntityBeneficialOwner::Prong]),
        type: Increase::EntityBeneficialOwner::Type
      }
    end
  end

  def test_list_required_params
    response = @increase.beneficial_owners.list(entity_id: "entity_id")

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::EntityBeneficialOwner
    end

    assert_pattern do
      row => {
        id: String,
        company_title: String | nil,
        created_at: Time,
        idempotency_key: String | nil,
        individual: Increase::EntityBeneficialOwner::Individual,
        prongs: ^(Increase::Internal::Type::ArrayOf[enum: Increase::EntityBeneficialOwner::Prong]),
        type: Increase::EntityBeneficialOwner::Type
      }
    end
  end

  def test_archive
    response =
      @increase.beneficial_owners.archive("entity_setup_beneficial_owner_submission_vgkyk7dj5eb4sfhdbkx7")

    assert_pattern do
      response => Increase::EntityBeneficialOwner
    end

    assert_pattern do
      response => {
        id: String,
        company_title: String | nil,
        created_at: Time,
        idempotency_key: String | nil,
        individual: Increase::EntityBeneficialOwner::Individual,
        prongs: ^(Increase::Internal::Type::ArrayOf[enum: Increase::EntityBeneficialOwner::Prong]),
        type: Increase::EntityBeneficialOwner::Type
      }
    end
  end
end
