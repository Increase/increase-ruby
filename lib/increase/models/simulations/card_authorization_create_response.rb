# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardAuthorizations#create
      class CardAuthorizationCreateResponse < Increase::Internal::Type::BaseModel
        # @!attribute declined_transaction
        #   If the authorization attempt fails, this will contain the resulting
        #   [Declined Transaction](#declined-transactions) object. The Declined
        #   Transaction's `source` will be of `category: card_decline`.
        #
        #   @return [Increase::Models::DeclinedTransaction, nil]
        required :declined_transaction, -> { Increase::DeclinedTransaction }, nil?: true

        # @!attribute pending_transaction
        #   If the authorization attempt succeeds, this will contain the resulting Pending
        #   Transaction object. The Pending Transaction's `source` will be of
        #   `category: card_authorization`.
        #
        #   @return [Increase::Models::PendingTransaction, nil]
        required :pending_transaction, -> { Increase::PendingTransaction }, nil?: true

        # @!attribute type
        #   A constant representing the object's type. For this resource it will always be
        #   `inbound_card_authorization_simulation_result`.
        #
        #   @return [Symbol, Increase::Models::Simulations::CardAuthorizationCreateResponse::Type]
        required :type, enum: -> { Increase::Models::Simulations::CardAuthorizationCreateResponse::Type }

        # @!method initialize(declined_transaction:, pending_transaction:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::CardAuthorizationCreateResponse} for more
        #   details.
        #
        #   The results of a Card Authorization simulation.
        #
        #   @param declined_transaction [Increase::Models::DeclinedTransaction, nil] If the authorization attempt fails, this will contain the resulting [Declined Tr
        #
        #   @param pending_transaction [Increase::Models::PendingTransaction, nil] If the authorization attempt succeeds, this will contain the resulting Pending T
        #
        #   @param type [Symbol, Increase::Models::Simulations::CardAuthorizationCreateResponse::Type] A constant representing the object's type. For this resource it will always be `

        # A constant representing the object's type. For this resource it will always be
        # `inbound_card_authorization_simulation_result`.
        #
        # @see Increase::Models::Simulations::CardAuthorizationCreateResponse#type
        module Type
          extend Increase::Internal::Type::Enum

          INBOUND_CARD_AUTHORIZATION_SIMULATION_RESULT = :inbound_card_authorization_simulation_result

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
