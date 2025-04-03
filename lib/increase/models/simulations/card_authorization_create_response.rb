# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardAuthorizations#create
      class CardAuthorizationCreateResponse < Increase::Internal::Type::BaseModel
        # @!attribute declined_transaction
        #   If the authorization attempt fails, this will contain the resulting
        #     [Declined Transaction](#declined-transactions) object. The Declined
        #     Transaction's `source` will be of `category: card_decline`.
        #
        #   @return [Increase::Models::DeclinedTransaction, nil]
        required :declined_transaction, -> { Increase::Models::DeclinedTransaction }, nil?: true

        # @!attribute pending_transaction
        #   If the authorization attempt succeeds, this will contain the resulting Pending
        #     Transaction object. The Pending Transaction's `source` will be of
        #     `category: card_authorization`.
        #
        #   @return [Increase::Models::PendingTransaction, nil]
        required :pending_transaction, -> { Increase::Models::PendingTransaction }, nil?: true

        # @!attribute type
        #   A constant representing the object's type. For this resource it will always be
        #     `inbound_card_authorization_simulation_result`.
        #
        #   @return [Symbol, Increase::Models::Simulations::CardAuthorizationCreateResponse::Type]
        required :type, enum: -> { Increase::Models::Simulations::CardAuthorizationCreateResponse::Type }

        # @!parse
        #   # The results of a Card Authorization simulation.
        #   #
        #   # @param declined_transaction [Increase::Models::DeclinedTransaction, nil]
        #   # @param pending_transaction [Increase::Models::PendingTransaction, nil]
        #   # @param type [Symbol, Increase::Models::Simulations::CardAuthorizationCreateResponse::Type]
        #   #
        #   def initialize(declined_transaction:, pending_transaction:, type:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # A constant representing the object's type. For this resource it will always be
        #   `inbound_card_authorization_simulation_result`.
        #
        # @see Increase::Models::Simulations::CardAuthorizationCreateResponse#type
        module Type
          extend Increase::Internal::Type::Enum

          INBOUND_CARD_AUTHORIZATION_SIMULATION_RESULT = :inbound_card_authorization_simulation_result

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
