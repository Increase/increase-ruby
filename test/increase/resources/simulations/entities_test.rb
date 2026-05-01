# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::EntitiesTest < Increase::Test::ResourceTest
  def test_validation_required_params
    response =
      @increase.simulations.entities.validation(
        "entity_n8y8tnk2p9339ti393yi",
        issues: [{category: :entity_tax_identifier}],
        status: :invalid
      )

    assert_pattern do
      response => Increase::Entity
    end

    assert_pattern do
      response => {
        id: String,
        corporation: Increase::Entity::Corporation | nil,
        created_at: Time,
        creating_entity_onboarding_session_id: String | nil,
        description: String | nil,
        details_confirmed_at: Time | nil,
        government_authority: Increase::Entity::GovernmentAuthority | nil,
        idempotency_key: String | nil,
        joint: Increase::Entity::Joint | nil,
        natural_person: Increase::Entity::NaturalPerson | nil,
        risk_rating: Increase::Entity::RiskRating | nil,
        status: Increase::Entity::Status,
        structure: Increase::Entity::Structure,
        supplemental_documents: ^(Increase::Internal::Type::ArrayOf[Increase::EntitySupplementalDocument]),
        terms_agreements: ^(Increase::Internal::Type::ArrayOf[Increase::Entity::TermsAgreement]),
        third_party_verification: Increase::Entity::ThirdPartyVerification | nil,
        trust: Increase::Entity::Trust | nil,
        type: Increase::Entity::Type,
        validation: Increase::Entity::Validation | nil
      }
    end
  end
end
