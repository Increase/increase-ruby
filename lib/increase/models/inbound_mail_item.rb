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

      # @!attribute checks
      #   The checks in the mail item.
      #
      #   @return [Array<Increase::Models::InboundMailItem::Check>]
      required :checks, -> { Increase::Internal::Type::ArrayOf[Increase::InboundMailItem::Check] }

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
      #   @return [Symbol, Increase::Models::InboundMailItem::RejectionReason, nil]
      required :rejection_reason, enum: -> { Increase::InboundMailItem::RejectionReason }, nil?: true

      # @!attribute status
      #   If the mail item has been processed.
      #
      #   @return [Symbol, Increase::Models::InboundMailItem::Status]
      required :status, enum: -> { Increase::InboundMailItem::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `inbound_mail_item`.
      #
      #   @return [Symbol, Increase::Models::InboundMailItem::Type]
      required :type, enum: -> { Increase::InboundMailItem::Type }

      # @!method initialize(id:, checks:, created_at:, file_id:, lockbox_id:, recipient_name:, rejection_reason:, status:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::InboundMailItem} for more details.
      #
      #   Inbound Mail Items represent pieces of physical mail delivered to a Lockbox.
      #
      #   @param id [String] The Inbound Mail Item identifier.
      #
      #   @param checks [Array<Increase::Models::InboundMailItem::Check>] The checks in the mail item.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Inbound
      #
      #   @param file_id [String] The identifier for the File containing the scanned contents of the mail item.
      #
      #   @param lockbox_id [String, nil] The identifier for the Lockbox that received this mail item. For mail items that
      #
      #   @param recipient_name [String, nil] The recipient name as written on the mail item.
      #
      #   @param rejection_reason [Symbol, Increase::Models::InboundMailItem::RejectionReason, nil] If the mail item has been rejected, why it was rejected.
      #
      #   @param status [Symbol, Increase::Models::InboundMailItem::Status] If the mail item has been processed.
      #
      #   @param type [Symbol, Increase::Models::InboundMailItem::Type] A constant representing the object's type. For this resource it will always be `

      class Check < Increase::Internal::Type::BaseModel
        # @!attribute amount
        #   The amount of the check.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute back_file_id
        #   The identifier for the File containing the back of the check.
        #
        #   @return [String, nil]
        required :back_file_id, String, nil?: true

        # @!attribute check_deposit_id
        #   The identifier of the Check Deposit if this check was deposited.
        #
        #   @return [String, nil]
        required :check_deposit_id, String, nil?: true

        # @!attribute front_file_id
        #   The identifier for the File containing the front of the check.
        #
        #   @return [String, nil]
        required :front_file_id, String, nil?: true

        # @!attribute status
        #   The status of the Inbound Mail Item Check.
        #
        #   @return [Symbol, Increase::Models::InboundMailItem::Check::Status, nil]
        required :status, enum: -> { Increase::InboundMailItem::Check::Status }, nil?: true

        # @!method initialize(amount:, back_file_id:, check_deposit_id:, front_file_id:, status:)
        #   Inbound Mail Item Checks represent the checks in an Inbound Mail Item.
        #
        #   @param amount [Integer] The amount of the check.
        #
        #   @param back_file_id [String, nil] The identifier for the File containing the back of the check.
        #
        #   @param check_deposit_id [String, nil] The identifier of the Check Deposit if this check was deposited.
        #
        #   @param front_file_id [String, nil] The identifier for the File containing the front of the check.
        #
        #   @param status [Symbol, Increase::Models::InboundMailItem::Check::Status, nil] The status of the Inbound Mail Item Check.

        # The status of the Inbound Mail Item Check.
        #
        # @see Increase::Models::InboundMailItem::Check#status
        module Status
          extend Increase::Internal::Type::Enum

          # The check is pending processing.
          PENDING = :pending

          # The check has been deposited.
          DEPOSITED = :deposited

          # The check has been ignored.
          IGNORED = :ignored

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # If the mail item has been rejected, why it was rejected.
      #
      # @see Increase::Models::InboundMailItem#rejection_reason
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
      # @see Increase::Models::InboundMailItem#status
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
      # @see Increase::Models::InboundMailItem#type
      module Type
        extend Increase::Internal::Type::Enum

        INBOUND_MAIL_ITEM = :inbound_mail_item

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
