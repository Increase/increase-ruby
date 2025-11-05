# typed: strong

module Increase
  module Models
    class InboundFednowTransfer < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::InboundFednowTransfer, Increase::Internal::AnyHash)
        end

      # The inbound FedNow transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account to which the transfer was sent.
      sig { returns(String) }
      attr_accessor :account_id

      # The identifier of the Account Number to which this transfer was sent.
      sig { returns(String) }
      attr_accessor :account_number_id

      # The amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # If your transfer is confirmed, this will contain details of the confirmation.
      sig { returns(T.nilable(Increase::InboundFednowTransfer::Confirmation)) }
      attr_reader :confirmation

      sig do
        params(
          confirmation:
            T.nilable(Increase::InboundFednowTransfer::Confirmation::OrHash)
        ).void
      end
      attr_writer :confirmation

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The name the sender of the transfer specified as the recipient of the transfer.
      sig { returns(String) }
      attr_accessor :creditor_name

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
      # currency. This will always be "USD" for a FedNow transfer.
      sig { returns(Increase::InboundFednowTransfer::Currency::TaggedSymbol) }
      attr_accessor :currency

      # The account number of the account that sent the transfer.
      sig { returns(String) }
      attr_accessor :debtor_account_number

      # The name provided by the sender of the transfer.
      sig { returns(String) }
      attr_accessor :debtor_name

      # The routing number of the account that sent the transfer.
      sig { returns(String) }
      attr_accessor :debtor_routing_number

      # If your transfer is declined, this will contain details of the decline.
      sig { returns(T.nilable(Increase::InboundFednowTransfer::Decline)) }
      attr_reader :decline

      sig do
        params(
          decline: T.nilable(Increase::InboundFednowTransfer::Decline::OrHash)
        ).void
      end
      attr_writer :decline

      # The lifecycle status of the transfer.
      sig { returns(Increase::InboundFednowTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # The identifier of the Transaction object created when the transfer was
      # confirmed.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      # `inbound_fednow_transfer`.
      sig { returns(Increase::InboundFednowTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # Additional information included with the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :unstructured_remittance_information

      # An Inbound FedNow Transfer is a FedNow transfer initiated outside of Increase to
      # your account.
      sig do
        params(
          id: String,
          account_id: String,
          account_number_id: String,
          amount: Integer,
          confirmation:
            T.nilable(Increase::InboundFednowTransfer::Confirmation::OrHash),
          created_at: Time,
          creditor_name: String,
          currency: Increase::InboundFednowTransfer::Currency::OrSymbol,
          debtor_account_number: String,
          debtor_name: String,
          debtor_routing_number: String,
          decline: T.nilable(Increase::InboundFednowTransfer::Decline::OrHash),
          status: Increase::InboundFednowTransfer::Status::OrSymbol,
          transaction_id: T.nilable(String),
          type: Increase::InboundFednowTransfer::Type::OrSymbol,
          unstructured_remittance_information: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The inbound FedNow transfer's identifier.
        id:,
        # The Account to which the transfer was sent.
        account_id:,
        # The identifier of the Account Number to which this transfer was sent.
        account_number_id:,
        # The amount in USD cents.
        amount:,
        # If your transfer is confirmed, this will contain details of the confirmation.
        confirmation:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was created.
        created_at:,
        # The name the sender of the transfer specified as the recipient of the transfer.
        creditor_name:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
        # currency. This will always be "USD" for a FedNow transfer.
        currency:,
        # The account number of the account that sent the transfer.
        debtor_account_number:,
        # The name provided by the sender of the transfer.
        debtor_name:,
        # The routing number of the account that sent the transfer.
        debtor_routing_number:,
        # If your transfer is declined, this will contain details of the decline.
        decline:,
        # The lifecycle status of the transfer.
        status:,
        # The identifier of the Transaction object created when the transfer was
        # confirmed.
        transaction_id:,
        # A constant representing the object's type. For this resource it will always be
        # `inbound_fednow_transfer`.
        type:,
        # Additional information included with the transfer.
        unstructured_remittance_information:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            account_number_id: String,
            amount: Integer,
            confirmation:
              T.nilable(Increase::InboundFednowTransfer::Confirmation),
            created_at: Time,
            creditor_name: String,
            currency: Increase::InboundFednowTransfer::Currency::TaggedSymbol,
            debtor_account_number: String,
            debtor_name: String,
            debtor_routing_number: String,
            decline: T.nilable(Increase::InboundFednowTransfer::Decline),
            status: Increase::InboundFednowTransfer::Status::TaggedSymbol,
            transaction_id: T.nilable(String),
            type: Increase::InboundFednowTransfer::Type::TaggedSymbol,
            unstructured_remittance_information: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Confirmation < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundFednowTransfer::Confirmation,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the FedNow Transfer that led to this Transaction.
        sig { returns(String) }
        attr_accessor :transfer_id

        # If your transfer is confirmed, this will contain details of the confirmation.
        sig { params(transfer_id: String).returns(T.attached_class) }
        def self.new(
          # The identifier of the FedNow Transfer that led to this Transaction.
          transfer_id:
        )
        end

        sig { override.returns({ transfer_id: String }) }
        def to_hash
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
      # currency. This will always be "USD" for a FedNow transfer.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::InboundFednowTransfer::Currency)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # US Dollar (USD)
        USD =
          T.let(:USD, Increase::InboundFednowTransfer::Currency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::InboundFednowTransfer::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Decline < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundFednowTransfer::Decline,
              Increase::Internal::AnyHash
            )
          end

        # Why the transfer was declined.
        sig do
          returns(
            Increase::InboundFednowTransfer::Decline::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        # The identifier of the FedNow Transfer that led to this declined transaction.
        sig { returns(String) }
        attr_accessor :transfer_id

        # If your transfer is declined, this will contain details of the decline.
        sig do
          params(
            reason: Increase::InboundFednowTransfer::Decline::Reason::OrSymbol,
            transfer_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Why the transfer was declined.
          reason:,
          # The identifier of the FedNow Transfer that led to this declined transaction.
          transfer_id:
        )
        end

        sig do
          override.returns(
            {
              reason:
                Increase::InboundFednowTransfer::Decline::Reason::TaggedSymbol,
              transfer_id: String
            }
          )
        end
        def to_hash
        end

        # Why the transfer was declined.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::InboundFednowTransfer::Decline::Reason)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The account number is canceled.
          ACCOUNT_NUMBER_CANCELED =
            T.let(
              :account_number_canceled,
              Increase::InboundFednowTransfer::Decline::Reason::TaggedSymbol
            )

          # The account number is disabled.
          ACCOUNT_NUMBER_DISABLED =
            T.let(
              :account_number_disabled,
              Increase::InboundFednowTransfer::Decline::Reason::TaggedSymbol
            )

          # Your account is restricted.
          ACCOUNT_RESTRICTED =
            T.let(
              :account_restricted,
              Increase::InboundFednowTransfer::Decline::Reason::TaggedSymbol
            )

          # Your account is inactive.
          GROUP_LOCKED =
            T.let(
              :group_locked,
              Increase::InboundFednowTransfer::Decline::Reason::TaggedSymbol
            )

          # The account's entity is not active.
          ENTITY_NOT_ACTIVE =
            T.let(
              :entity_not_active,
              Increase::InboundFednowTransfer::Decline::Reason::TaggedSymbol
            )

          # Your account is not enabled to receive FedNow transfers.
          FEDNOW_NOT_ENABLED =
            T.let(
              :fednow_not_enabled,
              Increase::InboundFednowTransfer::Decline::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundFednowTransfer::Decline::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The lifecycle status of the transfer.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::InboundFednowTransfer::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The transfer is pending confirmation.
        PENDING_CONFIRMING =
          T.let(
            :pending_confirming,
            Increase::InboundFednowTransfer::Status::TaggedSymbol
          )

        # The transfer was not responded to in time.
        TIMED_OUT =
          T.let(
            :timed_out,
            Increase::InboundFednowTransfer::Status::TaggedSymbol
          )

        # The transfer has been received successfully and is confirmed.
        CONFIRMED =
          T.let(
            :confirmed,
            Increase::InboundFednowTransfer::Status::TaggedSymbol
          )

        # The transfer has been declined.
        DECLINED =
          T.let(
            :declined,
            Increase::InboundFednowTransfer::Status::TaggedSymbol
          )

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION =
          T.let(
            :requires_attention,
            Increase::InboundFednowTransfer::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::InboundFednowTransfer::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_fednow_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::InboundFednowTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INBOUND_FEDNOW_TRANSFER =
          T.let(
            :inbound_fednow_transfer,
            Increase::InboundFednowTransfer::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::InboundFednowTransfer::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
