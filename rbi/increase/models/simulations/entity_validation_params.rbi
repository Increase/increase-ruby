# typed: strong

module Increase
  module Models
    module Simulations
      class EntityValidationParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::EntityValidationParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Entity to set the validation on.
        sig { returns(String) }
        attr_accessor :entity_id

        # The issues to attach to the new managed compliance validation.
        sig do
          returns(
            T::Array[Increase::Simulations::EntityValidationParams::Issue]
          )
        end
        attr_accessor :issues

        # The status to set on the new managed compliance validation.
        sig do
          returns(
            Increase::Simulations::EntityValidationParams::Status::OrSymbol
          )
        end
        attr_accessor :status

        sig do
          params(
            entity_id: String,
            issues:
              T::Array[
                Increase::Simulations::EntityValidationParams::Issue::OrHash
              ],
            status:
              Increase::Simulations::EntityValidationParams::Status::OrSymbol,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Entity to set the validation on.
          entity_id:,
          # The issues to attach to the new managed compliance validation.
          issues:,
          # The status to set on the new managed compliance validation.
          status:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              entity_id: String,
              issues:
                T::Array[Increase::Simulations::EntityValidationParams::Issue],
              status:
                Increase::Simulations::EntityValidationParams::Status::OrSymbol,
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
                Increase::Simulations::EntityValidationParams::Issue,
                Increase::Internal::AnyHash
              )
            end

          # The category of the issue.
          sig do
            returns(
              Increase::Simulations::EntityValidationParams::Issue::Category::OrSymbol
            )
          end
          attr_accessor :category

          sig do
            params(
              category:
                Increase::Simulations::EntityValidationParams::Issue::Category::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The category of the issue.
            category:
          )
          end

          sig do
            override.returns(
              {
                category:
                  Increase::Simulations::EntityValidationParams::Issue::Category::OrSymbol
              }
            )
          end
          def to_hash
          end

          # The category of the issue.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Simulations::EntityValidationParams::Issue::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The entity's tax identifier could not be validated. Update the tax ID with the [update an entity API](/documentation/api/entities#update-an-entity.corporation.legal_identifier).
            ENTITY_TAX_IDENTIFIER =
              T.let(
                :entity_tax_identifier,
                Increase::Simulations::EntityValidationParams::Issue::Category::TaggedSymbol
              )

            # The entity's address could not be validated. Update the address with the [update an entity API](/documentation/api/entities#update-an-entity.corporation.address).
            ENTITY_ADDRESS =
              T.let(
                :entity_address,
                Increase::Simulations::EntityValidationParams::Issue::Category::TaggedSymbol
              )

            # A beneficial owner's identity could not be verified. Update the identification with the [update a beneficial owner API](/documentation/api/beneficial-owners#update-a-beneficial-owner).
            BENEFICIAL_OWNER_IDENTITY =
              T.let(
                :beneficial_owner_identity,
                Increase::Simulations::EntityValidationParams::Issue::Category::TaggedSymbol
              )

            # A beneficial owner's address could not be validated. Update the address with the [update a beneficial owner API](/documentation/api/beneficial-owners#update-a-beneficial-owner).
            BENEFICIAL_OWNER_ADDRESS =
              T.let(
                :beneficial_owner_address,
                Increase::Simulations::EntityValidationParams::Issue::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Simulations::EntityValidationParams::Issue::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # The status to set on the new managed compliance validation.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::EntityValidationParams::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The submitted data is valid.
          VALID =
            T.let(
              :valid,
              Increase::Simulations::EntityValidationParams::Status::TaggedSymbol
            )

          # Additional information is required to validate the data.
          INVALID =
            T.let(
              :invalid,
              Increase::Simulations::EntityValidationParams::Status::TaggedSymbol
            )

          # The submitted data is being validated.
          PENDING =
            T.let(
              :pending,
              Increase::Simulations::EntityValidationParams::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::EntityValidationParams::Status::TaggedSymbol
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
