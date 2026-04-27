# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::LockboxRecipients#retrieve
    class LockboxRecipientRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute lockbox_recipient_id
      #   The identifier of the Lockbox Recipient to retrieve.
      #
      #   @return [String]
      required :lockbox_recipient_id, String

      # @!method initialize(lockbox_recipient_id:, request_options: {})
      #   @param lockbox_recipient_id [String] The identifier of the Lockbox Recipient to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
