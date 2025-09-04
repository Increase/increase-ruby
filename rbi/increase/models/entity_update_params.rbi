# typed: strong

module Increase
  module Models
    class EntityUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::EntityUpdateParams, Increase::Internal::AnyHash)
        end

      # An assessment of the entity’s potential risk of involvement in financial crimes,
      # such as money laundering.
      sig { returns(T.nilable(Increase::EntityUpdateParams::RiskRating)) }
      attr_reader :risk_rating

      sig do
        params(
          risk_rating: Increase::EntityUpdateParams::RiskRating::OrHash
        ).void
      end
      attr_writer :risk_rating

      # A reference to data stored in a third-party verification service. Your
      # integration may or may not use this field.
      sig do
        returns(T.nilable(Increase::EntityUpdateParams::ThirdPartyVerification))
      end
      attr_reader :third_party_verification

      sig do
        params(
          third_party_verification:
            Increase::EntityUpdateParams::ThirdPartyVerification::OrHash
        ).void
      end
      attr_writer :third_party_verification

      sig do
        params(
          risk_rating: Increase::EntityUpdateParams::RiskRating::OrHash,
          third_party_verification:
            Increase::EntityUpdateParams::ThirdPartyVerification::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # An assessment of the entity’s potential risk of involvement in financial crimes,
        # such as money laundering.
        risk_rating: nil,
        # A reference to data stored in a third-party verification service. Your
        # integration may or may not use this field.
        third_party_verification: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            risk_rating: Increase::EntityUpdateParams::RiskRating,
            third_party_verification:
              Increase::EntityUpdateParams::ThirdPartyVerification,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class RiskRating < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::RiskRating,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the risk
        # rating was performed.
        sig { returns(Time) }
        attr_accessor :rated_at

        # The rating given to this entity.
        sig do
          returns(Increase::EntityUpdateParams::RiskRating::Rating::OrSymbol)
        end
        attr_accessor :rating

        # An assessment of the entity’s potential risk of involvement in financial crimes,
        # such as money laundering.
        sig do
          params(
            rated_at: Time,
            rating: Increase::EntityUpdateParams::RiskRating::Rating::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the risk
          # rating was performed.
          rated_at:,
          # The rating given to this entity.
          rating:
        )
        end

        sig do
          override.returns(
            {
              rated_at: Time,
              rating: Increase::EntityUpdateParams::RiskRating::Rating::OrSymbol
            }
          )
        end
        def to_hash
        end

        # The rating given to this entity.
        module Rating
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::EntityUpdateParams::RiskRating::Rating)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Low
          LOW =
            T.let(
              :low,
              Increase::EntityUpdateParams::RiskRating::Rating::TaggedSymbol
            )

          # Medium
          MEDIUM =
            T.let(
              :medium,
              Increase::EntityUpdateParams::RiskRating::Rating::TaggedSymbol
            )

          # High
          HIGH =
            T.let(
              :high,
              Increase::EntityUpdateParams::RiskRating::Rating::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::EntityUpdateParams::RiskRating::Rating::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class ThirdPartyVerification < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::ThirdPartyVerification,
              Increase::Internal::AnyHash
            )
          end

        # The reference identifier for the third party verification.
        sig { returns(String) }
        attr_accessor :reference

        # The vendor that was used to perform the verification.
        sig do
          returns(
            Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::OrSymbol
          )
        end
        attr_accessor :vendor

        # A reference to data stored in a third-party verification service. Your
        # integration may or may not use this field.
        sig do
          params(
            reference: String,
            vendor:
              Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The reference identifier for the third party verification.
          reference:,
          # The vendor that was used to perform the verification.
          vendor:
        )
        end

        sig do
          override.returns(
            {
              reference: String,
              vendor:
                Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::OrSymbol
            }
          )
        end
        def to_hash
        end

        # The vendor that was used to perform the verification.
        module Vendor
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::EntityUpdateParams::ThirdPartyVerification::Vendor
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Alloy. See https://alloy.com for more information.
          ALLOY =
            T.let(
              :alloy,
              Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::TaggedSymbol
            )

          # Middesk. See https://middesk.com for more information.
          MIDDESK =
            T.let(
              :middesk,
              Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::TaggedSymbol
            )

          # Oscilar. See https://oscilar.com for more information.
          OSCILAR =
            T.let(
              :oscilar,
              Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::EntityUpdateParams::ThirdPartyVerification::Vendor::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
