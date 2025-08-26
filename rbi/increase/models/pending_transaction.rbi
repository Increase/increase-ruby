# typed: strong

module Increase
  module Models
    class PendingTransaction < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::PendingTransaction, Increase::Internal::AnyHash)
        end

      # The Pending Transaction identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the account this Pending Transaction belongs to.
      sig { returns(String) }
      attr_accessor :account_id

      # The Pending Transaction amount in the minor unit of its currency. For dollars,
      # for example, this is cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # How the Pending Transaction affects the balance of its Account while its status
      # is `pending`.
      sig { returns(Increase::PendingTransaction::BalanceImpact::TaggedSymbol) }
      attr_accessor :balance_impact

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the Pending
      # Transaction was completed.
      sig { returns(T.nilable(Time)) }
      attr_accessor :completed_at

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the Pending
      # Transaction occurred.
      sig { returns(Time) }
      attr_accessor :created_at

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Pending
      # Transaction's currency. This will match the currency on the Pending
      # Transaction's Account.
      sig { returns(Increase::PendingTransaction::Currency::TaggedSymbol) }
      attr_accessor :currency

      # For a Pending Transaction related to a transfer, this is the description you
      # provide. For a Pending Transaction related to a payment, this is the description
      # the vendor provides.
      sig { returns(String) }
      attr_accessor :description

      # The identifier for the route this Pending Transaction came through. Routes are
      # things like cards and ACH details.
      sig { returns(T.nilable(String)) }
      attr_accessor :route_id

      # The type of the route this Pending Transaction came through.
      sig do
        returns(
          T.nilable(Increase::PendingTransaction::RouteType::TaggedSymbol)
        )
      end
      attr_accessor :route_type

      # This is an object giving more details on the network-level event that caused the
      # Pending Transaction. For example, for a card transaction this lists the
      # merchant's industry and location.
      sig { returns(Increase::PendingTransaction::Source) }
      attr_reader :source

      sig { params(source: Increase::PendingTransaction::Source::OrHash).void }
      attr_writer :source

      # Whether the Pending Transaction has been confirmed and has an associated
      # Transaction.
      sig { returns(Increase::PendingTransaction::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `pending_transaction`.
      sig { returns(Increase::PendingTransaction::Type::TaggedSymbol) }
      attr_accessor :type

      # Pending Transactions are potential future additions and removals of money from
      # your bank account. They impact your available balance, but not your current
      # balance. To learn more, see
      # [Transactions and Transfers](/documentation/transactions-transfers).
      sig do
        params(
          id: String,
          account_id: String,
          amount: Integer,
          balance_impact: Increase::PendingTransaction::BalanceImpact::OrSymbol,
          completed_at: T.nilable(Time),
          created_at: Time,
          currency: Increase::PendingTransaction::Currency::OrSymbol,
          description: String,
          route_id: T.nilable(String),
          route_type:
            T.nilable(Increase::PendingTransaction::RouteType::OrSymbol),
          source: Increase::PendingTransaction::Source::OrHash,
          status: Increase::PendingTransaction::Status::OrSymbol,
          type: Increase::PendingTransaction::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Pending Transaction identifier.
        id:,
        # The identifier for the account this Pending Transaction belongs to.
        account_id:,
        # The Pending Transaction amount in the minor unit of its currency. For dollars,
        # for example, this is cents.
        amount:,
        # How the Pending Transaction affects the balance of its Account while its status
        # is `pending`.
        balance_impact:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the Pending
        # Transaction was completed.
        completed_at:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the Pending
        # Transaction occurred.
        created_at:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Pending
        # Transaction's currency. This will match the currency on the Pending
        # Transaction's Account.
        currency:,
        # For a Pending Transaction related to a transfer, this is the description you
        # provide. For a Pending Transaction related to a payment, this is the description
        # the vendor provides.
        description:,
        # The identifier for the route this Pending Transaction came through. Routes are
        # things like cards and ACH details.
        route_id:,
        # The type of the route this Pending Transaction came through.
        route_type:,
        # This is an object giving more details on the network-level event that caused the
        # Pending Transaction. For example, for a card transaction this lists the
        # merchant's industry and location.
        source:,
        # Whether the Pending Transaction has been confirmed and has an associated
        # Transaction.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `pending_transaction`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            amount: Integer,
            balance_impact:
              Increase::PendingTransaction::BalanceImpact::TaggedSymbol,
            completed_at: T.nilable(Time),
            created_at: Time,
            currency: Increase::PendingTransaction::Currency::TaggedSymbol,
            description: String,
            route_id: T.nilable(String),
            route_type:
              T.nilable(Increase::PendingTransaction::RouteType::TaggedSymbol),
            source: Increase::PendingTransaction::Source,
            status: Increase::PendingTransaction::Status::TaggedSymbol,
            type: Increase::PendingTransaction::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # How the Pending Transaction affects the balance of its Account while its status
      # is `pending`.
      module BalanceImpact
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::PendingTransaction::BalanceImpact)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # This Pending Transaction will decrement the available balance on the Account while its status is `pending`.
        AFFECTS_AVAILABLE_BALANCE =
          T.let(
            :affects_available_balance,
            Increase::PendingTransaction::BalanceImpact::TaggedSymbol
          )

        # This Pending Transaction does not affect the available balance on the Account.
        NONE =
          T.let(
            :none,
            Increase::PendingTransaction::BalanceImpact::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::PendingTransaction::BalanceImpact::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Pending
      # Transaction's currency. This will match the currency on the Pending
      # Transaction's Account.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::PendingTransaction::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Canadian Dollar (CAD)
        CAD = T.let(:CAD, Increase::PendingTransaction::Currency::TaggedSymbol)

        # Swiss Franc (CHF)
        CHF = T.let(:CHF, Increase::PendingTransaction::Currency::TaggedSymbol)

        # Euro (EUR)
        EUR = T.let(:EUR, Increase::PendingTransaction::Currency::TaggedSymbol)

        # British Pound (GBP)
        GBP = T.let(:GBP, Increase::PendingTransaction::Currency::TaggedSymbol)

        # Japanese Yen (JPY)
        JPY = T.let(:JPY, Increase::PendingTransaction::Currency::TaggedSymbol)

        # US Dollar (USD)
        USD = T.let(:USD, Increase::PendingTransaction::Currency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::PendingTransaction::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The type of the route this Pending Transaction came through.
      module RouteType
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::PendingTransaction::RouteType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # An Account Number.
        ACCOUNT_NUMBER =
          T.let(
            :account_number,
            Increase::PendingTransaction::RouteType::TaggedSymbol
          )

        # A Card.
        CARD =
          T.let(:card, Increase::PendingTransaction::RouteType::TaggedSymbol)

        # A Lockbox.
        LOCKBOX =
          T.let(:lockbox, Increase::PendingTransaction::RouteType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::PendingTransaction::RouteType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Source < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::PendingTransaction::Source,
              Increase::Internal::AnyHash
            )
          end

        # An Account Transfer Instruction object. This field will be present in the JSON
        # response if and only if `category` is equal to `account_transfer_instruction`.
        sig do
          returns(
            T.nilable(
              Increase::PendingTransaction::Source::AccountTransferInstruction
            )
          )
        end
        attr_reader :account_transfer_instruction

        sig do
          params(
            account_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::AccountTransferInstruction::OrHash
              )
          ).void
        end
        attr_writer :account_transfer_instruction

        # An ACH Transfer Instruction object. This field will be present in the JSON
        # response if and only if `category` is equal to `ach_transfer_instruction`.
        sig do
          returns(
            T.nilable(
              Increase::PendingTransaction::Source::ACHTransferInstruction
            )
          )
        end
        attr_reader :ach_transfer_instruction

        sig do
          params(
            ach_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::ACHTransferInstruction::OrHash
              )
          ).void
        end
        attr_writer :ach_transfer_instruction

        # A Card Authorization object. This field will be present in the JSON response if
        # and only if `category` is equal to `card_authorization`. Card Authorizations are
        # temporary holds placed on a customers funds with the intent to later clear a
        # transaction.
        sig do
          returns(
            T.nilable(Increase::PendingTransaction::Source::CardAuthorization)
          )
        end
        attr_reader :card_authorization

        sig do
          params(
            card_authorization:
              T.nilable(
                Increase::PendingTransaction::Source::CardAuthorization::OrHash
              )
          ).void
        end
        attr_writer :card_authorization

        # A Card Push Transfer Instruction object. This field will be present in the JSON
        # response if and only if `category` is equal to `card_push_transfer_instruction`.
        sig do
          returns(
            T.nilable(
              Increase::PendingTransaction::Source::CardPushTransferInstruction
            )
          )
        end
        attr_reader :card_push_transfer_instruction

        sig do
          params(
            card_push_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::CardPushTransferInstruction::OrHash
              )
          ).void
        end
        attr_writer :card_push_transfer_instruction

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        sig do
          returns(Increase::PendingTransaction::Source::Category::TaggedSymbol)
        end
        attr_accessor :category

        # A Check Deposit Instruction object. This field will be present in the JSON
        # response if and only if `category` is equal to `check_deposit_instruction`.
        sig do
          returns(
            T.nilable(
              Increase::PendingTransaction::Source::CheckDepositInstruction
            )
          )
        end
        attr_reader :check_deposit_instruction

        sig do
          params(
            check_deposit_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::CheckDepositInstruction::OrHash
              )
          ).void
        end
        attr_writer :check_deposit_instruction

        # A Check Transfer Instruction object. This field will be present in the JSON
        # response if and only if `category` is equal to `check_transfer_instruction`.
        sig do
          returns(
            T.nilable(
              Increase::PendingTransaction::Source::CheckTransferInstruction
            )
          )
        end
        attr_reader :check_transfer_instruction

        sig do
          params(
            check_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::CheckTransferInstruction::OrHash
              )
          ).void
        end
        attr_writer :check_transfer_instruction

        # An Inbound Funds Hold object. This field will be present in the JSON response if
        # and only if `category` is equal to `inbound_funds_hold`. We hold funds for
        # certain transaction types to account for return windows where funds might still
        # be clawed back by the sending institution.
        sig do
          returns(
            T.nilable(Increase::PendingTransaction::Source::InboundFundsHold)
          )
        end
        attr_reader :inbound_funds_hold

        sig do
          params(
            inbound_funds_hold:
              T.nilable(
                Increase::PendingTransaction::Source::InboundFundsHold::OrHash
              )
          ).void
        end
        attr_writer :inbound_funds_hold

        # An Inbound Wire Transfer Reversal object. This field will be present in the JSON
        # response if and only if `category` is equal to `inbound_wire_transfer_reversal`.
        # An Inbound Wire Transfer Reversal is created when Increase has received a wire
        # and the User requests that it be reversed.
        sig do
          returns(
            T.nilable(
              Increase::PendingTransaction::Source::InboundWireTransferReversal
            )
          )
        end
        attr_reader :inbound_wire_transfer_reversal

        sig do
          params(
            inbound_wire_transfer_reversal:
              T.nilable(
                Increase::PendingTransaction::Source::InboundWireTransferReversal::OrHash
              )
          ).void
        end
        attr_writer :inbound_wire_transfer_reversal

        # If the category of this Transaction source is equal to `other`, this field will
        # contain an empty object, otherwise it will contain null.
        sig { returns(T.nilable(T.anything)) }
        attr_accessor :other

        # A Real-Time Payments Transfer Instruction object. This field will be present in
        # the JSON response if and only if `category` is equal to
        # `real_time_payments_transfer_instruction`.
        sig do
          returns(
            T.nilable(
              Increase::PendingTransaction::Source::RealTimePaymentsTransferInstruction
            )
          )
        end
        attr_reader :real_time_payments_transfer_instruction

        sig do
          params(
            real_time_payments_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::RealTimePaymentsTransferInstruction::OrHash
              )
          ).void
        end
        attr_writer :real_time_payments_transfer_instruction

        # A Swift Transfer Instruction object. This field will be present in the JSON
        # response if and only if `category` is equal to `swift_transfer_instruction`.
        sig do
          returns(
            T.nilable(
              Increase::PendingTransaction::Source::SwiftTransferInstruction
            )
          )
        end
        attr_reader :swift_transfer_instruction

        sig do
          params(
            swift_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::SwiftTransferInstruction::OrHash
              )
          ).void
        end
        attr_writer :swift_transfer_instruction

        # An User Initiated Hold object. This field will be present in the JSON response
        # if and only if `category` is equal to `user_initiated_hold`. Created when a user
        # initiates a hold on funds in their account.
        sig { returns(T.nilable(T.anything)) }
        attr_accessor :user_initiated_hold

        # A Wire Transfer Instruction object. This field will be present in the JSON
        # response if and only if `category` is equal to `wire_transfer_instruction`.
        sig do
          returns(
            T.nilable(
              Increase::PendingTransaction::Source::WireTransferInstruction
            )
          )
        end
        attr_reader :wire_transfer_instruction

        sig do
          params(
            wire_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::WireTransferInstruction::OrHash
              )
          ).void
        end
        attr_writer :wire_transfer_instruction

        # This is an object giving more details on the network-level event that caused the
        # Pending Transaction. For example, for a card transaction this lists the
        # merchant's industry and location.
        sig do
          params(
            account_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::AccountTransferInstruction::OrHash
              ),
            ach_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::ACHTransferInstruction::OrHash
              ),
            card_authorization:
              T.nilable(
                Increase::PendingTransaction::Source::CardAuthorization::OrHash
              ),
            card_push_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::CardPushTransferInstruction::OrHash
              ),
            category: Increase::PendingTransaction::Source::Category::OrSymbol,
            check_deposit_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::CheckDepositInstruction::OrHash
              ),
            check_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::CheckTransferInstruction::OrHash
              ),
            inbound_funds_hold:
              T.nilable(
                Increase::PendingTransaction::Source::InboundFundsHold::OrHash
              ),
            inbound_wire_transfer_reversal:
              T.nilable(
                Increase::PendingTransaction::Source::InboundWireTransferReversal::OrHash
              ),
            other: T.nilable(T.anything),
            real_time_payments_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::RealTimePaymentsTransferInstruction::OrHash
              ),
            swift_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::SwiftTransferInstruction::OrHash
              ),
            user_initiated_hold: T.nilable(T.anything),
            wire_transfer_instruction:
              T.nilable(
                Increase::PendingTransaction::Source::WireTransferInstruction::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # An Account Transfer Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `account_transfer_instruction`.
          account_transfer_instruction:,
          # An ACH Transfer Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `ach_transfer_instruction`.
          ach_transfer_instruction:,
          # A Card Authorization object. This field will be present in the JSON response if
          # and only if `category` is equal to `card_authorization`. Card Authorizations are
          # temporary holds placed on a customers funds with the intent to later clear a
          # transaction.
          card_authorization:,
          # A Card Push Transfer Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `card_push_transfer_instruction`.
          card_push_transfer_instruction:,
          # The type of the resource. We may add additional possible values for this enum
          # over time; your application should be able to handle such additions gracefully.
          category:,
          # A Check Deposit Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `check_deposit_instruction`.
          check_deposit_instruction:,
          # A Check Transfer Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `check_transfer_instruction`.
          check_transfer_instruction:,
          # An Inbound Funds Hold object. This field will be present in the JSON response if
          # and only if `category` is equal to `inbound_funds_hold`. We hold funds for
          # certain transaction types to account for return windows where funds might still
          # be clawed back by the sending institution.
          inbound_funds_hold:,
          # An Inbound Wire Transfer Reversal object. This field will be present in the JSON
          # response if and only if `category` is equal to `inbound_wire_transfer_reversal`.
          # An Inbound Wire Transfer Reversal is created when Increase has received a wire
          # and the User requests that it be reversed.
          inbound_wire_transfer_reversal:,
          # If the category of this Transaction source is equal to `other`, this field will
          # contain an empty object, otherwise it will contain null.
          other:,
          # A Real-Time Payments Transfer Instruction object. This field will be present in
          # the JSON response if and only if `category` is equal to
          # `real_time_payments_transfer_instruction`.
          real_time_payments_transfer_instruction:,
          # A Swift Transfer Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `swift_transfer_instruction`.
          swift_transfer_instruction:,
          # An User Initiated Hold object. This field will be present in the JSON response
          # if and only if `category` is equal to `user_initiated_hold`. Created when a user
          # initiates a hold on funds in their account.
          user_initiated_hold:,
          # A Wire Transfer Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `wire_transfer_instruction`.
          wire_transfer_instruction:
        )
        end

        sig do
          override.returns(
            {
              account_transfer_instruction:
                T.nilable(
                  Increase::PendingTransaction::Source::AccountTransferInstruction
                ),
              ach_transfer_instruction:
                T.nilable(
                  Increase::PendingTransaction::Source::ACHTransferInstruction
                ),
              card_authorization:
                T.nilable(
                  Increase::PendingTransaction::Source::CardAuthorization
                ),
              card_push_transfer_instruction:
                T.nilable(
                  Increase::PendingTransaction::Source::CardPushTransferInstruction
                ),
              category:
                Increase::PendingTransaction::Source::Category::TaggedSymbol,
              check_deposit_instruction:
                T.nilable(
                  Increase::PendingTransaction::Source::CheckDepositInstruction
                ),
              check_transfer_instruction:
                T.nilable(
                  Increase::PendingTransaction::Source::CheckTransferInstruction
                ),
              inbound_funds_hold:
                T.nilable(
                  Increase::PendingTransaction::Source::InboundFundsHold
                ),
              inbound_wire_transfer_reversal:
                T.nilable(
                  Increase::PendingTransaction::Source::InboundWireTransferReversal
                ),
              other: T.nilable(T.anything),
              real_time_payments_transfer_instruction:
                T.nilable(
                  Increase::PendingTransaction::Source::RealTimePaymentsTransferInstruction
                ),
              swift_transfer_instruction:
                T.nilable(
                  Increase::PendingTransaction::Source::SwiftTransferInstruction
                ),
              user_initiated_hold: T.nilable(T.anything),
              wire_transfer_instruction:
                T.nilable(
                  Increase::PendingTransaction::Source::WireTransferInstruction
                )
            }
          )
        end
        def to_hash
        end

        class AccountTransferInstruction < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PendingTransaction::Source::AccountTransferInstruction,
                Increase::Internal::AnyHash
              )
            end

          # The pending amount in the minor unit of the transaction's currency. For dollars,
          # for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          # account currency.
          sig do
            returns(
              Increase::PendingTransaction::Source::AccountTransferInstruction::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The identifier of the Account Transfer that led to this Pending Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # An Account Transfer Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `account_transfer_instruction`.
          sig do
            params(
              amount: Integer,
              currency:
                Increase::PendingTransaction::Source::AccountTransferInstruction::Currency::OrSymbol,
              transfer_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The pending amount in the minor unit of the transaction's currency. For dollars,
            # for example, this is cents.
            amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
            # account currency.
            currency:,
            # The identifier of the Account Transfer that led to this Pending Transaction.
            transfer_id:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                currency:
                  Increase::PendingTransaction::Source::AccountTransferInstruction::Currency::TaggedSymbol,
                transfer_id: String
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          # account currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::PendingTransaction::Source::AccountTransferInstruction::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Canadian Dollar (CAD)
            CAD =
              T.let(
                :CAD,
                Increase::PendingTransaction::Source::AccountTransferInstruction::Currency::TaggedSymbol
              )

            # Swiss Franc (CHF)
            CHF =
              T.let(
                :CHF,
                Increase::PendingTransaction::Source::AccountTransferInstruction::Currency::TaggedSymbol
              )

            # Euro (EUR)
            EUR =
              T.let(
                :EUR,
                Increase::PendingTransaction::Source::AccountTransferInstruction::Currency::TaggedSymbol
              )

            # British Pound (GBP)
            GBP =
              T.let(
                :GBP,
                Increase::PendingTransaction::Source::AccountTransferInstruction::Currency::TaggedSymbol
              )

            # Japanese Yen (JPY)
            JPY =
              T.let(
                :JPY,
                Increase::PendingTransaction::Source::AccountTransferInstruction::Currency::TaggedSymbol
              )

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::PendingTransaction::Source::AccountTransferInstruction::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::PendingTransaction::Source::AccountTransferInstruction::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class ACHTransferInstruction < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PendingTransaction::Source::ACHTransferInstruction,
                Increase::Internal::AnyHash
              )
            end

          # The pending amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The identifier of the ACH Transfer that led to this Pending Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # An ACH Transfer Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `ach_transfer_instruction`.
          sig do
            params(amount: Integer, transfer_id: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # The pending amount in USD cents.
            amount:,
            # The identifier of the ACH Transfer that led to this Pending Transaction.
            transfer_id:
          )
          end

          sig { override.returns({ amount: Integer, transfer_id: String }) }
          def to_hash
          end
        end

        class CardAuthorization < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PendingTransaction::Source::CardAuthorization,
                Increase::Internal::AnyHash
              )
            end

          # The Card Authorization identifier.
          sig { returns(String) }
          attr_accessor :id

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          sig do
            returns(
              Increase::PendingTransaction::Source::CardAuthorization::Actioner::TaggedSymbol
            )
          end
          attr_accessor :actioner

          # Additional amounts associated with the card authorization, such as ATM
          # surcharges fees. These are usually a subset of the `amount` field and are used
          # to provide more detailed information about the transaction.
          sig do
            returns(
              Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts
            )
          end
          attr_reader :additional_amounts

          sig do
            params(
              additional_amounts:
                Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::OrHash
            ).void
          end
          attr_writer :additional_amounts

          # The pending amount in the minor unit of the transaction's currency. For dollars,
          # for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          sig do
            returns(
              Increase::PendingTransaction::Source::CardAuthorization::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          # purchase), the identifier of the token that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :digital_wallet_token_id

          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          sig do
            returns(
              Increase::PendingTransaction::Source::CardAuthorization::Direction::TaggedSymbol
            )
          end
          attr_accessor :direction

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) when this authorization
          # will expire and the pending transaction will be released.
          sig { returns(Time) }
          attr_accessor :expires_at

          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_acceptor_id

          # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
          # card is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_category_code

          # The city the merchant resides in.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_city

          # The country the merchant resides in.
          sig { returns(String) }
          attr_accessor :merchant_country

          # The merchant descriptor of the merchant the card is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_descriptor

          # The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
          # ZIP code, where the first 5 and last 4 are separated by a dash.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_postal_code

          # The state the merchant resides in.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_state

          # Fields specific to the `network`.
          sig do
            returns(
              Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails
            )
          end
          attr_reader :network_details

          sig do
            params(
              network_details:
                Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::OrHash
            ).void
          end
          attr_writer :network_details

          # Network-specific identifiers for a specific request or transaction.
          sig do
            returns(
              Increase::PendingTransaction::Source::CardAuthorization::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::PendingTransaction::Source::CardAuthorization::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The risk score generated by the card network. For Visa this is the Visa Advanced
          # Authorization risk score, from 0 to 99, where 99 is the riskiest.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :network_risk_score

          # The identifier of the Pending Transaction associated with this Transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :pending_transaction_id

          # If the authorization was made in-person with a physical card, the Physical Card
          # that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :physical_card_id

          # The pending amount in the minor unit of the transaction's presentment currency.
          sig { returns(Integer) }
          attr_accessor :presentment_amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's presentment currency.
          sig { returns(String) }
          attr_accessor :presentment_currency

          # The processing category describes the intent behind the authorization, such as
          # whether it was used for bill payments or an automatic fuel dispenser.
          sig do
            returns(
              Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::TaggedSymbol
            )
          end
          attr_accessor :processing_category

          # The identifier of the Real-Time Decision sent to approve or decline this
          # transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :real_time_decision_id

          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          # is transacting with.
          sig { returns(T.nilable(String)) }
          attr_accessor :terminal_id

          # A constant representing the object's type. For this resource it will always be
          # `card_authorization`.
          sig do
            returns(
              Increase::PendingTransaction::Source::CardAuthorization::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Fields related to verification of cardholder-provided values.
          sig do
            returns(
              Increase::PendingTransaction::Source::CardAuthorization::Verification
            )
          end
          attr_reader :verification

          sig do
            params(
              verification:
                Increase::PendingTransaction::Source::CardAuthorization::Verification::OrHash
            ).void
          end
          attr_writer :verification

          # A Card Authorization object. This field will be present in the JSON response if
          # and only if `category` is equal to `card_authorization`. Card Authorizations are
          # temporary holds placed on a customers funds with the intent to later clear a
          # transaction.
          sig do
            params(
              id: String,
              actioner:
                Increase::PendingTransaction::Source::CardAuthorization::Actioner::OrSymbol,
              additional_amounts:
                Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::OrHash,
              amount: Integer,
              card_payment_id: String,
              currency:
                Increase::PendingTransaction::Source::CardAuthorization::Currency::OrSymbol,
              digital_wallet_token_id: T.nilable(String),
              direction:
                Increase::PendingTransaction::Source::CardAuthorization::Direction::OrSymbol,
              expires_at: Time,
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: T.nilable(String),
              merchant_country: String,
              merchant_descriptor: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_details:
                Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::OrHash,
              network_identifiers:
                Increase::PendingTransaction::Source::CardAuthorization::NetworkIdentifiers::OrHash,
              network_risk_score: T.nilable(Integer),
              pending_transaction_id: T.nilable(String),
              physical_card_id: T.nilable(String),
              presentment_amount: Integer,
              presentment_currency: String,
              processing_category:
                Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::OrSymbol,
              real_time_decision_id: T.nilable(String),
              terminal_id: T.nilable(String),
              type:
                Increase::PendingTransaction::Source::CardAuthorization::Type::OrSymbol,
              verification:
                Increase::PendingTransaction::Source::CardAuthorization::Verification::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Authorization identifier.
            id:,
            # Whether this authorization was approved by Increase, the card network through
            # stand-in processing, or the user through a real-time decision.
            actioner:,
            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            additional_amounts:,
            # The pending amount in the minor unit of the transaction's currency. For dollars,
            # for example, this is cents.
            amount:,
            # The ID of the Card Payment this transaction belongs to.
            card_payment_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's currency.
            currency:,
            # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
            # purchase), the identifier of the token that was used.
            digital_wallet_token_id:,
            # The direction describes the direction the funds will move, either from the
            # cardholder to the merchant or from the merchant to the cardholder.
            direction:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) when this authorization
            # will expire and the pending transaction will be released.
            expires_at:,
            # The merchant identifier (commonly abbreviated as MID) of the merchant the card
            # is transacting with.
            merchant_acceptor_id:,
            # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
            # card is transacting with.
            merchant_category_code:,
            # The city the merchant resides in.
            merchant_city:,
            # The country the merchant resides in.
            merchant_country:,
            # The merchant descriptor of the merchant the card is transacting with.
            merchant_descriptor:,
            # The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
            # ZIP code, where the first 5 and last 4 are separated by a dash.
            merchant_postal_code:,
            # The state the merchant resides in.
            merchant_state:,
            # Fields specific to the `network`.
            network_details:,
            # Network-specific identifiers for a specific request or transaction.
            network_identifiers:,
            # The risk score generated by the card network. For Visa this is the Visa Advanced
            # Authorization risk score, from 0 to 99, where 99 is the riskiest.
            network_risk_score:,
            # The identifier of the Pending Transaction associated with this Transaction.
            pending_transaction_id:,
            # If the authorization was made in-person with a physical card, the Physical Card
            # that was used.
            physical_card_id:,
            # The pending amount in the minor unit of the transaction's presentment currency.
            presentment_amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's presentment currency.
            presentment_currency:,
            # The processing category describes the intent behind the authorization, such as
            # whether it was used for bill payments or an automatic fuel dispenser.
            processing_category:,
            # The identifier of the Real-Time Decision sent to approve or decline this
            # transaction.
            real_time_decision_id:,
            # The terminal identifier (commonly abbreviated as TID) of the terminal the card
            # is transacting with.
            terminal_id:,
            # A constant representing the object's type. For this resource it will always be
            # `card_authorization`.
            type:,
            # Fields related to verification of cardholder-provided values.
            verification:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                actioner:
                  Increase::PendingTransaction::Source::CardAuthorization::Actioner::TaggedSymbol,
                additional_amounts:
                  Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts,
                amount: Integer,
                card_payment_id: String,
                currency:
                  Increase::PendingTransaction::Source::CardAuthorization::Currency::TaggedSymbol,
                digital_wallet_token_id: T.nilable(String),
                direction:
                  Increase::PendingTransaction::Source::CardAuthorization::Direction::TaggedSymbol,
                expires_at: Time,
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_city: T.nilable(String),
                merchant_country: String,
                merchant_descriptor: String,
                merchant_postal_code: T.nilable(String),
                merchant_state: T.nilable(String),
                network_details:
                  Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails,
                network_identifiers:
                  Increase::PendingTransaction::Source::CardAuthorization::NetworkIdentifiers,
                network_risk_score: T.nilable(Integer),
                pending_transaction_id: T.nilable(String),
                physical_card_id: T.nilable(String),
                presentment_amount: Integer,
                presentment_currency: String,
                processing_category:
                  Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::TaggedSymbol,
                real_time_decision_id: T.nilable(String),
                terminal_id: T.nilable(String),
                type:
                  Increase::PendingTransaction::Source::CardAuthorization::Type::TaggedSymbol,
                verification:
                  Increase::PendingTransaction::Source::CardAuthorization::Verification
              }
            )
          end
          def to_hash
          end

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          module Actioner
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::PendingTransaction::Source::CardAuthorization::Actioner
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # This object was actioned by the user through a real-time decision.
            USER =
              T.let(
                :user,
                Increase::PendingTransaction::Source::CardAuthorization::Actioner::TaggedSymbol
              )

            # This object was actioned by Increase without user intervention.
            INCREASE =
              T.let(
                :increase,
                Increase::PendingTransaction::Source::CardAuthorization::Actioner::TaggedSymbol
              )

            # This object was actioned by the network, through stand-in processing.
            NETWORK =
              T.let(
                :network,
                Increase::PendingTransaction::Source::CardAuthorization::Actioner::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::PendingTransaction::Source::CardAuthorization::Actioner::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts,
                  Increase::Internal::AnyHash
                )
              end

            # The part of this transaction amount that was for clinic-related services.
            sig do
              returns(
                T.nilable(
                  Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Clinic
                )
              )
            end
            attr_reader :clinic

            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Clinic::OrHash
                  )
              ).void
            end
            attr_writer :clinic

            # The part of this transaction amount that was for dental-related services.
            sig do
              returns(
                T.nilable(
                  Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Dental
                )
              )
            end
            attr_reader :dental

            sig do
              params(
                dental:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Dental::OrHash
                  )
              ).void
            end
            attr_writer :dental

            # The part of this transaction amount that was for healthcare prescriptions.
            sig do
              returns(
                T.nilable(
                  Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Prescription
                )
              )
            end
            attr_reader :prescription

            sig do
              params(
                prescription:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Prescription::OrHash
                  )
              ).void
            end
            attr_writer :prescription

            # The surcharge amount charged for this transaction by the merchant.
            sig do
              returns(
                T.nilable(
                  Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Surcharge
                )
              )
            end
            attr_reader :surcharge

            sig do
              params(
                surcharge:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Surcharge::OrHash
                  )
              ).void
            end
            attr_writer :surcharge

            # The total amount of a series of incremental authorizations, optionally provided.
            sig do
              returns(
                T.nilable(
                  Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalCumulative
                )
              )
            end
            attr_reader :total_cumulative

            sig do
              params(
                total_cumulative:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalCumulative::OrHash
                  )
              ).void
            end
            attr_writer :total_cumulative

            # The total amount of healthcare-related additional amounts.
            sig do
              returns(
                T.nilable(
                  Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalHealthcare
                )
              )
            end
            attr_reader :total_healthcare

            sig do
              params(
                total_healthcare:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalHealthcare::OrHash
                  )
              ).void
            end
            attr_writer :total_healthcare

            # The part of this transaction amount that was for transit-related services.
            sig do
              returns(
                T.nilable(
                  Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Transit
                )
              )
            end
            attr_reader :transit

            sig do
              params(
                transit:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Transit::OrHash
                  )
              ).void
            end
            attr_writer :transit

            # An unknown additional amount.
            sig do
              returns(
                T.nilable(
                  Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Unknown
                )
              )
            end
            attr_reader :unknown

            sig do
              params(
                unknown:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Unknown::OrHash
                  )
              ).void
            end
            attr_writer :unknown

            # The part of this transaction amount that was for vision-related services.
            sig do
              returns(
                T.nilable(
                  Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Vision
                )
              )
            end
            attr_reader :vision

            sig do
              params(
                vision:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Vision::OrHash
                  )
              ).void
            end
            attr_writer :vision

            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Clinic::OrHash
                  ),
                dental:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Dental::OrHash
                  ),
                prescription:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Prescription::OrHash
                  ),
                surcharge:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Surcharge::OrHash
                  ),
                total_cumulative:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalCumulative::OrHash
                  ),
                total_healthcare:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalHealthcare::OrHash
                  ),
                transit:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Transit::OrHash
                  ),
                unknown:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Unknown::OrHash
                  ),
                vision:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Vision::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The part of this transaction amount that was for clinic-related services.
              clinic:,
              # The part of this transaction amount that was for dental-related services.
              dental:,
              # The part of this transaction amount that was for healthcare prescriptions.
              prescription:,
              # The surcharge amount charged for this transaction by the merchant.
              surcharge:,
              # The total amount of a series of incremental authorizations, optionally provided.
              total_cumulative:,
              # The total amount of healthcare-related additional amounts.
              total_healthcare:,
              # The part of this transaction amount that was for transit-related services.
              transit:,
              # An unknown additional amount.
              unknown:,
              # The part of this transaction amount that was for vision-related services.
              vision:
            )
            end

            sig do
              override.returns(
                {
                  clinic:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Clinic
                    ),
                  dental:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Dental
                    ),
                  prescription:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Prescription
                    ),
                  surcharge:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Surcharge
                    ),
                  total_cumulative:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalCumulative
                    ),
                  total_healthcare:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalHealthcare
                    ),
                  transit:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Transit
                    ),
                  unknown:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Unknown
                    ),
                  vision:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Vision
                    )
                }
              )
            end
            def to_hash
            end

            class Clinic < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Clinic,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field.
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for clinic-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field.
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Dental < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Dental,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field.
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for dental-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field.
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Prescription < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Prescription,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field.
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for healthcare prescriptions.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field.
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Surcharge < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Surcharge,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field.
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The surcharge amount charged for this transaction by the merchant.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field.
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalCumulative < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalCumulative,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field.
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of a series of incremental authorizations, optionally provided.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field.
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalHealthcare < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::TotalHealthcare,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field.
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of healthcare-related additional amounts.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field.
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Transit < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Transit,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field.
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for transit-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field.
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Unknown < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Unknown,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field.
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # An unknown additional amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field.
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Vision < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::PendingTransaction::Source::CardAuthorization::AdditionalAmounts::Vision,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field.
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for vision-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field.
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::PendingTransaction::Source::CardAuthorization::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Canadian Dollar (CAD)
            CAD =
              T.let(
                :CAD,
                Increase::PendingTransaction::Source::CardAuthorization::Currency::TaggedSymbol
              )

            # Swiss Franc (CHF)
            CHF =
              T.let(
                :CHF,
                Increase::PendingTransaction::Source::CardAuthorization::Currency::TaggedSymbol
              )

            # Euro (EUR)
            EUR =
              T.let(
                :EUR,
                Increase::PendingTransaction::Source::CardAuthorization::Currency::TaggedSymbol
              )

            # British Pound (GBP)
            GBP =
              T.let(
                :GBP,
                Increase::PendingTransaction::Source::CardAuthorization::Currency::TaggedSymbol
              )

            # Japanese Yen (JPY)
            JPY =
              T.let(
                :JPY,
                Increase::PendingTransaction::Source::CardAuthorization::Currency::TaggedSymbol
              )

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::PendingTransaction::Source::CardAuthorization::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::PendingTransaction::Source::CardAuthorization::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          module Direction
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::PendingTransaction::Source::CardAuthorization::Direction
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # A regular card authorization where funds are debited from the cardholder.
            SETTLEMENT =
              T.let(
                :settlement,
                Increase::PendingTransaction::Source::CardAuthorization::Direction::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::PendingTransaction::Source::CardAuthorization::Direction::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::PendingTransaction::Source::CardAuthorization::Direction::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class NetworkDetails < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails,
                  Increase::Internal::AnyHash
                )
              end

            # The payment network used to process this card authorization.
            sig do
              returns(
                Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Category::TaggedSymbol
              )
            end
            attr_accessor :category

            # Fields specific to the `visa` network.
            sig do
              returns(
                T.nilable(
                  Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa
                )
              )
            end
            attr_reader :visa

            sig do
              params(
                visa:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::OrHash
                  )
              ).void
            end
            attr_writer :visa

            # Fields specific to the `network`.
            sig do
              params(
                category:
                  Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Category::OrSymbol,
                visa:
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The payment network used to process this card authorization.
              category:,
              # Fields specific to the `visa` network.
              visa:
            )
            end

            sig do
              override.returns(
                {
                  category:
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Category::TaggedSymbol,
                  visa:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa
                    )
                }
              )
            end
            def to_hash
            end

            # The payment network used to process this card authorization.
            module Category
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Category
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Visa
              VISA =
                T.let(
                  :visa,
                  Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Category::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Category::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Visa < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa,
                    Increase::Internal::AnyHash
                  )
                end

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              sig do
                returns(
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :electronic_commerce_indicator

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              sig do
                returns(
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )
                )
              end
              attr_accessor :point_of_service_entry_mode

              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              sig do
                returns(
                  T.nilable(
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )
                )
              end
              attr_accessor :stand_in_processing_reason

              # Fields specific to the `visa` network.
              sig do
                params(
                  electronic_commerce_indicator:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::OrSymbol
                    ),
                  point_of_service_entry_mode:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::OrSymbol
                    ),
                  stand_in_processing_reason:
                    T.nilable(
                      Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # For electronic commerce transactions, this identifies the level of security used
                # in obtaining the customer's payment credential. For mail or telephone order
                # transactions, identifies the type of mail or telephone order.
                electronic_commerce_indicator:,
                # The method used to enter the cardholder's primary account number and card
                # expiration date.
                point_of_service_entry_mode:,
                # Only present when `actioner: network`. Describes why a card authorization was
                # approved or declined by Visa through stand-in processing.
                stand_in_processing_reason:
              )
              end

              sig do
                override.returns(
                  {
                    electronic_commerce_indicator:
                      T.nilable(
                        Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                      ),
                    point_of_service_entry_mode:
                      T.nilable(
                        Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                      ),
                    stand_in_processing_reason:
                      T.nilable(
                        Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                      )
                  }
                )
              end
              def to_hash
              end

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              module ElectronicCommerceIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
                MAIL_PHONE_ORDER =
                  T.let(
                    :mail_phone_order,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
                RECURRING =
                  T.let(
                    :recurring,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
                INSTALLMENT =
                  T.let(
                    :installment,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
                UNKNOWN_MAIL_PHONE_ORDER =
                  T.let(
                    :unknown_mail_phone_order,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
                SECURE_ELECTRONIC_COMMERCE =
                  T.let(
                    :secure_electronic_commerce,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
                NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                  T.let(
                    :non_authenticated_security_transaction_at_3ds_capable_merchant,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however , cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION =
                  T.let(
                    :non_authenticated_security_transaction,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION =
                  T.let(
                    :non_secure_transaction,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              module PointOfServiceEntryMode
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Unknown
                UNKNOWN =
                  T.let(
                    :unknown,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Manual key entry
                MANUAL =
                  T.let(
                    :manual,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read, without card verification value
                MAGNETIC_STRIPE_NO_CVV =
                  T.let(
                    :magnetic_stripe_no_cvv,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Optical code
                OPTICAL_CODE =
                  T.let(
                    :optical_code,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card
                INTEGRATED_CIRCUIT_CARD =
                  T.let(
                    :integrated_circuit_card,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of chip card
                CONTACTLESS =
                  T.let(
                    :contactless,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Transaction initiated using a credential that has previously been stored on file
                CREDENTIAL_ON_FILE =
                  T.let(
                    :credential_on_file,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read
                MAGNETIC_STRIPE =
                  T.let(
                    :magnetic_stripe,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of magnetic stripe data
                CONTACTLESS_MAGNETIC_STRIPE =
                  T.let(
                    :contactless_magnetic_stripe,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card, without card verification value
                INTEGRATED_CIRCUIT_CARD_NO_CVV =
                  T.let(
                    :integrated_circuit_card_no_cvv,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              module StandInProcessingReason
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Increase failed to process the authorization in a timely manner.
                ISSUER_ERROR =
                  T.let(
                    :issuer_error,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
                INVALID_PHYSICAL_CARD =
                  T.let(
                    :invalid_physical_card,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The 3DS cardholder authentication verification value was invalid.
                INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                  T.let(
                    :invalid_cardholder_authentication_verification_value,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
                INTERNAL_VISA_ERROR =
                  T.let(
                    :internal_visa_error,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
                MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                  T.let(
                    :merchant_transaction_advisory_service_authentication_required,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
                PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK =
                  T.let(
                    :payment_fraud_disruption_acquirer_block,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An unspecific reason for stand-in processing.
                OTHER =
                  T.let(
                    :other,
                    Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::PendingTransaction::Source::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end

          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::PendingTransaction::Source::CardAuthorization::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # A life-cycle identifier used across e.g., an authorization and a reversal.
            # Expected to be unique per acquirer within a window of time. For some card
            # networks the retrieval reference number includes the trace counter.
            sig { returns(T.nilable(String)) }
            attr_accessor :retrieval_reference_number

            # A counter used to verify an individual authorization. Expected to be unique per
            # acquirer within a window of time.
            sig { returns(T.nilable(String)) }
            attr_accessor :trace_number

            # A globally unique transaction identifier provided by the card network, used
            # across multiple life-cycle requests.
            sig { returns(T.nilable(String)) }
            attr_accessor :transaction_id

            # Network-specific identifiers for a specific request or transaction.
            sig do
              params(
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # A life-cycle identifier used across e.g., an authorization and a reversal.
              # Expected to be unique per acquirer within a window of time. For some card
              # networks the retrieval reference number includes the trace counter.
              retrieval_reference_number:,
              # A counter used to verify an individual authorization. Expected to be unique per
              # acquirer within a window of time.
              trace_number:,
              # A globally unique transaction identifier provided by the card network, used
              # across multiple life-cycle requests.
              transaction_id:
            )
            end

            sig do
              override.returns(
                {
                  retrieval_reference_number: T.nilable(String),
                  trace_number: T.nilable(String),
                  transaction_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end

          # The processing category describes the intent behind the authorization, such as
          # whether it was used for bill payments or an automatic fuel dispenser.
          module ProcessingCategory
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Account funding transactions are transactions used to e.g., fund an account or transfer funds between accounts.
            ACCOUNT_FUNDING =
              T.let(
                :account_funding,
                Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # Automatic fuel dispenser authorizations occur when a card is used at a gas pump, prior to the actual transaction amount being known. They are followed by an advice message that updates the amount of the pending transaction.
            AUTOMATIC_FUEL_DISPENSER =
              T.let(
                :automatic_fuel_dispenser,
                Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # A transaction used to pay a bill.
            BILL_PAYMENT =
              T.let(
                :bill_payment,
                Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # Original credit transactions are used to send money to a cardholder.
            ORIGINAL_CREDIT =
              T.let(
                :original_credit,
                Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # A regular purchase.
            PURCHASE =
              T.let(
                :purchase,
                Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # Quasi-cash transactions represent purchases of items which may be convertible to cash.
            QUASI_CASH =
              T.let(
                :quasi_cash,
                Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # Cash disbursement transactions are used to withdraw cash from an ATM or a point of sale.
            CASH_DISBURSEMENT =
              T.let(
                :cash_disbursement,
                Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # The processing category is unknown.
            UNKNOWN =
              T.let(
                :unknown,
                Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::PendingTransaction::Source::CardAuthorization::ProcessingCategory::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_authorization`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::PendingTransaction::Source::CardAuthorization::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_AUTHORIZATION =
              T.let(
                :card_authorization,
                Increase::PendingTransaction::Source::CardAuthorization::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::PendingTransaction::Source::CardAuthorization::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Verification < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::PendingTransaction::Source::CardAuthorization::Verification,
                  Increase::Internal::AnyHash
                )
              end

            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            sig do
              returns(
                Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode
              )
            end
            attr_reader :card_verification_code

            sig do
              params(
                card_verification_code:
                  Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::OrHash
              ).void
            end
            attr_writer :card_verification_code

            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            sig do
              returns(
                Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress
              )
            end
            attr_reader :cardholder_address

            sig do
              params(
                cardholder_address:
                  Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::OrHash
              ).void
            end
            attr_writer :cardholder_address

            # Fields related to verification of cardholder-provided values.
            sig do
              params(
                card_verification_code:
                  Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::OrHash,
                cardholder_address:
                  Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Fields related to verification of the Card Verification Code, a 3-digit code on
              # the back of the card.
              card_verification_code:,
              # Cardholder address provided in the authorization request and the address on file
              # we verified it against.
              cardholder_address:
            )
            end

            sig do
              override.returns(
                {
                  card_verification_code:
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode,
                  cardholder_address:
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress
                }
              )
            end
            def to_hash
            end

            class CardVerificationCode < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode,
                    Increase::Internal::AnyHash
                  )
                end

              # The result of verifying the Card Verification Code.
              sig do
                returns(
                  Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                )
              end
              attr_accessor :result

              # Fields related to verification of the Card Verification Code, a 3-digit code on
              # the back of the card.
              sig do
                params(
                  result:
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::Result::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # The result of verifying the Card Verification Code.
                result:
              )
              end

              sig do
                override.returns(
                  {
                    result:
                      Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              # The result of verifying the Card Verification Code.
              module Result
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No card verification code was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code matched the one on file.
                MATCH =
                  T.let(
                    :match,
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code did not match the one on file.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::PendingTransaction::Source::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class CardholderAddress < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress,
                    Increase::Internal::AnyHash
                  )
                end

              # Line 1 of the address on file for the cardholder.
              sig { returns(T.nilable(String)) }
              attr_accessor :actual_line1

              # The postal code of the address on file for the cardholder.
              sig { returns(T.nilable(String)) }
              attr_accessor :actual_postal_code

              # The cardholder address line 1 provided for verification in the authorization
              # request.
              sig { returns(T.nilable(String)) }
              attr_accessor :provided_line1

              # The postal code provided for verification in the authorization request.
              sig { returns(T.nilable(String)) }
              attr_accessor :provided_postal_code

              # The address verification result returned to the card network.
              sig do
                returns(
                  Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )
              end
              attr_accessor :result

              # Cardholder address provided in the authorization request and the address on file
              # we verified it against.
              sig do
                params(
                  actual_line1: T.nilable(String),
                  actual_postal_code: T.nilable(String),
                  provided_line1: T.nilable(String),
                  provided_postal_code: T.nilable(String),
                  result:
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Line 1 of the address on file for the cardholder.
                actual_line1:,
                # The postal code of the address on file for the cardholder.
                actual_postal_code:,
                # The cardholder address line 1 provided for verification in the authorization
                # request.
                provided_line1:,
                # The postal code provided for verification in the authorization request.
                provided_postal_code:,
                # The address verification result returned to the card network.
                result:
              )
              end

              sig do
                override.returns(
                  {
                    actual_line1: T.nilable(String),
                    actual_postal_code: T.nilable(String),
                    provided_line1: T.nilable(String),
                    provided_postal_code: T.nilable(String),
                    result:
                      Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              # The address verification result returned to the card network.
              module Result
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No address was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address was not verified.
                POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED =
                  T.let(
                    :postal_code_match_address_not_checked,
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address does not match.
                POSTAL_CODE_MATCH_ADDRESS_NO_MATCH =
                  T.let(
                    :postal_code_match_address_no_match,
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code does not match, but the street address matches.
                POSTAL_CODE_NO_MATCH_ADDRESS_MATCH =
                  T.let(
                    :postal_code_no_match_address_match,
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address match.
                MATCH =
                  T.let(
                    :match,
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address do not match.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::PendingTransaction::Source::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end
        end

        class CardPushTransferInstruction < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PendingTransaction::Source::CardPushTransferInstruction,
                Increase::Internal::AnyHash
              )
            end

          # The transfer amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The identifier of the Card Push Transfer that led to this Pending Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # A Card Push Transfer Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `card_push_transfer_instruction`.
          sig do
            params(amount: Integer, transfer_id: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # The transfer amount in USD cents.
            amount:,
            # The identifier of the Card Push Transfer that led to this Pending Transaction.
            transfer_id:
          )
          end

          sig { override.returns({ amount: Integer, transfer_id: String }) }
          def to_hash
          end
        end

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::PendingTransaction::Source::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Account Transfer Instruction: details will be under the `account_transfer_instruction` object.
          ACCOUNT_TRANSFER_INSTRUCTION =
            T.let(
              :account_transfer_instruction,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          # ACH Transfer Instruction: details will be under the `ach_transfer_instruction` object.
          ACH_TRANSFER_INSTRUCTION =
            T.let(
              :ach_transfer_instruction,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          # Card Authorization: details will be under the `card_authorization` object.
          CARD_AUTHORIZATION =
            T.let(
              :card_authorization,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          # Check Deposit Instruction: details will be under the `check_deposit_instruction` object.
          CHECK_DEPOSIT_INSTRUCTION =
            T.let(
              :check_deposit_instruction,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          # Check Transfer Instruction: details will be under the `check_transfer_instruction` object.
          CHECK_TRANSFER_INSTRUCTION =
            T.let(
              :check_transfer_instruction,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          # Inbound Funds Hold: details will be under the `inbound_funds_hold` object.
          INBOUND_FUNDS_HOLD =
            T.let(
              :inbound_funds_hold,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          # User Initiated Hold: details will be under the `user_initiated_hold` object.
          USER_INITIATED_HOLD =
            T.let(
              :user_initiated_hold,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          # Real-Time Payments Transfer Instruction: details will be under the `real_time_payments_transfer_instruction` object.
          REAL_TIME_PAYMENTS_TRANSFER_INSTRUCTION =
            T.let(
              :real_time_payments_transfer_instruction,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          # Wire Transfer Instruction: details will be under the `wire_transfer_instruction` object.
          WIRE_TRANSFER_INSTRUCTION =
            T.let(
              :wire_transfer_instruction,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          # Inbound Wire Transfer Reversal: details will be under the `inbound_wire_transfer_reversal` object.
          INBOUND_WIRE_TRANSFER_REVERSAL =
            T.let(
              :inbound_wire_transfer_reversal,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          # Swift Transfer Instruction: details will be under the `swift_transfer_instruction` object.
          SWIFT_TRANSFER_INSTRUCTION =
            T.let(
              :swift_transfer_instruction,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          # Card Push Transfer Instruction: details will be under the `card_push_transfer_instruction` object.
          CARD_PUSH_TRANSFER_INSTRUCTION =
            T.let(
              :card_push_transfer_instruction,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          # The Pending Transaction was made for an undocumented or deprecated reason.
          OTHER =
            T.let(
              :other,
              Increase::PendingTransaction::Source::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::PendingTransaction::Source::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class CheckDepositInstruction < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PendingTransaction::Source::CheckDepositInstruction,
                Increase::Internal::AnyHash
              )
            end

          # The pending amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The identifier of the File containing the image of the back of the check that
          # was deposited.
          sig { returns(T.nilable(String)) }
          attr_accessor :back_image_file_id

          # The identifier of the Check Deposit.
          sig { returns(T.nilable(String)) }
          attr_accessor :check_deposit_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          sig do
            returns(
              Increase::PendingTransaction::Source::CheckDepositInstruction::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The identifier of the File containing the image of the front of the check that
          # was deposited.
          sig { returns(String) }
          attr_accessor :front_image_file_id

          # A Check Deposit Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `check_deposit_instruction`.
          sig do
            params(
              amount: Integer,
              back_image_file_id: T.nilable(String),
              check_deposit_id: T.nilable(String),
              currency:
                Increase::PendingTransaction::Source::CheckDepositInstruction::Currency::OrSymbol,
              front_image_file_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The pending amount in USD cents.
            amount:,
            # The identifier of the File containing the image of the back of the check that
            # was deposited.
            back_image_file_id:,
            # The identifier of the Check Deposit.
            check_deposit_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's currency.
            currency:,
            # The identifier of the File containing the image of the front of the check that
            # was deposited.
            front_image_file_id:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                back_image_file_id: T.nilable(String),
                check_deposit_id: T.nilable(String),
                currency:
                  Increase::PendingTransaction::Source::CheckDepositInstruction::Currency::TaggedSymbol,
                front_image_file_id: String
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::PendingTransaction::Source::CheckDepositInstruction::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Canadian Dollar (CAD)
            CAD =
              T.let(
                :CAD,
                Increase::PendingTransaction::Source::CheckDepositInstruction::Currency::TaggedSymbol
              )

            # Swiss Franc (CHF)
            CHF =
              T.let(
                :CHF,
                Increase::PendingTransaction::Source::CheckDepositInstruction::Currency::TaggedSymbol
              )

            # Euro (EUR)
            EUR =
              T.let(
                :EUR,
                Increase::PendingTransaction::Source::CheckDepositInstruction::Currency::TaggedSymbol
              )

            # British Pound (GBP)
            GBP =
              T.let(
                :GBP,
                Increase::PendingTransaction::Source::CheckDepositInstruction::Currency::TaggedSymbol
              )

            # Japanese Yen (JPY)
            JPY =
              T.let(
                :JPY,
                Increase::PendingTransaction::Source::CheckDepositInstruction::Currency::TaggedSymbol
              )

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::PendingTransaction::Source::CheckDepositInstruction::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::PendingTransaction::Source::CheckDepositInstruction::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CheckTransferInstruction < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PendingTransaction::Source::CheckTransferInstruction,
                Increase::Internal::AnyHash
              )
            end

          # The transfer amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
          # currency.
          sig do
            returns(
              Increase::PendingTransaction::Source::CheckTransferInstruction::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The identifier of the Check Transfer that led to this Pending Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # A Check Transfer Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `check_transfer_instruction`.
          sig do
            params(
              amount: Integer,
              currency:
                Increase::PendingTransaction::Source::CheckTransferInstruction::Currency::OrSymbol,
              transfer_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The transfer amount in USD cents.
            amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
            # currency.
            currency:,
            # The identifier of the Check Transfer that led to this Pending Transaction.
            transfer_id:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                currency:
                  Increase::PendingTransaction::Source::CheckTransferInstruction::Currency::TaggedSymbol,
                transfer_id: String
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
          # currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::PendingTransaction::Source::CheckTransferInstruction::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Canadian Dollar (CAD)
            CAD =
              T.let(
                :CAD,
                Increase::PendingTransaction::Source::CheckTransferInstruction::Currency::TaggedSymbol
              )

            # Swiss Franc (CHF)
            CHF =
              T.let(
                :CHF,
                Increase::PendingTransaction::Source::CheckTransferInstruction::Currency::TaggedSymbol
              )

            # Euro (EUR)
            EUR =
              T.let(
                :EUR,
                Increase::PendingTransaction::Source::CheckTransferInstruction::Currency::TaggedSymbol
              )

            # British Pound (GBP)
            GBP =
              T.let(
                :GBP,
                Increase::PendingTransaction::Source::CheckTransferInstruction::Currency::TaggedSymbol
              )

            # Japanese Yen (JPY)
            JPY =
              T.let(
                :JPY,
                Increase::PendingTransaction::Source::CheckTransferInstruction::Currency::TaggedSymbol
              )

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::PendingTransaction::Source::CheckTransferInstruction::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::PendingTransaction::Source::CheckTransferInstruction::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class InboundFundsHold < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PendingTransaction::Source::InboundFundsHold,
                Increase::Internal::AnyHash
              )
            end

          # The held amount in the minor unit of the account's currency. For dollars, for
          # example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # When the hold will be released automatically. Certain conditions may cause it to
          # be released before this time.
          sig { returns(Time) }
          attr_accessor :automatically_releases_at

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
          # was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
          # currency.
          sig do
            returns(
              Increase::PendingTransaction::Source::InboundFundsHold::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The ID of the Transaction for which funds were held.
          sig { returns(T.nilable(String)) }
          attr_accessor :held_transaction_id

          # The ID of the Pending Transaction representing the held funds.
          sig { returns(T.nilable(String)) }
          attr_accessor :pending_transaction_id

          # When the hold was released (if it has been released).
          sig { returns(T.nilable(Time)) }
          attr_accessor :released_at

          # The status of the hold.
          sig do
            returns(
              Increase::PendingTransaction::Source::InboundFundsHold::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          # A constant representing the object's type. For this resource it will always be
          # `inbound_funds_hold`.
          sig do
            returns(
              Increase::PendingTransaction::Source::InboundFundsHold::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # An Inbound Funds Hold object. This field will be present in the JSON response if
          # and only if `category` is equal to `inbound_funds_hold`. We hold funds for
          # certain transaction types to account for return windows where funds might still
          # be clawed back by the sending institution.
          sig do
            params(
              amount: Integer,
              automatically_releases_at: Time,
              created_at: Time,
              currency:
                Increase::PendingTransaction::Source::InboundFundsHold::Currency::OrSymbol,
              held_transaction_id: T.nilable(String),
              pending_transaction_id: T.nilable(String),
              released_at: T.nilable(Time),
              status:
                Increase::PendingTransaction::Source::InboundFundsHold::Status::OrSymbol,
              type:
                Increase::PendingTransaction::Source::InboundFundsHold::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The held amount in the minor unit of the account's currency. For dollars, for
            # example, this is cents.
            amount:,
            # When the hold will be released automatically. Certain conditions may cause it to
            # be released before this time.
            automatically_releases_at:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
            # was created.
            created_at:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
            # currency.
            currency:,
            # The ID of the Transaction for which funds were held.
            held_transaction_id:,
            # The ID of the Pending Transaction representing the held funds.
            pending_transaction_id:,
            # When the hold was released (if it has been released).
            released_at:,
            # The status of the hold.
            status:,
            # A constant representing the object's type. For this resource it will always be
            # `inbound_funds_hold`.
            type:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                automatically_releases_at: Time,
                created_at: Time,
                currency:
                  Increase::PendingTransaction::Source::InboundFundsHold::Currency::TaggedSymbol,
                held_transaction_id: T.nilable(String),
                pending_transaction_id: T.nilable(String),
                released_at: T.nilable(Time),
                status:
                  Increase::PendingTransaction::Source::InboundFundsHold::Status::TaggedSymbol,
                type:
                  Increase::PendingTransaction::Source::InboundFundsHold::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
          # currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::PendingTransaction::Source::InboundFundsHold::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Canadian Dollar (CAD)
            CAD =
              T.let(
                :CAD,
                Increase::PendingTransaction::Source::InboundFundsHold::Currency::TaggedSymbol
              )

            # Swiss Franc (CHF)
            CHF =
              T.let(
                :CHF,
                Increase::PendingTransaction::Source::InboundFundsHold::Currency::TaggedSymbol
              )

            # Euro (EUR)
            EUR =
              T.let(
                :EUR,
                Increase::PendingTransaction::Source::InboundFundsHold::Currency::TaggedSymbol
              )

            # British Pound (GBP)
            GBP =
              T.let(
                :GBP,
                Increase::PendingTransaction::Source::InboundFundsHold::Currency::TaggedSymbol
              )

            # Japanese Yen (JPY)
            JPY =
              T.let(
                :JPY,
                Increase::PendingTransaction::Source::InboundFundsHold::Currency::TaggedSymbol
              )

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::PendingTransaction::Source::InboundFundsHold::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::PendingTransaction::Source::InboundFundsHold::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The status of the hold.
          module Status
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::PendingTransaction::Source::InboundFundsHold::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Funds are still being held.
            HELD =
              T.let(
                :held,
                Increase::PendingTransaction::Source::InboundFundsHold::Status::TaggedSymbol
              )

            # Funds have been released.
            COMPLETE =
              T.let(
                :complete,
                Increase::PendingTransaction::Source::InboundFundsHold::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::PendingTransaction::Source::InboundFundsHold::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `inbound_funds_hold`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::PendingTransaction::Source::InboundFundsHold::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INBOUND_FUNDS_HOLD =
              T.let(
                :inbound_funds_hold,
                Increase::PendingTransaction::Source::InboundFundsHold::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::PendingTransaction::Source::InboundFundsHold::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class InboundWireTransferReversal < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PendingTransaction::Source::InboundWireTransferReversal,
                Increase::Internal::AnyHash
              )
            end

          # The ID of the Inbound Wire Transfer that is being reversed.
          sig { returns(String) }
          attr_accessor :inbound_wire_transfer_id

          # An Inbound Wire Transfer Reversal object. This field will be present in the JSON
          # response if and only if `category` is equal to `inbound_wire_transfer_reversal`.
          # An Inbound Wire Transfer Reversal is created when Increase has received a wire
          # and the User requests that it be reversed.
          sig do
            params(inbound_wire_transfer_id: String).returns(T.attached_class)
          end
          def self.new(
            # The ID of the Inbound Wire Transfer that is being reversed.
            inbound_wire_transfer_id:
          )
          end

          sig { override.returns({ inbound_wire_transfer_id: String }) }
          def to_hash
          end
        end

        class RealTimePaymentsTransferInstruction < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PendingTransaction::Source::RealTimePaymentsTransferInstruction,
                Increase::Internal::AnyHash
              )
            end

          # The transfer amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The identifier of the Real-Time Payments Transfer that led to this Pending
          # Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # A Real-Time Payments Transfer Instruction object. This field will be present in
          # the JSON response if and only if `category` is equal to
          # `real_time_payments_transfer_instruction`.
          sig do
            params(amount: Integer, transfer_id: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # The transfer amount in USD cents.
            amount:,
            # The identifier of the Real-Time Payments Transfer that led to this Pending
            # Transaction.
            transfer_id:
          )
          end

          sig { override.returns({ amount: Integer, transfer_id: String }) }
          def to_hash
          end
        end

        class SwiftTransferInstruction < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PendingTransaction::Source::SwiftTransferInstruction,
                Increase::Internal::AnyHash
              )
            end

          # The identifier of the Swift Transfer that led to this Pending Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # A Swift Transfer Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `swift_transfer_instruction`.
          sig { params(transfer_id: String).returns(T.attached_class) }
          def self.new(
            # The identifier of the Swift Transfer that led to this Pending Transaction.
            transfer_id:
          )
          end

          sig { override.returns({ transfer_id: String }) }
          def to_hash
          end
        end

        class WireTransferInstruction < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::PendingTransaction::Source::WireTransferInstruction,
                Increase::Internal::AnyHash
              )
            end

          # The account number for the destination account.
          sig { returns(String) }
          attr_accessor :account_number

          # The transfer amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The message that will show on the recipient's bank statement.
          sig { returns(String) }
          attr_accessor :message_to_recipient

          # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
          # destination account.
          sig { returns(String) }
          attr_accessor :routing_number

          # The identifier of the Wire Transfer that led to this Pending Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # A Wire Transfer Instruction object. This field will be present in the JSON
          # response if and only if `category` is equal to `wire_transfer_instruction`.
          sig do
            params(
              account_number: String,
              amount: Integer,
              message_to_recipient: String,
              routing_number: String,
              transfer_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The account number for the destination account.
            account_number:,
            # The transfer amount in USD cents.
            amount:,
            # The message that will show on the recipient's bank statement.
            message_to_recipient:,
            # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
            # destination account.
            routing_number:,
            # The identifier of the Wire Transfer that led to this Pending Transaction.
            transfer_id:
          )
          end

          sig do
            override.returns(
              {
                account_number: String,
                amount: Integer,
                message_to_recipient: String,
                routing_number: String,
                transfer_id: String
              }
            )
          end
          def to_hash
          end
        end
      end

      # Whether the Pending Transaction has been confirmed and has an associated
      # Transaction.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::PendingTransaction::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The Pending Transaction is still awaiting confirmation.
        PENDING =
          T.let(:pending, Increase::PendingTransaction::Status::TaggedSymbol)

        # The Pending Transaction is confirmed. An associated Transaction exists for this object. The Pending Transaction will no longer count against your balance and can generally be hidden from UIs, etc.
        COMPLETE =
          T.let(:complete, Increase::PendingTransaction::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::PendingTransaction::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `pending_transaction`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::PendingTransaction::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING_TRANSACTION =
          T.let(
            :pending_transaction,
            Increase::PendingTransaction::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::PendingTransaction::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
