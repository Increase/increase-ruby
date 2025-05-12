# typed: strong

module Increase
  module Models
    module Simulations
      class CardAuthorizationCreateResponse < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Models::Simulations::CardAuthorizationCreateResponse,
              Increase::Internal::AnyHash
            )
          end

        # If the authorization attempt fails, this will contain the resulting
        # [Declined Transaction](#declined-transactions) object. The Declined
        # Transaction's `source` will be of `category: card_decline`.
        sig { returns(T.nilable(Increase::DeclinedTransaction)) }
        attr_reader :declined_transaction

        sig do
          params(
            declined_transaction:
              T.nilable(Increase::DeclinedTransaction::OrHash)
          ).void
        end
        attr_writer :declined_transaction

        # If the authorization attempt succeeds, this will contain the resulting Pending
        # Transaction object. The Pending Transaction's `source` will be of
        # `category: card_authorization`.
        sig { returns(T.nilable(Increase::PendingTransaction)) }
        attr_reader :pending_transaction

        sig do
          params(
            pending_transaction: T.nilable(Increase::PendingTransaction::OrHash)
          ).void
        end
        attr_writer :pending_transaction

        # A constant representing the object's type. For this resource it will always be
        # `inbound_card_authorization_simulation_result`.
        sig do
          returns(
            Increase::Models::Simulations::CardAuthorizationCreateResponse::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The results of a Card Authorization simulation.
        sig do
          params(
            declined_transaction:
              T.nilable(Increase::DeclinedTransaction::OrHash),
            pending_transaction:
              T.nilable(Increase::PendingTransaction::OrHash),
            type:
              Increase::Models::Simulations::CardAuthorizationCreateResponse::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # If the authorization attempt fails, this will contain the resulting
          # [Declined Transaction](#declined-transactions) object. The Declined
          # Transaction's `source` will be of `category: card_decline`.
          declined_transaction:,
          # If the authorization attempt succeeds, this will contain the resulting Pending
          # Transaction object. The Pending Transaction's `source` will be of
          # `category: card_authorization`.
          pending_transaction:,
          # A constant representing the object's type. For this resource it will always be
          # `inbound_card_authorization_simulation_result`.
          type:
        )
        end

        sig do
          override.returns(
            {
              declined_transaction: T.nilable(Increase::DeclinedTransaction),
              pending_transaction: T.nilable(Increase::PendingTransaction),
              type:
                Increase::Models::Simulations::CardAuthorizationCreateResponse::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # A constant representing the object's type. For this resource it will always be
        # `inbound_card_authorization_simulation_result`.
        module Type
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Models::Simulations::CardAuthorizationCreateResponse::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INBOUND_CARD_AUTHORIZATION_SIMULATION_RESULT =
            T.let(
              :inbound_card_authorization_simulation_result,
              Increase::Models::Simulations::CardAuthorizationCreateResponse::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Models::Simulations::CardAuthorizationCreateResponse::Type::TaggedSymbol
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
