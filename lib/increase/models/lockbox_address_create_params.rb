# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::LockboxAddresses#create
    class LockboxAddressCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute description
      #   The description you choose for the Lockbox Address.
      #
      #   @return [String, nil]
      optional :description, String

      # @!method initialize(description: nil, request_options: {})
      #   @param description [String] The description you choose for the Lockbox Address.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
