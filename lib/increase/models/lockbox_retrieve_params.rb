# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Lockboxes#retrieve
    class LockboxRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute lockbox_id
      #   The identifier of the Lockbox to retrieve.
      #
      #   @return [String]
      required :lockbox_id, String

      # @!method initialize(lockbox_id:, request_options: {})
      #   @param lockbox_id [String] The identifier of the Lockbox to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
