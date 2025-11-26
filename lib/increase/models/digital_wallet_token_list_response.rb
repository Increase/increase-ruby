# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DigitalWalletTokens#list
    class DigitalWalletTokenListResponse < Increase::Internal::Type::BaseModel
      # @!attribute data
      #   The contents of the list.
      #
      #   @return [Array<Increase::Models::DigitalWalletToken>]
      required :data, -> { Increase::Internal::Type::ArrayOf[Increase::DigitalWalletToken] }

      # @!attribute next_cursor
      #   A pointer to a place in the list.
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, next_cursor:)
      #   A list of Digital Wallet Token objects.
      #
      #   @param data [Array<Increase::Models::DigitalWalletToken>] The contents of the list.
      #
      #   @param next_cursor [String, nil] A pointer to a place in the list.
    end
  end
end
