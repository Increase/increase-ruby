# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::LockboxRecipients#create
    class LockboxRecipient < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Lockbox Recipient identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The identifier for the Account that checks sent to this Lockbox Recipient will
      #   be deposited into.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Lockbox
      #   Recipient was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute description
      #   The description of the Lockbox Recipient.
      #
      #   @return [String, nil]
      required :description, String, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute lockbox_address_id
      #   The identifier for the Lockbox Address where this Lockbox Recipient may receive
      #   physical mail.
      #
      #   @return [String]
      required :lockbox_address_id, String

      # @!attribute mail_stop_code
      #   The mail stop code uniquely identifying this Lockbox Recipient at its Lockbox
      #   Address. It should be included in the mailing address intended for this Lockbox
      #   Recipient.
      #
      #   @return [String]
      required :mail_stop_code, String

      # @!attribute recipient_name
      #   The name of the Lockbox Recipient.
      #
      #   @return [String, nil]
      required :recipient_name, String, nil?: true

      # @!attribute status
      #   The status of the Lockbox Recipient.
      #
      #   @return [Symbol, Increase::Models::LockboxRecipient::Status, nil]
      required :status, enum: -> { Increase::LockboxRecipient::Status }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `lockbox_recipient`.
      #
      #   @return [Symbol, Increase::Models::LockboxRecipient::Type]
      required :type, enum: -> { Increase::LockboxRecipient::Type }

      # @!method initialize(id:, account_id:, created_at:, description:, idempotency_key:, lockbox_address_id:, mail_stop_code:, recipient_name:, status:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::LockboxRecipient} for more details.
      #
      #   Lockbox Recipients represent an inbox at a Lockbox Address. Checks received for
      #   a Lockbox Recipient are deposited into its associated Account.
      #
      #   @param id [String] The Lockbox Recipient identifier.
      #
      #   @param account_id [String] The identifier for the Account that checks sent to this Lockbox Recipient will b
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Lockbox
      #
      #   @param description [String, nil] The description of the Lockbox Recipient.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param lockbox_address_id [String] The identifier for the Lockbox Address where this Lockbox Recipient may receive
      #
      #   @param mail_stop_code [String] The mail stop code uniquely identifying this Lockbox Recipient at its Lockbox Ad
      #
      #   @param recipient_name [String, nil] The name of the Lockbox Recipient.
      #
      #   @param status [Symbol, Increase::Models::LockboxRecipient::Status, nil] The status of the Lockbox Recipient.
      #
      #   @param type [Symbol, Increase::Models::LockboxRecipient::Type] A constant representing the object's type. For this resource it will always be `

      # The status of the Lockbox Recipient.
      #
      # @see Increase::Models::LockboxRecipient#status
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

      # A constant representing the object's type. For this resource it will always be
      # `lockbox_recipient`.
      #
      # @see Increase::Models::LockboxRecipient#type
      module Type
        extend Increase::Internal::Type::Enum

        LOCKBOX_RECIPIENT = :lockbox_recipient

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
