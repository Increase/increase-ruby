# typed: strong

module Increase
  module Models
    module Simulations
      class CardAuthorizationCreateResponse < Increase::Internal::Type::BaseModel
        # If the authorization attempt fails, this will contain the resulting
        #   [Declined Transaction](#declined-transactions) object. The Declined
        #   Transaction's `source` will be of `category: card_decline`.
        sig { returns(T.nilable(Increase::Models::DeclinedTransaction)) }
        attr_reader :declined_transaction

        sig do
          params(
            declined_transaction: T.nilable(T.any(Increase::Models::DeclinedTransaction, Increase::Internal::AnyHash))
          )
            .void
        end
        attr_writer :declined_transaction

        # If the authorization attempt succeeds, this will contain the resulting Pending
        #   Transaction object. The Pending Transaction's `source` will be of
        #   `category: card_authorization`.
        sig { returns(T.nilable(Increase::Models::PendingTransaction)) }
        attr_reader :pending_transaction

        sig do
          params(
            pending_transaction: T.nilable(T.any(Increase::Models::PendingTransaction, Increase::Internal::AnyHash))
          )
            .void
        end
        attr_writer :pending_transaction

        # A constant representing the object's type. For this resource it will always be
        #   `inbound_card_authorization_simulation_result`.
        sig { returns(Increase::Models::Simulations::CardAuthorizationCreateResponse::Type::TaggedSymbol) }
        attr_accessor :type

        # The results of a Card Authorization simulation.
        sig do
          params(
            declined_transaction: T.nilable(T.any(Increase::Models::DeclinedTransaction, Increase::Internal::AnyHash)),
            pending_transaction: T.nilable(T.any(Increase::Models::PendingTransaction, Increase::Internal::AnyHash)),
            type: Increase::Models::Simulations::CardAuthorizationCreateResponse::Type::OrSymbol
          )
            .returns(T.attached_class)
        end
        def self.new(declined_transaction:, pending_transaction:, type:)
        end

        sig do
          override
            .returns(
              {
                declined_transaction: T.nilable(Increase::Models::DeclinedTransaction),
                pending_transaction: T.nilable(Increase::Models::PendingTransaction),
                type: Increase::Models::Simulations::CardAuthorizationCreateResponse::Type::TaggedSymbol
              }
            )
        end
        def to_hash
        end

        # A constant representing the object's type. For this resource it will always be
        #   `inbound_card_authorization_simulation_result`.
        module Type
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::Simulations::CardAuthorizationCreateResponse::Type) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::Simulations::CardAuthorizationCreateResponse::Type::TaggedSymbol) }

          INBOUND_CARD_AUTHORIZATION_SIMULATION_RESULT =
            T.let(
              :inbound_card_authorization_simulation_result,
              Increase::Models::Simulations::CardAuthorizationCreateResponse::Type::TaggedSymbol
            )

          sig do
            override
              .returns(T::Array[Increase::Models::Simulations::CardAuthorizationCreateResponse::Type::TaggedSymbol])
          end
          def self.values
          end
        end
      end
    end
  end
end
