# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::LockboxAddresses#retrieve
    class LockboxAddressRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute lockbox_address_id
      #   The identifier of the Lockbox Address to retrieve.
      #
      #   @return [String]
      required :lockbox_address_id, String

      # @!method initialize(lockbox_address_id:, request_options: {})
      #   @param lockbox_address_id [String] The identifier of the Lockbox Address to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
