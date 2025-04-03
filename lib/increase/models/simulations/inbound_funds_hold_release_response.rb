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
        #     example, this is cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute automatically_releases_at
        #   When the hold will be released automatically. Certain conditions may cause it to
        #     be released before this time.
        #
        #   @return [Time]
        required :automatically_releases_at, Time

        # @!attribute created_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
        #     was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        #     currency.
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
        #     `inbound_funds_hold`.
        #
        #   @return [Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type]
        required :type, enum: -> { Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type }

        # @!parse
        #   # We hold funds for certain transaction types to account for return windows where
        #   #   funds might still be clawed back by the sending institution.
        #   #
        #   # @param id [String]
        #   # @param amount [Integer]
        #   # @param automatically_releases_at [Time]
        #   # @param created_at [Time]
        #   # @param currency [Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency]
        #   # @param held_transaction_id [String, nil]
        #   # @param pending_transaction_id [String, nil]
        #   # @param released_at [Time, nil]
        #   # @param status [Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Status]
        #   # @param type [Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type]
        #   #
        #   def initialize(
        #     id:,
        #     amount:,
        #     automatically_releases_at:,
        #     created_at:,
        #     currency:,
        #     held_transaction_id:,
        #     pending_transaction_id:,
        #     released_at:,
        #     status:,
        #     type:,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        #   currency.
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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end

        # A constant representing the object's type. For this resource it will always be
        #   `inbound_funds_hold`.
        #
        # @see Increase::Models::Simulations::InboundFundsHoldReleaseResponse#type
        module Type
          extend Increase::Internal::Type::Enum

          INBOUND_FUNDS_HOLD = :inbound_funds_hold

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
