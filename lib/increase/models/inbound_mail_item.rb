# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundMailItems#retrieve
    class InboundMailItem < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Inbound Mail Item identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Inbound
      #   Mail Item was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute file_id
      #   The identifier for the File containing the scanned contents of the mail item.
      #
      #   @return [String]
      required :file_id, String

      # @!attribute lockbox_id
      #   The identifier for the Lockbox that received this mail item. For mail items that
      #   could not be processed due to an invalid address, this will be null.
      #
      #   @return [String, nil]
      required :lockbox_id, String, nil?: true

      # @!attribute recipient_name
      #   The recipient name as written on the mail item.
      #
      #   @return [String, nil]
      required :recipient_name, String, nil?: true

      # @!attribute rejection_reason
      #   If the mail item has been rejected, why it was rejected.
      #
      #   @return [Symbol, Increase::InboundMailItem::RejectionReason, nil]
      required :rejection_reason, enum: -> { Increase::InboundMailItem::RejectionReason }, nil?: true

      # @!attribute status
      #   If the mail item has been processed.
      #
      #   @return [Symbol, Increase::InboundMailItem::Status]
      required :status, enum: -> { Increase::InboundMailItem::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `inbound_mail_item`.
      #
      #   @return [Symbol, Increase::InboundMailItem::Type]
      required :type, enum: -> { Increase::InboundMailItem::Type }

      # @!method initialize(id:, created_at:, file_id:, lockbox_id:, recipient_name:, rejection_reason:, status:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::InboundMailItem} for more details.
      #
      #   Inbound Mail Items represent pieces of physical mail delivered to a Lockbox.
      #
      #   @param id [String] The Inbound Mail Item identifier.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Inbound
      #
      #   @param file_id [String] The identifier for the File containing the scanned contents of the mail item.
      #
      #   @param lockbox_id [String, nil] The identifier for the Lockbox that received this mail item. For mail items that
      #
      #   @param recipient_name [String, nil] The recipient name as written on the mail item.
      #
      #   @param rejection_reason [Symbol, Increase::InboundMailItem::RejectionReason, nil] If the mail item has been rejected, why it was rejected.
      #
      #   @param status [Symbol, Increase::InboundMailItem::Status] If the mail item has been processed.
      #
      #   @param type [Symbol, Increase::InboundMailItem::Type] A constant representing the object's type. For this resource it will always be `

      # If the mail item has been rejected, why it was rejected.
      #
      # @see Increase::InboundMailItem#rejection_reason
      module RejectionReason
        extend Increase::Internal::Type::Enum

        # The mail item does not match any lockbox.
        NO_MATCHING_LOCKBOX = :no_matching_lockbox

        # The mail item does not contain a check.
        NO_CHECK = :no_check

        # The Lockbox or its associated Account is not active.
        LOCKBOX_NOT_ACTIVE = :lockbox_not_active

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # If the mail item has been processed.
      #
      # @see Increase::InboundMailItem#status
      module Status
        extend Increase::Internal::Type::Enum

        # The mail item is pending processing.
        PENDING = :pending

        # The mail item has been processed.
        PROCESSED = :processed

        # The mail item has been rejected.
        REJECTED = :rejected

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_mail_item`.
      #
      # @see Increase::InboundMailItem#type
      module Type
        extend Increase::Internal::Type::Enum

        INBOUND_MAIL_ITEM = :inbound_mail_item

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
