# frozen_string_literal: true

module Increase
  module Models
    # @example
    # ```ruby
    # inbound_mail_item => {
    #   id: String,
    #   created_at: Time,
    #   file_id: String,
    #   lockbox_id: String,
    #   recipient_name: String,
    #   **_
    # }
    # ```
    class InboundMailItem < Increase::BaseModel
      # @!attribute id
      #   The Inbound Mail Item identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Inbound Mail Item was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute file_id
      #   The identifier for the File containing the scanned contents of the mail item.
      #
      #   @return [String]
      required :file_id, String

      # @!attribute lockbox_id
      #   The identifier for the Lockbox that received this mail item. For mail items that could not be processed due to an invalid address, this will be null.
      #
      #   @return [String, nil]
      required :lockbox_id, String

      # @!attribute recipient_name
      #   The recipient name as written on the mail item.
      #
      #   @return [String, nil]
      required :recipient_name, String

      # @!attribute rejection_reason
      #   If the mail item has been rejected, why it was rejected.
      #
      #   @return [Symbol, Increase::Models::InboundMailItem::RejectionReason, nil]
      required :rejection_reason, enum: -> { Increase::Models::InboundMailItem::RejectionReason }

      # @!attribute status
      #   If the mail item has been processed.
      #
      #   @return [Symbol, Increase::Models::InboundMailItem::Status]
      required :status, enum: -> { Increase::Models::InboundMailItem::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be `inbound_mail_item`.
      #
      #   @return [Symbol, Increase::Models::InboundMailItem::Type]
      required :type, enum: -> { Increase::Models::InboundMailItem::Type }

      # @!parse
      #   # Inbound Mail Items represent pieces of physical mail delivered to a Lockbox.
      #   #
      #   # @param id [String] The Inbound Mail Item identifier.
      #   #
      #   # @param created_at [String] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Inbound
      #   #   Mail Item was created.
      #   #
      #   # @param file_id [String] The identifier for the File containing the scanned contents of the mail item.
      #   #
      #   # @param lockbox_id [String, nil] The identifier for the Lockbox that received this mail item. For mail items that
      #   #   could not be processed due to an invalid address, this will be null.
      #   #
      #   # @param recipient_name [String, nil] The recipient name as written on the mail item.
      #   #
      #   # @param rejection_reason [String, nil] If the mail item has been rejected, why it was rejected.
      #   #
      #   # @param status [String] If the mail item has been processed.
      #   #
      #   # @param type [String] A constant representing the object's type. For this resource it will always be
      #   #   `inbound_mail_item`.
      #   #
      #   def initialize(id:, created_at:, file_id:, lockbox_id:, recipient_name:, rejection_reason:, status:, type:, **) = super

      # def initialize: (Hash | Increase::BaseModel) -> void

      # If the mail item has been rejected, why it was rejected.
      #
      # @example
      # ```ruby
      # case rejection_reason
      # in :no_matching_lockbox
      #   # ...
      # in :no_check
      #   # ...
      # in :lockbox_not_active
      #   # ...
      # end
      # ```
      class RejectionReason < Increase::Enum
        # The mail item does not match any lockbox.
        NO_MATCHING_LOCKBOX = :no_matching_lockbox

        # The mail item does not contain a check.
        NO_CHECK = :no_check

        # The Lockbox or its associated Account is not active.
        LOCKBOX_NOT_ACTIVE = :lockbox_not_active

        finalize!
      end

      # If the mail item has been processed.
      #
      # @example
      # ```ruby
      # case status
      # in :pending
      #   # ...
      # in :processed
      #   # ...
      # in :rejected
      #   # ...
      # end
      # ```
      class Status < Increase::Enum
        # The mail item is pending processing.
        PENDING = :pending

        # The mail item has been processed.
        PROCESSED = :processed

        # The mail item has been rejected.
        REJECTED = :rejected

        finalize!
      end

      # A constant representing the object's type. For this resource it will always be `inbound_mail_item`.
      #
      # @example
      # ```ruby
      # case type
      # in :inbound_mail_item
      #   # ...
      # end
      # ```
      class Type < Increase::Enum
        INBOUND_MAIL_ITEM = :inbound_mail_item

        finalize!
      end
    end
  end
end
