# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::LockboxRecipients#update
    class LockboxRecipientUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute lockbox_recipient_id
      #   The identifier of the Lockbox Recipient.
      #
      #   @return [String]
      required :lockbox_recipient_id, String

      # @!attribute description
      #   The description you choose for the Lockbox Recipient.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute recipient_name
      #   The name of the Lockbox Recipient.
      #
      #   @return [String, nil]
      optional :recipient_name, String

      # @!attribute status
      #   The status of the Lockbox Recipient.
      #
      #   @return [Symbol, Increase::Models::LockboxRecipientUpdateParams::Status, nil]
      optional :status, enum: -> { Increase::LockboxRecipientUpdateParams::Status }

      # @!method initialize(lockbox_recipient_id:, description: nil, recipient_name: nil, status: nil, request_options: {})
      #   @param lockbox_recipient_id [String] The identifier of the Lockbox Recipient.
      #
      #   @param description [String] The description you choose for the Lockbox Recipient.
      #
      #   @param recipient_name [String] The name of the Lockbox Recipient.
      #
      #   @param status [Symbol, Increase::Models::LockboxRecipientUpdateParams::Status] The status of the Lockbox Recipient.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The status of the Lockbox Recipient.
      module Status
        extend Increase::Internal::Type::Enum

        # This Lockbox Recipient is active.
        ACTIVE = :active

        # This Lockbox Recipient is disabled. Checks mailed to this Lockbox Recipient will be rejected.
        DISABLED = :disabled

        # This Lockbox Recipient is canceled and cannot be modified. Checks mailed to this Lockbox Recipient will be rejected.
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
