# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DigitalWalletTokens#transition
    class DigitalWalletTokenTransitionParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute digital_wallet_token_id
      #   The identifier of the Digital Wallet Token.
      #
      #   @return [String]
      required :digital_wallet_token_id, String

      # @!attribute status
      #   The status to transition the Digital Wallet Token to.
      #
      #   @return [Symbol, Increase::Models::DigitalWalletTokenTransitionParams::Status]
      required :status, enum: -> { Increase::DigitalWalletTokenTransitionParams::Status }

      # @!method initialize(digital_wallet_token_id:, status:, request_options: {})
      #   @param digital_wallet_token_id [String] The identifier of the Digital Wallet Token.
      #
      #   @param status [Symbol, Increase::Models::DigitalWalletTokenTransitionParams::Status]
      #     The status to transition the Digital Wallet Token to.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The status to transition the Digital Wallet Token to.
      module Status
        extend Increase::Internal::Type::Enum

        # Reactivate a suspended Digital Wallet Token.
        ACTIVE = :active

        # Temporarily pause an active Digital Wallet Token.
        SUSPENDED = :suspended

        # Permanently cancel an active, inactive, or suspended Digital Wallet Token.
        DEACTIVATED = :deactivated

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
