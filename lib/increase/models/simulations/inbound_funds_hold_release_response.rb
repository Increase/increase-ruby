# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::InboundFundsHolds#release
      class InboundFundsHoldReleaseResponse < Increase::Internal::Type::BaseModel
        # @!attribute id
        #   The Inbound Funds Hold identifier.
        #
        #   @return [String]
        required :id, String

        # @!attribute amount
        #   The held amount in the minor unit of the account's currency. For dollars, for
        #   example, this is cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute automatically_releases_at
        #   When the hold will be released automatically. Certain conditions may cause it to
        #   be released before this time.
        #
        #   @return [Time]
        required :automatically_releases_at, Time

        # @!attribute created_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
        #   was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        #   currency.
        #
        #   @return [Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency]
        required :currency, enum: -> { Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency }

        # @!attribute held_transaction_id
        #   The ID of the Transaction for which funds were held.
        #
        #   @return [String, nil]
        required :held_transaction_id, String, nil?: true

        # @!attribute pending_transaction_id
        #   The ID of the Pending Transaction representing the held funds.
        #
        #   @return [String, nil]
        required :pending_transaction_id, String, nil?: true

        # @!attribute released_at
        #   When the hold was released (if it has been released).
        #
        #   @return [Time, nil]
        required :released_at, Time, nil?: true

        # @!attribute status
        #   The status of the hold.
        #
        #   @return [Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Status]
        required :status, enum: -> { Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Status }

        # @!attribute type
        #   A constant representing the object's type. For this resource it will always be
        #   `inbound_funds_hold`.
        #
        #   @return [Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type]
        required :type, enum: -> { Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type }

        # @!method initialize(id:, amount:, automatically_releases_at:, created_at:, currency:, held_transaction_id:, pending_transaction_id:, released_at:, status:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::InboundFundsHoldReleaseResponse} for more
        #   details.
        #
        #   We hold funds for certain transaction types to account for return windows where
        #   funds might still be clawed back by the sending institution.
        #
        #   @param id [String] The Inbound Funds Hold identifier.
        #
        #   @param amount [Integer] The held amount in the minor unit of the account's currency. For dollars, for ex
        #
        #   @param automatically_releases_at [Time] When the hold will be released automatically. Certain conditions may cause it to
        #
        #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold wa
        #
        #   @param currency [Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's curre
        #
        #   @param held_transaction_id [String, nil] The ID of the Transaction for which funds were held.
        #
        #   @param pending_transaction_id [String, nil] The ID of the Pending Transaction representing the held funds.
        #
        #   @param released_at [Time, nil] When the hold was released (if it has been released).
        #
        #   @param status [Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Status] The status of the hold.
        #
        #   @param type [Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type] A constant representing the object's type. For this resource it will always be `

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        # currency.
        #
        # @see Increase::Models::Simulations::InboundFundsHoldReleaseResponse#currency
        module Currency
          extend Increase::Internal::Type::Enum

          # Canadian Dollar (CAD)
          CAD = :CAD

          # Swiss Franc (CHF)
          CHF = :CHF

          # Euro (EUR)
          EUR = :EUR

          # British Pound (GBP)
          GBP = :GBP

          # Japanese Yen (JPY)
          JPY = :JPY

          # US Dollar (USD)
          USD = :USD

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The status of the hold.
        #
        # @see Increase::Models::Simulations::InboundFundsHoldReleaseResponse#status
        module Status
          extend Increase::Internal::Type::Enum

          # Funds are still being held.
          HELD = :held

          # Funds have been released.
          COMPLETE = :complete

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # A constant representing the object's type. For this resource it will always be
        # `inbound_funds_hold`.
        #
        # @see Increase::Models::Simulations::InboundFundsHoldReleaseResponse#type
        module Type
          extend Increase::Internal::Type::Enum

          INBOUND_FUNDS_HOLD = :inbound_funds_hold

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
