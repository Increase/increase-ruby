# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Cards#details
    class CardDetails < Increase::Internal::Type::BaseModel
      # @!attribute card_id
      #   The identifier for the Card for which sensitive details have been returned.
      #
      #   @return [String]
      required :card_id, String

      # @!attribute expiration_month
      #   The month the card expires in M format (e.g., August is 8).
      #
      #   @return [Integer]
      required :expiration_month, Integer

      # @!attribute expiration_year
      #   The year the card expires in YYYY format (e.g., 2025).
      #
      #   @return [Integer]
      required :expiration_year, Integer

      # @!attribute primary_account_number
      #   The card number.
      #
      #   @return [String]
      required :primary_account_number, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `card_details`.
      #
      #   @return [Symbol, Increase::Models::CardDetails::Type]
      required :type, enum: -> { Increase::Models::CardDetails::Type }

      # @!attribute verification_code
      #   The three-digit verification code for the card. It's also known as the Card
      #     Verification Code (CVC), the Card Verification Value (CVV), or the Card
      #     Identification (CID).
      #
      #   @return [String]
      required :verification_code, String

      # @!parse
      #   # An object containing the sensitive details (card number, cvc, etc) for a Card.
      #   #
      #   # @param card_id [String]
      #   # @param expiration_month [Integer]
      #   # @param expiration_year [Integer]
      #   # @param primary_account_number [String]
      #   # @param type [Symbol, Increase::Models::CardDetails::Type]
      #   # @param verification_code [String]
      #   #
      #   def initialize(card_id:, expiration_month:, expiration_year:, primary_account_number:, type:, verification_code:, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # A constant representing the object's type. For this resource it will always be
      #   `card_details`.
      #
      # @see Increase::Models::CardDetails#type
      module Type
        extend Increase::Internal::Type::Enum

        CARD_DETAILS = :card_details

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
