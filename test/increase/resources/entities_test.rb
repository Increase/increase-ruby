# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::EntitiesTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.entities.create(structure: :corporation)

    assert_pattern do
      response => Increase::Entity
    end

    assert_pattern do
      response => {
        id: String,
        corporation: Increase::Entity::Corporation | nil,
        created_at: Time,
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

  def test_retrieve
    response = @increase.entities.retrieve("entity_n8y8tnk2p9339ti393yi")

    assert_pattern do
      response => Increase::Entity
    end

    assert_pattern do
      response => {
        id: String,
        corporation: Increase::Entity::Corporation | nil,
        created_at: Time,
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

  def test_update
    response = @increase.entities.update("entity_n8y8tnk2p9339ti393yi")

    assert_pattern do
      response => Increase::Entity
    end

    assert_pattern do
      response => {
        id: String,
        corporation: Increase::Entity::Corporation | nil,
        created_at: Time,
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

  def test_list
    response = @increase.entities.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Entity
    end

    assert_pattern do
      row => {
        id: String,
        corporation: Increase::Entity::Corporation | nil,
        created_at: Time,
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

  def test_archive
    response = @increase.entities.archive("entity_n8y8tnk2p9339ti393yi")

    assert_pattern do
      response => Increase::Entity
    end

    assert_pattern do
      response => {
        id: String,
        corporation: Increase::Entity::Corporation | nil,
        created_at: Time,
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
