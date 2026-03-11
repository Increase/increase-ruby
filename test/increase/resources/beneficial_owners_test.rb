# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::BeneficialOwnersTest < Increase::Test::ResourceTest
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
        individual: Increase::EntityBeneficialOwner::Individual,
        prongs: ^(Increase::Internal::Type::ArrayOf[enum: Increase::EntityBeneficialOwner::Prong]),
        type: Increase::EntityBeneficialOwner::Type
      }
    end
  end
end
