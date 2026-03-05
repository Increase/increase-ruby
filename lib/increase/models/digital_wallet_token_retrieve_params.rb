# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DigitalWalletTokens#retrieve
    class DigitalWalletTokenRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute digital_wallet_token_id
      #   The identifier of the Digital Wallet Token.
      #
      #   @return [String]
      required :digital_wallet_token_id, String

      # @!method initialize(digital_wallet_token_id:, request_options: {})
      #   @param digital_wallet_token_id [String] The identifier of the Digital Wallet Token.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
