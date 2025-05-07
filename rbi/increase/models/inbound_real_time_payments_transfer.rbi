# typed: strong

module Increase
  module Models
    class InboundRealTimePaymentsTransfer < Increase::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The inbound Real-Time Payments transfer's identifier.
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
      sig do
        returns(
          T.nilable(Increase::InboundRealTimePaymentsTransfer::Confirmation)
        )
      end
      attr_reader :confirmation

      sig do
        params(
          confirmation:
            T.nilable(
              Increase::InboundRealTimePaymentsTransfer::Confirmation::OrHash
            )
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
      # currency. This will always be "USD" for a Real-Time Payments transfer.
      sig do
        returns(
          Increase::InboundRealTimePaymentsTransfer::Currency::TaggedSymbol
        )
      end
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
      sig do
        returns(T.nilable(Increase::InboundRealTimePaymentsTransfer::Decline))
      end
      attr_reader :decline

      sig do
        params(
          decline:
            T.nilable(
              Increase::InboundRealTimePaymentsTransfer::Decline::OrHash
            )
        ).void
      end
      attr_writer :decline

      # Additional information included with the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :remittance_information

      # The lifecycle status of the transfer.
      sig do
        returns(Increase::InboundRealTimePaymentsTransfer::Status::TaggedSymbol)
      end
      attr_accessor :status

      # The Real-Time Payments network identification of the transfer.
      sig { returns(String) }
      attr_accessor :transaction_identification

      # A constant representing the object's type. For this resource it will always be
      # `inbound_real_time_payments_transfer`.
      sig do
        returns(Increase::InboundRealTimePaymentsTransfer::Type::TaggedSymbol)
      end
      attr_accessor :type

      # An Inbound Real-Time Payments Transfer is a Real-Time Payments transfer
      # initiated outside of Increase to your account.
      sig do
        params(
          id: String,
          account_id: String,
          account_number_id: String,
          amount: Integer,
          confirmation:
            T.nilable(
              Increase::InboundRealTimePaymentsTransfer::Confirmation::OrHash
            ),
          created_at: Time,
          creditor_name: String,
          currency:
            Increase::InboundRealTimePaymentsTransfer::Currency::OrSymbol,
          debtor_account_number: String,
          debtor_name: String,
          debtor_routing_number: String,
          decline:
            T.nilable(
              Increase::InboundRealTimePaymentsTransfer::Decline::OrHash
            ),
          remittance_information: T.nilable(String),
          status: Increase::InboundRealTimePaymentsTransfer::Status::OrSymbol,
          transaction_identification: String,
          type: Increase::InboundRealTimePaymentsTransfer::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The inbound Real-Time Payments transfer's identifier.
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
        # currency. This will always be "USD" for a Real-Time Payments transfer.
        currency:,
        # The account number of the account that sent the transfer.
        debtor_account_number:,
        # The name provided by the sender of the transfer.
        debtor_name:,
        # The routing number of the account that sent the transfer.
        debtor_routing_number:,
        # If your transfer is declined, this will contain details of the decline.
        decline:,
        # Additional information included with the transfer.
        remittance_information:,
        # The lifecycle status of the transfer.
        status:,
        # The Real-Time Payments network identification of the transfer.
        transaction_identification:,
        # A constant representing the object's type. For this resource it will always be
        # `inbound_real_time_payments_transfer`.
        type:
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
              T.nilable(
                Increase::InboundRealTimePaymentsTransfer::Confirmation
              ),
            created_at: Time,
            creditor_name: String,
            currency:
              Increase::InboundRealTimePaymentsTransfer::Currency::TaggedSymbol,
            debtor_account_number: String,
            debtor_name: String,
            debtor_routing_number: String,
            decline:
              T.nilable(Increase::InboundRealTimePaymentsTransfer::Decline),
            remittance_information: T.nilable(String),
            status:
              Increase::InboundRealTimePaymentsTransfer::Status::TaggedSymbol,
            transaction_identification: String,
            type: Increase::InboundRealTimePaymentsTransfer::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Confirmation < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # The time at which the transfer was confirmed.
        sig { returns(Time) }
        attr_accessor :confirmed_at

        # The id of the transaction for the confirmed transfer.
        sig { returns(String) }
        attr_accessor :transaction_id

        # If your transfer is confirmed, this will contain details of the confirmation.
        sig do
          params(confirmed_at: Time, transaction_id: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The time at which the transfer was confirmed.
          confirmed_at:,
          # The id of the transaction for the confirmed transfer.
          transaction_id:
        )
        end

        sig { override.returns({ confirmed_at: Time, transaction_id: String }) }
        def to_hash
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the transfer's
      # currency. This will always be "USD" for a Real-Time Payments transfer.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::InboundRealTimePaymentsTransfer::Currency)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Canadian Dollar (CAD)
        CAD =
          T.let(
            :CAD,
            Increase::InboundRealTimePaymentsTransfer::Currency::TaggedSymbol
          )

        # Swiss Franc (CHF)
        CHF =
          T.let(
            :CHF,
            Increase::InboundRealTimePaymentsTransfer::Currency::TaggedSymbol
          )

        # Euro (EUR)
        EUR =
          T.let(
            :EUR,
            Increase::InboundRealTimePaymentsTransfer::Currency::TaggedSymbol
          )

        # British Pound (GBP)
        GBP =
          T.let(
            :GBP,
            Increase::InboundRealTimePaymentsTransfer::Currency::TaggedSymbol
          )

        # Japanese Yen (JPY)
        JPY =
          T.let(
            :JPY,
            Increase::InboundRealTimePaymentsTransfer::Currency::TaggedSymbol
          )

        # US Dollar (USD)
        USD =
          T.let(
            :USD,
            Increase::InboundRealTimePaymentsTransfer::Currency::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::InboundRealTimePaymentsTransfer::Currency::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Decline < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # The time at which the transfer was declined.
        sig { returns(Time) }
        attr_accessor :declined_at

        # The id of the transaction for the declined transfer.
        sig { returns(String) }
        attr_accessor :declined_transaction_id

        # The reason for the transfer decline.
        sig do
          returns(
            Increase::InboundRealTimePaymentsTransfer::Decline::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        # If your transfer is declined, this will contain details of the decline.
        sig do
          params(
            declined_at: Time,
            declined_transaction_id: String,
            reason:
              Increase::InboundRealTimePaymentsTransfer::Decline::Reason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The time at which the transfer was declined.
          declined_at:,
          # The id of the transaction for the declined transfer.
          declined_transaction_id:,
          # The reason for the transfer decline.
          reason:
        )
        end

        sig do
          override.returns(
            {
              declined_at: Time,
              declined_transaction_id: String,
              reason:
                Increase::InboundRealTimePaymentsTransfer::Decline::Reason::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The reason for the transfer decline.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::InboundRealTimePaymentsTransfer::Decline::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The account number is canceled.
          ACCOUNT_NUMBER_CANCELED =
            T.let(
              :account_number_canceled,
              Increase::InboundRealTimePaymentsTransfer::Decline::Reason::TaggedSymbol
            )

          # The account number is disabled.
          ACCOUNT_NUMBER_DISABLED =
            T.let(
              :account_number_disabled,
              Increase::InboundRealTimePaymentsTransfer::Decline::Reason::TaggedSymbol
            )

          # Your account is restricted.
          ACCOUNT_RESTRICTED =
            T.let(
              :account_restricted,
              Increase::InboundRealTimePaymentsTransfer::Decline::Reason::TaggedSymbol
            )

          # Your account is inactive.
          GROUP_LOCKED =
            T.let(
              :group_locked,
              Increase::InboundRealTimePaymentsTransfer::Decline::Reason::TaggedSymbol
            )

          # The account's entity is not active.
          ENTITY_NOT_ACTIVE =
            T.let(
              :entity_not_active,
              Increase::InboundRealTimePaymentsTransfer::Decline::Reason::TaggedSymbol
            )

          # Your account is not enabled to receive Real-Time Payments transfers.
          REAL_TIME_PAYMENTS_NOT_ENABLED =
            T.let(
              :real_time_payments_not_enabled,
              Increase::InboundRealTimePaymentsTransfer::Decline::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundRealTimePaymentsTransfer::Decline::Reason::TaggedSymbol
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
            T.all(Symbol, Increase::InboundRealTimePaymentsTransfer::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The transfer is pending confirmation.
        PENDING_CONFIRMING =
          T.let(
            :pending_confirming,
            Increase::InboundRealTimePaymentsTransfer::Status::TaggedSymbol
          )

        # The transfer was not responded to in time.
        TIMED_OUT =
          T.let(
            :timed_out,
            Increase::InboundRealTimePaymentsTransfer::Status::TaggedSymbol
          )

        # The transfer has been received successfully and is confirmed.
        CONFIRMED =
          T.let(
            :confirmed,
            Increase::InboundRealTimePaymentsTransfer::Status::TaggedSymbol
          )

        # The transfer has been declined.
        DECLINED =
          T.let(
            :declined,
            Increase::InboundRealTimePaymentsTransfer::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::InboundRealTimePaymentsTransfer::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_real_time_payments_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::InboundRealTimePaymentsTransfer::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INBOUND_REAL_TIME_PAYMENTS_TRANSFER =
          T.let(
            :inbound_real_time_payments_transfer,
            Increase::InboundRealTimePaymentsTransfer::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::InboundRealTimePaymentsTransfer::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
