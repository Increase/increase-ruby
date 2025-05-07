# typed: strong

module Increase
  module Models
    class InboundMailItem < Increase::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The Inbound Mail Item identifier.
      sig { returns(String) }
      attr_accessor :id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Inbound
      # Mail Item was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The identifier for the File containing the scanned contents of the mail item.
      sig { returns(String) }
      attr_accessor :file_id

      # The identifier for the Lockbox that received this mail item. For mail items that
      # could not be processed due to an invalid address, this will be null.
      sig { returns(T.nilable(String)) }
      attr_accessor :lockbox_id

      # The recipient name as written on the mail item.
      sig { returns(T.nilable(String)) }
      attr_accessor :recipient_name

      # If the mail item has been rejected, why it was rejected.
      sig do
        returns(
          T.nilable(Increase::InboundMailItem::RejectionReason::TaggedSymbol)
        )
      end
      attr_accessor :rejection_reason

      # If the mail item has been processed.
      sig { returns(Increase::InboundMailItem::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `inbound_mail_item`.
      sig { returns(Increase::InboundMailItem::Type::TaggedSymbol) }
      attr_accessor :type

      # Inbound Mail Items represent pieces of physical mail delivered to a Lockbox.
      sig do
        params(
          id: String,
          created_at: Time,
          file_id: String,
          lockbox_id: T.nilable(String),
          recipient_name: T.nilable(String),
          rejection_reason:
            T.nilable(Increase::InboundMailItem::RejectionReason::OrSymbol),
          status: Increase::InboundMailItem::Status::OrSymbol,
          type: Increase::InboundMailItem::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Inbound Mail Item identifier.
        id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Inbound
        # Mail Item was created.
        created_at:,
        # The identifier for the File containing the scanned contents of the mail item.
        file_id:,
        # The identifier for the Lockbox that received this mail item. For mail items that
        # could not be processed due to an invalid address, this will be null.
        lockbox_id:,
        # The recipient name as written on the mail item.
        recipient_name:,
        # If the mail item has been rejected, why it was rejected.
        rejection_reason:,
        # If the mail item has been processed.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `inbound_mail_item`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            file_id: String,
            lockbox_id: T.nilable(String),
            recipient_name: T.nilable(String),
            rejection_reason:
              T.nilable(
                Increase::InboundMailItem::RejectionReason::TaggedSymbol
              ),
            status: Increase::InboundMailItem::Status::TaggedSymbol,
            type: Increase::InboundMailItem::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # If the mail item has been rejected, why it was rejected.
      module RejectionReason
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::InboundMailItem::RejectionReason)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The mail item does not match any lockbox.
        NO_MATCHING_LOCKBOX =
          T.let(
            :no_matching_lockbox,
            Increase::InboundMailItem::RejectionReason::TaggedSymbol
          )

        # The mail item does not contain a check.
        NO_CHECK =
          T.let(
            :no_check,
            Increase::InboundMailItem::RejectionReason::TaggedSymbol
          )

        # The Lockbox or its associated Account is not active.
        LOCKBOX_NOT_ACTIVE =
          T.let(
            :lockbox_not_active,
            Increase::InboundMailItem::RejectionReason::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::InboundMailItem::RejectionReason::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # If the mail item has been processed.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::InboundMailItem::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The mail item is pending processing.
        PENDING =
          T.let(:pending, Increase::InboundMailItem::Status::TaggedSymbol)

        # The mail item has been processed.
        PROCESSED =
          T.let(:processed, Increase::InboundMailItem::Status::TaggedSymbol)

        # The mail item has been rejected.
        REJECTED =
          T.let(:rejected, Increase::InboundMailItem::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::InboundMailItem::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_mail_item`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::InboundMailItem::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INBOUND_MAIL_ITEM =
          T.let(
            :inbound_mail_item,
            Increase::InboundMailItem::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::InboundMailItem::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
