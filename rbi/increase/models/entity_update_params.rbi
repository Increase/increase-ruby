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

      # Details of the corporation entity to update. If you specify this parameter and
      # the entity is not a corporation, the request will fail.
      sig { returns(T.nilable(Increase::EntityUpdateParams::Corporation)) }
      attr_reader :corporation

      sig do
        params(
          corporation: Increase::EntityUpdateParams::Corporation::OrHash
        ).void
      end
      attr_writer :corporation

      # Details of the government authority entity to update. If you specify this
      # parameter and the entity is not a government authority, the request will fail.
      sig do
        returns(T.nilable(Increase::EntityUpdateParams::GovernmentAuthority))
      end
      attr_reader :government_authority

      sig do
        params(
          government_authority:
            Increase::EntityUpdateParams::GovernmentAuthority::OrHash
        ).void
      end
      attr_writer :government_authority

      # Details of the natural person entity to update. If you specify this parameter
      # and the entity is not a natural person, the request will fail.
      sig { returns(T.nilable(Increase::EntityUpdateParams::NaturalPerson)) }
      attr_reader :natural_person

      sig do
        params(
          natural_person: Increase::EntityUpdateParams::NaturalPerson::OrHash
        ).void
      end
      attr_writer :natural_person

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

      # If you are using a third-party service for identity verification, you can use
      # this field to associate this Entity with the identifier that represents them in
      # that service.
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

      # Details of the trust entity to update. If you specify this parameter and the
      # entity is not a trust, the request will fail.
      sig { returns(T.nilable(Increase::EntityUpdateParams::Trust)) }
      attr_reader :trust

      sig { params(trust: Increase::EntityUpdateParams::Trust::OrHash).void }
      attr_writer :trust

      sig do
        params(
          corporation: Increase::EntityUpdateParams::Corporation::OrHash,
          government_authority:
            Increase::EntityUpdateParams::GovernmentAuthority::OrHash,
          natural_person: Increase::EntityUpdateParams::NaturalPerson::OrHash,
          risk_rating: Increase::EntityUpdateParams::RiskRating::OrHash,
          third_party_verification:
            Increase::EntityUpdateParams::ThirdPartyVerification::OrHash,
          trust: Increase::EntityUpdateParams::Trust::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Details of the corporation entity to update. If you specify this parameter and
        # the entity is not a corporation, the request will fail.
        corporation: nil,
        # Details of the government authority entity to update. If you specify this
        # parameter and the entity is not a government authority, the request will fail.
        government_authority: nil,
        # Details of the natural person entity to update. If you specify this parameter
        # and the entity is not a natural person, the request will fail.
        natural_person: nil,
        # An assessment of the entity’s potential risk of involvement in financial crimes,
        # such as money laundering.
        risk_rating: nil,
        # If you are using a third-party service for identity verification, you can use
        # this field to associate this Entity with the identifier that represents them in
        # that service.
        third_party_verification: nil,
        # Details of the trust entity to update. If you specify this parameter and the
        # entity is not a trust, the request will fail.
        trust: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            corporation: Increase::EntityUpdateParams::Corporation,
            government_authority:
              Increase::EntityUpdateParams::GovernmentAuthority,
            natural_person: Increase::EntityUpdateParams::NaturalPerson,
            risk_rating: Increase::EntityUpdateParams::RiskRating,
            third_party_verification:
              Increase::EntityUpdateParams::ThirdPartyVerification,
            trust: Increase::EntityUpdateParams::Trust,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Corporation < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::Corporation,
              Increase::Internal::AnyHash
            )
          end

        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        sig do
          returns(T.nilable(Increase::EntityUpdateParams::Corporation::Address))
        end
        attr_reader :address

        sig do
          params(
            address: Increase::EntityUpdateParams::Corporation::Address::OrHash
          ).void
        end
        attr_writer :address

        # The North American Industry Classification System (NAICS) code for the
        # corporation's primary line of business. This is a number, like `5132` for
        # `Software Publishers`. A full list of classification codes is available
        # [here](https://increase.com/documentation/data-dictionary#north-american-industry-classification-system-codes).
        sig { returns(T.nilable(String)) }
        attr_reader :industry_code

        sig { params(industry_code: String).void }
        attr_writer :industry_code

        # The legal name of the corporation.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Details of the corporation entity to update. If you specify this parameter and
        # the entity is not a corporation, the request will fail.
        sig do
          params(
            address: Increase::EntityUpdateParams::Corporation::Address::OrHash,
            industry_code: String,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          address: nil,
          # The North American Industry Classification System (NAICS) code for the
          # corporation's primary line of business. This is a number, like `5132` for
          # `Software Publishers`. A full list of classification codes is available
          # [here](https://increase.com/documentation/data-dictionary#north-american-industry-classification-system-codes).
          industry_code: nil,
          # The legal name of the corporation.
          name: nil
        )
        end

        sig do
          override.returns(
            {
              address: Increase::EntityUpdateParams::Corporation::Address,
              industry_code: String,
              name: String
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityUpdateParams::Corporation::Address,
                Increase::Internal::AnyHash
              )
            end

          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address. This is usually the street number and street.
          sig { returns(String) }
          attr_accessor :line1

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          # the address.
          sig { returns(String) }
          attr_accessor :state

          # The ZIP code of the address.
          sig { returns(String) }
          attr_accessor :zip

          # The second line of the address. This might be the floor or room number.
          sig { returns(T.nilable(String)) }
          attr_reader :line2

          sig { params(line2: String).void }
          attr_writer :line2

          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          sig do
            params(
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the address.
            city:,
            # The first line of the address. This is usually the street number and street.
            line1:,
            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            # the address.
            state:,
            # The ZIP code of the address.
            zip:,
            # The second line of the address. This might be the floor or room number.
            line2: nil
          )
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                state: String,
                zip: String,
                line2: String
              }
            )
          end
          def to_hash
          end
        end
      end

      class GovernmentAuthority < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::GovernmentAuthority,
              Increase::Internal::AnyHash
            )
          end

        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        sig do
          returns(
            T.nilable(
              Increase::EntityUpdateParams::GovernmentAuthority::Address
            )
          )
        end
        attr_reader :address

        sig do
          params(
            address:
              Increase::EntityUpdateParams::GovernmentAuthority::Address::OrHash
          ).void
        end
        attr_writer :address

        # The legal name of the government authority.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Details of the government authority entity to update. If you specify this
        # parameter and the entity is not a government authority, the request will fail.
        sig do
          params(
            address:
              Increase::EntityUpdateParams::GovernmentAuthority::Address::OrHash,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          address: nil,
          # The legal name of the government authority.
          name: nil
        )
        end

        sig do
          override.returns(
            {
              address:
                Increase::EntityUpdateParams::GovernmentAuthority::Address,
              name: String
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityUpdateParams::GovernmentAuthority::Address,
                Increase::Internal::AnyHash
              )
            end

          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address. This is usually the street number and street.
          sig { returns(String) }
          attr_accessor :line1

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          # the address.
          sig { returns(String) }
          attr_accessor :state

          # The ZIP code of the address.
          sig { returns(String) }
          attr_accessor :zip

          # The second line of the address. This might be the floor or room number.
          sig { returns(T.nilable(String)) }
          attr_reader :line2

          sig { params(line2: String).void }
          attr_writer :line2

          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          sig do
            params(
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the address.
            city:,
            # The first line of the address. This is usually the street number and street.
            line1:,
            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            # the address.
            state:,
            # The ZIP code of the address.
            zip:,
            # The second line of the address. This might be the floor or room number.
            line2: nil
          )
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                state: String,
                zip: String,
                line2: String
              }
            )
          end
          def to_hash
          end
        end
      end

      class NaturalPerson < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::NaturalPerson,
              Increase::Internal::AnyHash
            )
          end

        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        sig do
          returns(
            T.nilable(Increase::EntityUpdateParams::NaturalPerson::Address)
          )
        end
        attr_reader :address

        sig do
          params(
            address:
              Increase::EntityUpdateParams::NaturalPerson::Address::OrHash
          ).void
        end
        attr_writer :address

        # The legal name of the natural person.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Details of the natural person entity to update. If you specify this parameter
        # and the entity is not a natural person, the request will fail.
        sig do
          params(
            address:
              Increase::EntityUpdateParams::NaturalPerson::Address::OrHash,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          address: nil,
          # The legal name of the natural person.
          name: nil
        )
        end

        sig do
          override.returns(
            {
              address: Increase::EntityUpdateParams::NaturalPerson::Address,
              name: String
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityUpdateParams::NaturalPerson::Address,
                Increase::Internal::AnyHash
              )
            end

          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address. This is usually the street number and street.
          sig { returns(String) }
          attr_accessor :line1

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          # the address.
          sig { returns(String) }
          attr_accessor :state

          # The ZIP code of the address.
          sig { returns(String) }
          attr_accessor :zip

          # The second line of the address. This might be the floor or room number.
          sig { returns(T.nilable(String)) }
          attr_reader :line2

          sig { params(line2: String).void }
          attr_writer :line2

          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          sig do
            params(
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the address.
            city:,
            # The first line of the address. This is usually the street number and street.
            line1:,
            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            # the address.
            state:,
            # The ZIP code of the address.
            zip:,
            # The second line of the address. This might be the floor or room number.
            line2: nil
          )
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                state: String,
                zip: String,
                line2: String
              }
            )
          end
          def to_hash
          end
        end
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

          # Minimal risk of involvement in financial crime.
          LOW =
            T.let(
              :low,
              Increase::EntityUpdateParams::RiskRating::Rating::TaggedSymbol
            )

          # Moderate risk of involvement in financial crime.
          MEDIUM =
            T.let(
              :medium,
              Increase::EntityUpdateParams::RiskRating::Rating::TaggedSymbol
            )

          # Elevated risk of involvement in financial crime.
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

        # If you are using a third-party service for identity verification, you can use
        # this field to associate this Entity with the identifier that represents them in
        # that service.
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

      class Trust < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::EntityUpdateParams::Trust,
              Increase::Internal::AnyHash
            )
          end

        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        sig { returns(T.nilable(Increase::EntityUpdateParams::Trust::Address)) }
        attr_reader :address

        sig do
          params(
            address: Increase::EntityUpdateParams::Trust::Address::OrHash
          ).void
        end
        attr_writer :address

        # The legal name of the trust.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Details of the trust entity to update. If you specify this parameter and the
        # entity is not a trust, the request will fail.
        sig do
          params(
            address: Increase::EntityUpdateParams::Trust::Address::OrHash,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          address: nil,
          # The legal name of the trust.
          name: nil
        )
        end

        sig do
          override.returns(
            {
              address: Increase::EntityUpdateParams::Trust::Address,
              name: String
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::EntityUpdateParams::Trust::Address,
                Increase::Internal::AnyHash
              )
            end

          # The city of the address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address. This is usually the street number and street.
          sig { returns(String) }
          attr_accessor :line1

          # The two-letter United States Postal Service (USPS) abbreviation for the state of
          # the address.
          sig { returns(String) }
          attr_accessor :state

          # The ZIP code of the address.
          sig { returns(String) }
          attr_accessor :zip

          # The second line of the address. This might be the floor or room number.
          sig { returns(T.nilable(String)) }
          attr_reader :line2

          sig { params(line2: String).void }
          attr_writer :line2

          # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
          # are disallowed.
          sig do
            params(
              city: String,
              line1: String,
              state: String,
              zip: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the address.
            city:,
            # The first line of the address. This is usually the street number and street.
            line1:,
            # The two-letter United States Postal Service (USPS) abbreviation for the state of
            # the address.
            state:,
            # The ZIP code of the address.
            zip:,
            # The second line of the address. This might be the floor or room number.
            line2: nil
          )
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                state: String,
                zip: String,
                line2: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
