# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DigitalWalletTokenRequests#retrieve
    class DigitalWalletTokenRequestRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute digital_wallet_token_request_id
      #   The identifier of the Digital Wallet Token Request.
      #
      #   @return [String]
      required :digital_wallet_token_request_id, String

      # @!method initialize(digital_wallet_token_request_id:, request_options: {})
      #   @param digital_wallet_token_request_id [String] The identifier of the Digital Wallet Token Request.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
