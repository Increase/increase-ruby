# typed: strong

module Increase
  module Models
    module Simulations
      class EntityUpdateValidationParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::EntityUpdateValidationParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Entity whose validation status to update.
        sig { returns(String) }
        attr_accessor :entity_id

        # The validation issues to attach. If no issues are provided, the validation
        # status will be set to `valid`.
        sig do
          returns(
            T::Array[Increase::Simulations::EntityUpdateValidationParams::Issue]
          )
        end
        attr_accessor :issues

        sig do
          params(
            entity_id: String,
            issues:
              T::Array[
                Increase::Simulations::EntityUpdateValidationParams::Issue::OrHash
              ],
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Entity whose validation status to update.
          entity_id:,
          # The validation issues to attach. If no issues are provided, the validation
          # status will be set to `valid`.
          issues:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              entity_id: String,
              issues:
                T::Array[
                  Increase::Simulations::EntityUpdateValidationParams::Issue
                ],
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Issue < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Simulations::EntityUpdateValidationParams::Issue,
                Increase::Internal::AnyHash
              )
            end

          # The type of issue.
          sig do
            returns(
              Increase::Simulations::EntityUpdateValidationParams::Issue::Category::OrSymbol
            )
          end
          attr_accessor :category

          sig do
            params(
              category:
                Increase::Simulations::EntityUpdateValidationParams::Issue::Category::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The type of issue.
            category:
          )
          end

          sig do
            override.returns(
              {
                category:
                  Increase::Simulations::EntityUpdateValidationParams::Issue::Category::OrSymbol
              }
            )
          end
          def to_hash
          end

          # The type of issue.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Simulations::EntityUpdateValidationParams::Issue::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The entity's tax identifier could not be validated. Update the tax ID with the [update an entity API](/documentation/api/entities#update-an-entity.corporation.legal_identifier).
            ENTITY_TAX_IDENTIFIER =
              T.let(
                :entity_tax_identifier,
                Increase::Simulations::EntityUpdateValidationParams::Issue::Category::TaggedSymbol
              )

            # The entity's address could not be validated. Update the address with the [update an entity API](/documentation/api/entities#update-an-entity.corporation.address).
            ENTITY_ADDRESS =
              T.let(
                :entity_address,
                Increase::Simulations::EntityUpdateValidationParams::Issue::Category::TaggedSymbol
              )

            # A beneficial owner's identity could not be verified. Update the identification with the [update a beneficial owner API](/documentation/api/beneficial-owners#update-a-beneficial-owner).
            BENEFICIAL_OWNER_IDENTITY =
              T.let(
                :beneficial_owner_identity,
                Increase::Simulations::EntityUpdateValidationParams::Issue::Category::TaggedSymbol
              )

            # A beneficial owner's address could not be validated. Update the address with the [update a beneficial owner API](/documentation/api/beneficial-owners#update-a-beneficial-owner).
            BENEFICIAL_OWNER_ADDRESS =
              T.let(
                :beneficial_owner_address,
                Increase::Simulations::EntityUpdateValidationParams::Issue::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Simulations::EntityUpdateValidationParams::Issue::Category::TaggedSymbol
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
end
