# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Entities#update
    class EntityUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute risk_rating
      #   An assessment of the entity’s potential risk of involvement in financial crimes,
      #   such as money laundering.
      #
      #   @return [Increase::Models::EntityUpdateParams::RiskRating, nil]
      optional :risk_rating, -> { Increase::EntityUpdateParams::RiskRating }

      # @!attribute third_party_verification
      #   A reference to data stored in a third-party verification service. Your
      #   integration may or may not use this field.
      #
      #   @return [Increase::Models::EntityUpdateParams::ThirdPartyVerification, nil]
      optional :third_party_verification, -> { Increase::EntityUpdateParams::ThirdPartyVerification }

      # @!method initialize(risk_rating: nil, third_party_verification: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::EntityUpdateParams} for more details.
      #
      #   @param risk_rating [Increase::Models::EntityUpdateParams::RiskRating] An assessment of the entity’s potential risk of involvement in financial crimes,
      #
      #   @param third_party_verification [Increase::Models::EntityUpdateParams::ThirdPartyVerification] A reference to data stored in a third-party verification service. Your integrati
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class RiskRating < Increase::Internal::Type::BaseModel
        # @!attribute rated_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the risk
        #   rating was performed.
        #
        #   @return [Time]
        required :rated_at, Time

        # @!attribute rating
        #   The rating given to this entity.
        #
        #   @return [Symbol, Increase::Models::EntityUpdateParams::RiskRating::Rating]
        required :rating, enum: -> { Increase::EntityUpdateParams::RiskRating::Rating }

        # @!method initialize(rated_at:, rating:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::EntityUpdateParams::RiskRating} for more details.
        #
        #   An assessment of the entity’s potential risk of involvement in financial crimes,
        #   such as money laundering.
        #
        #   @param rated_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the risk ra
        #
        #   @param rating [Symbol, Increase::Models::EntityUpdateParams::RiskRating::Rating] The rating given to this entity.

        # The rating given to this entity.
        #
        # @see Increase::Models::EntityUpdateParams::RiskRating#rating
        module Rating
          extend Increase::Internal::Type::Enum

          # Low
          LOW = :low

          # Medium
          MEDIUM = :medium

          # High
          HIGH = :high

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class ThirdPartyVerification < Increase::Internal::Type::BaseModel
        # @!attribute reference
        #   The reference identifier for the third party verification.
        #
        #   @return [String]
        required :reference, String

        # @!attribute vendor
        #   The vendor that was used to perform the verification.
        #
        #   @return [Symbol, Increase::Models::EntityUpdateParams::ThirdPartyVerification::Vendor]
        required :vendor, enum: -> { Increase::EntityUpdateParams::ThirdPartyVerification::Vendor }

        # @!method initialize(reference:, vendor:)
        #   A reference to data stored in a third-party verification service. Your
        #   integration may or may not use this field.
        #
        #   @param reference [String] The reference identifier for the third party verification.
        #
        #   @param vendor [Symbol, Increase::Models::EntityUpdateParams::ThirdPartyVerification::Vendor] The vendor that was used to perform the verification.

        # The vendor that was used to perform the verification.
        #
        # @see Increase::Models::EntityUpdateParams::ThirdPartyVerification#vendor
        module Vendor
          extend Increase::Internal::Type::Enum

          # Alloy. See https://alloy.com for more information.
          ALLOY = :alloy

          # Middesk. See https://middesk.com for more information.
          MIDDESK = :middesk

          # Oscilar. See https://oscilar.com for more information.
          OSCILAR = :oscilar

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
