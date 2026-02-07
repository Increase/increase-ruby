# typed: strong

module Increase
  module Models
    class DeclinedTransaction < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::DeclinedTransaction, Increase::Internal::AnyHash)
        end

      # The Declined Transaction identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the Account the Declined Transaction belongs to.
      sig { returns(String) }
      attr_accessor :account_id

      # The Declined Transaction amount in the minor unit of its currency. For dollars,
      # for example, this is cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the
      # Transaction occurred.
      sig { returns(Time) }
      attr_accessor :created_at

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Declined
      # Transaction's currency. This will match the currency on the Declined
      # Transaction's Account.
      sig { returns(Increase::DeclinedTransaction::Currency::TaggedSymbol) }
      attr_accessor :currency

      # This is the description the vendor provides.
      sig { returns(String) }
      attr_accessor :description

      # The identifier for the route this Declined Transaction came through. Routes are
      # things like cards and ACH details.
      sig { returns(T.nilable(String)) }
      attr_accessor :route_id

      # The type of the route this Declined Transaction came through.
      sig do
        returns(
          T.nilable(Increase::DeclinedTransaction::RouteType::TaggedSymbol)
        )
      end
      attr_accessor :route_type

      # This is an object giving more details on the network-level event that caused the
      # Declined Transaction. For example, for a card transaction this lists the
      # merchant's industry and location. Note that for backwards compatibility reasons,
      # additional undocumented keys may appear in this object. These should be treated
      # as deprecated and will be removed in the future.
      sig { returns(Increase::DeclinedTransaction::Source) }
      attr_reader :source

      sig { params(source: Increase::DeclinedTransaction::Source::OrHash).void }
      attr_writer :source

      # A constant representing the object's type. For this resource it will always be
      # `declined_transaction`.
      sig { returns(Increase::DeclinedTransaction::Type::TaggedSymbol) }
      attr_accessor :type

      # Declined Transactions are refused additions and removals of money from your bank
      # account. For example, Declined Transactions are caused when your Account has an
      # insufficient balance or your Limits are triggered.
      sig do
        params(
          id: String,
          account_id: String,
          amount: Integer,
          created_at: Time,
          currency: Increase::DeclinedTransaction::Currency::OrSymbol,
          description: String,
          route_id: T.nilable(String),
          route_type:
            T.nilable(Increase::DeclinedTransaction::RouteType::OrSymbol),
          source: Increase::DeclinedTransaction::Source::OrHash,
          type: Increase::DeclinedTransaction::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Declined Transaction identifier.
        id:,
        # The identifier for the Account the Declined Transaction belongs to.
        account_id:,
        # The Declined Transaction amount in the minor unit of its currency. For dollars,
        # for example, this is cents.
        amount:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the
        # Transaction occurred.
        created_at:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Declined
        # Transaction's currency. This will match the currency on the Declined
        # Transaction's Account.
        currency:,
        # This is the description the vendor provides.
        description:,
        # The identifier for the route this Declined Transaction came through. Routes are
        # things like cards and ACH details.
        route_id:,
        # The type of the route this Declined Transaction came through.
        route_type:,
        # This is an object giving more details on the network-level event that caused the
        # Declined Transaction. For example, for a card transaction this lists the
        # merchant's industry and location. Note that for backwards compatibility reasons,
        # additional undocumented keys may appear in this object. These should be treated
        # as deprecated and will be removed in the future.
        source:,
        # A constant representing the object's type. For this resource it will always be
        # `declined_transaction`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            amount: Integer,
            created_at: Time,
            currency: Increase::DeclinedTransaction::Currency::TaggedSymbol,
            description: String,
            route_id: T.nilable(String),
            route_type:
              T.nilable(Increase::DeclinedTransaction::RouteType::TaggedSymbol),
            source: Increase::DeclinedTransaction::Source,
            type: Increase::DeclinedTransaction::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Declined
      # Transaction's currency. This will match the currency on the Declined
      # Transaction's Account.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::DeclinedTransaction::Currency)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # US Dollar (USD)
        USD = T.let(:USD, Increase::DeclinedTransaction::Currency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::DeclinedTransaction::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The type of the route this Declined Transaction came through.
      module RouteType
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::DeclinedTransaction::RouteType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # An Account Number.
        ACCOUNT_NUMBER =
          T.let(
            :account_number,
            Increase::DeclinedTransaction::RouteType::TaggedSymbol
          )

        # A Card.
        CARD =
          T.let(:card, Increase::DeclinedTransaction::RouteType::TaggedSymbol)

        # A Lockbox.
        LOCKBOX =
          T.let(
            :lockbox,
            Increase::DeclinedTransaction::RouteType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::DeclinedTransaction::RouteType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Source < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DeclinedTransaction::Source,
              Increase::Internal::AnyHash
            )
          end

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        sig do
          returns(Increase::DeclinedTransaction::Source::Category::TaggedSymbol)
        end
        attr_accessor :category

        # An ACH Decline object. This field will be present in the JSON response if and
        # only if `category` is equal to `ach_decline`.
        sig do
          returns(T.nilable(Increase::DeclinedTransaction::Source::ACHDecline))
        end
        attr_reader :ach_decline

        sig do
          params(
            ach_decline:
              T.nilable(
                Increase::DeclinedTransaction::Source::ACHDecline::OrHash
              )
          ).void
        end
        attr_writer :ach_decline

        # A Card Decline object. This field will be present in the JSON response if and
        # only if `category` is equal to `card_decline`.
        sig do
          returns(T.nilable(Increase::DeclinedTransaction::Source::CardDecline))
        end
        attr_reader :card_decline

        sig do
          params(
            card_decline:
              T.nilable(
                Increase::DeclinedTransaction::Source::CardDecline::OrHash
              )
          ).void
        end
        attr_writer :card_decline

        # A Check Decline object. This field will be present in the JSON response if and
        # only if `category` is equal to `check_decline`.
        sig do
          returns(
            T.nilable(Increase::DeclinedTransaction::Source::CheckDecline)
          )
        end
        attr_reader :check_decline

        sig do
          params(
            check_decline:
              T.nilable(
                Increase::DeclinedTransaction::Source::CheckDecline::OrHash
              )
          ).void
        end
        attr_writer :check_decline

        # A Check Deposit Rejection object. This field will be present in the JSON
        # response if and only if `category` is equal to `check_deposit_rejection`.
        sig do
          returns(
            T.nilable(
              Increase::DeclinedTransaction::Source::CheckDepositRejection
            )
          )
        end
        attr_reader :check_deposit_rejection

        sig do
          params(
            check_deposit_rejection:
              T.nilable(
                Increase::DeclinedTransaction::Source::CheckDepositRejection::OrHash
              )
          ).void
        end
        attr_writer :check_deposit_rejection

        # An Inbound FedNow Transfer Decline object. This field will be present in the
        # JSON response if and only if `category` is equal to
        # `inbound_fednow_transfer_decline`.
        sig do
          returns(
            T.nilable(
              Increase::DeclinedTransaction::Source::InboundFednowTransferDecline
            )
          )
        end
        attr_reader :inbound_fednow_transfer_decline

        sig do
          params(
            inbound_fednow_transfer_decline:
              T.nilable(
                Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::OrHash
              )
          ).void
        end
        attr_writer :inbound_fednow_transfer_decline

        # An Inbound Real-Time Payments Transfer Decline object. This field will be
        # present in the JSON response if and only if `category` is equal to
        # `inbound_real_time_payments_transfer_decline`.
        sig do
          returns(
            T.nilable(
              Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline
            )
          )
        end
        attr_reader :inbound_real_time_payments_transfer_decline

        sig do
          params(
            inbound_real_time_payments_transfer_decline:
              T.nilable(
                Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::OrHash
              )
          ).void
        end
        attr_writer :inbound_real_time_payments_transfer_decline

        # If the category of this Transaction source is equal to `other`, this field will
        # contain an empty object, otherwise it will contain null.
        sig { returns(T.nilable(Increase::DeclinedTransaction::Source::Other)) }
        attr_reader :other

        sig do
          params(
            other:
              T.nilable(Increase::DeclinedTransaction::Source::Other::OrHash)
          ).void
        end
        attr_writer :other

        # A Wire Decline object. This field will be present in the JSON response if and
        # only if `category` is equal to `wire_decline`.
        sig do
          returns(T.nilable(Increase::DeclinedTransaction::Source::WireDecline))
        end
        attr_reader :wire_decline

        sig do
          params(
            wire_decline:
              T.nilable(
                Increase::DeclinedTransaction::Source::WireDecline::OrHash
              )
          ).void
        end
        attr_writer :wire_decline

        # This is an object giving more details on the network-level event that caused the
        # Declined Transaction. For example, for a card transaction this lists the
        # merchant's industry and location. Note that for backwards compatibility reasons,
        # additional undocumented keys may appear in this object. These should be treated
        # as deprecated and will be removed in the future.
        sig do
          params(
            category: Increase::DeclinedTransaction::Source::Category::OrSymbol,
            ach_decline:
              T.nilable(
                Increase::DeclinedTransaction::Source::ACHDecline::OrHash
              ),
            card_decline:
              T.nilable(
                Increase::DeclinedTransaction::Source::CardDecline::OrHash
              ),
            check_decline:
              T.nilable(
                Increase::DeclinedTransaction::Source::CheckDecline::OrHash
              ),
            check_deposit_rejection:
              T.nilable(
                Increase::DeclinedTransaction::Source::CheckDepositRejection::OrHash
              ),
            inbound_fednow_transfer_decline:
              T.nilable(
                Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::OrHash
              ),
            inbound_real_time_payments_transfer_decline:
              T.nilable(
                Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::OrHash
              ),
            other:
              T.nilable(Increase::DeclinedTransaction::Source::Other::OrHash),
            wire_decline:
              T.nilable(
                Increase::DeclinedTransaction::Source::WireDecline::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The type of the resource. We may add additional possible values for this enum
          # over time; your application should be able to handle such additions gracefully.
          category:,
          # An ACH Decline object. This field will be present in the JSON response if and
          # only if `category` is equal to `ach_decline`.
          ach_decline: nil,
          # A Card Decline object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_decline`.
          card_decline: nil,
          # A Check Decline object. This field will be present in the JSON response if and
          # only if `category` is equal to `check_decline`.
          check_decline: nil,
          # A Check Deposit Rejection object. This field will be present in the JSON
          # response if and only if `category` is equal to `check_deposit_rejection`.
          check_deposit_rejection: nil,
          # An Inbound FedNow Transfer Decline object. This field will be present in the
          # JSON response if and only if `category` is equal to
          # `inbound_fednow_transfer_decline`.
          inbound_fednow_transfer_decline: nil,
          # An Inbound Real-Time Payments Transfer Decline object. This field will be
          # present in the JSON response if and only if `category` is equal to
          # `inbound_real_time_payments_transfer_decline`.
          inbound_real_time_payments_transfer_decline: nil,
          # If the category of this Transaction source is equal to `other`, this field will
          # contain an empty object, otherwise it will contain null.
          other: nil,
          # A Wire Decline object. This field will be present in the JSON response if and
          # only if `category` is equal to `wire_decline`.
          wire_decline: nil
        )
        end

        sig do
          override.returns(
            {
              category:
                Increase::DeclinedTransaction::Source::Category::TaggedSymbol,
              ach_decline:
                T.nilable(Increase::DeclinedTransaction::Source::ACHDecline),
              card_decline:
                T.nilable(Increase::DeclinedTransaction::Source::CardDecline),
              check_decline:
                T.nilable(Increase::DeclinedTransaction::Source::CheckDecline),
              check_deposit_rejection:
                T.nilable(
                  Increase::DeclinedTransaction::Source::CheckDepositRejection
                ),
              inbound_fednow_transfer_decline:
                T.nilable(
                  Increase::DeclinedTransaction::Source::InboundFednowTransferDecline
                ),
              inbound_real_time_payments_transfer_decline:
                T.nilable(
                  Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline
                ),
              other: T.nilable(Increase::DeclinedTransaction::Source::Other),
              wire_decline:
                T.nilable(Increase::DeclinedTransaction::Source::WireDecline)
            }
          )
        end
        def to_hash
        end

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::DeclinedTransaction::Source::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # ACH Decline: details will be under the `ach_decline` object.
          ACH_DECLINE =
            T.let(
              :ach_decline,
              Increase::DeclinedTransaction::Source::Category::TaggedSymbol
            )

          # Card Decline: details will be under the `card_decline` object.
          CARD_DECLINE =
            T.let(
              :card_decline,
              Increase::DeclinedTransaction::Source::Category::TaggedSymbol
            )

          # Check Decline: details will be under the `check_decline` object.
          CHECK_DECLINE =
            T.let(
              :check_decline,
              Increase::DeclinedTransaction::Source::Category::TaggedSymbol
            )

          # Inbound Real-Time Payments Transfer Decline: details will be under the `inbound_real_time_payments_transfer_decline` object.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_DECLINE =
            T.let(
              :inbound_real_time_payments_transfer_decline,
              Increase::DeclinedTransaction::Source::Category::TaggedSymbol
            )

          # Inbound FedNow Transfer Decline: details will be under the `inbound_fednow_transfer_decline` object.
          INBOUND_FEDNOW_TRANSFER_DECLINE =
            T.let(
              :inbound_fednow_transfer_decline,
              Increase::DeclinedTransaction::Source::Category::TaggedSymbol
            )

          # Wire Decline: details will be under the `wire_decline` object.
          WIRE_DECLINE =
            T.let(
              :wire_decline,
              Increase::DeclinedTransaction::Source::Category::TaggedSymbol
            )

          # Check Deposit Rejection: details will be under the `check_deposit_rejection` object.
          CHECK_DEPOSIT_REJECTION =
            T.let(
              :check_deposit_rejection,
              Increase::DeclinedTransaction::Source::Category::TaggedSymbol
            )

          # The Declined Transaction was made for an undocumented or deprecated reason.
          OTHER =
            T.let(
              :other,
              Increase::DeclinedTransaction::Source::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::DeclinedTransaction::Source::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class ACHDecline < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::DeclinedTransaction::Source::ACHDecline,
                Increase::Internal::AnyHash
              )
            end

          # The ACH Decline's identifier.
          sig { returns(String) }
          attr_accessor :id

          # The declined amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The identifier of the Inbound ACH Transfer object associated with this decline.
          sig { returns(String) }
          attr_accessor :inbound_ach_transfer_id

          # The descriptive date of the transfer.
          sig { returns(T.nilable(String)) }
          attr_accessor :originator_company_descriptive_date

          # The additional information included with the transfer.
          sig { returns(T.nilable(String)) }
          attr_accessor :originator_company_discretionary_data

          # The identifier of the company that initiated the transfer.
          sig { returns(String) }
          attr_accessor :originator_company_id

          # The name of the company that initiated the transfer.
          sig { returns(String) }
          attr_accessor :originator_company_name

          # Why the ACH transfer was declined.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          # The id of the receiver of the transfer.
          sig { returns(T.nilable(String)) }
          attr_accessor :receiver_id_number

          # The name of the receiver of the transfer.
          sig { returns(T.nilable(String)) }
          attr_accessor :receiver_name

          # The trace number of the transfer.
          sig { returns(String) }
          attr_accessor :trace_number

          # A constant representing the object's type. For this resource it will always be
          # `ach_decline`.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::ACHDecline::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # An ACH Decline object. This field will be present in the JSON response if and
          # only if `category` is equal to `ach_decline`.
          sig do
            params(
              id: String,
              amount: Integer,
              inbound_ach_transfer_id: String,
              originator_company_descriptive_date: T.nilable(String),
              originator_company_discretionary_data: T.nilable(String),
              originator_company_id: String,
              originator_company_name: String,
              reason:
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::OrSymbol,
              receiver_id_number: T.nilable(String),
              receiver_name: T.nilable(String),
              trace_number: String,
              type:
                Increase::DeclinedTransaction::Source::ACHDecline::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The ACH Decline's identifier.
            id:,
            # The declined amount in USD cents.
            amount:,
            # The identifier of the Inbound ACH Transfer object associated with this decline.
            inbound_ach_transfer_id:,
            # The descriptive date of the transfer.
            originator_company_descriptive_date:,
            # The additional information included with the transfer.
            originator_company_discretionary_data:,
            # The identifier of the company that initiated the transfer.
            originator_company_id:,
            # The name of the company that initiated the transfer.
            originator_company_name:,
            # Why the ACH transfer was declined.
            reason:,
            # The id of the receiver of the transfer.
            receiver_id_number:,
            # The name of the receiver of the transfer.
            receiver_name:,
            # The trace number of the transfer.
            trace_number:,
            # A constant representing the object's type. For this resource it will always be
            # `ach_decline`.
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                amount: Integer,
                inbound_ach_transfer_id: String,
                originator_company_descriptive_date: T.nilable(String),
                originator_company_discretionary_data: T.nilable(String),
                originator_company_id: String,
                originator_company_name: String,
                reason:
                  Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol,
                receiver_id_number: T.nilable(String),
                receiver_name: T.nilable(String),
                trace_number: String,
                type:
                  Increase::DeclinedTransaction::Source::ACHDecline::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Why the ACH transfer was declined.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::DeclinedTransaction::Source::ACHDecline::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The account number is canceled.
            ACH_ROUTE_CANCELED =
              T.let(
                :ach_route_canceled,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The account number is disabled.
            ACH_ROUTE_DISABLED =
              T.let(
                :ach_route_disabled,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The transaction would cause an Increase limit to be exceeded.
            BREACHES_LIMIT =
              T.let(
                :breaches_limit,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE =
              T.let(
                :entity_not_active,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # Your account is inactive.
            GROUP_LOCKED =
              T.let(
                :group_locked,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The transaction is not allowed per Increase's terms.
            TRANSACTION_NOT_ALLOWED =
              T.let(
                :transaction_not_allowed,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # Your integration declined this transfer via the API.
            USER_INITIATED =
              T.let(
                :user_initiated,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # Your account contains insufficient funds.
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The originating financial institution asked for this transfer to be returned. The receiving bank is complying with the request.
            RETURNED_PER_ODFI_REQUEST =
              T.let(
                :returned_per_odfi_request,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The customer no longer authorizes this transaction.
            AUTHORIZATION_REVOKED_BY_CUSTOMER =
              T.let(
                :authorization_revoked_by_customer,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The customer asked for the payment to be stopped.
            PAYMENT_STOPPED =
              T.let(
                :payment_stopped,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The customer advises that the debit was unauthorized.
            CUSTOMER_ADVISED_UNAUTHORIZED_IMPROPER_INELIGIBLE_OR_INCOMPLETE =
              T.let(
                :customer_advised_unauthorized_improper_ineligible_or_incomplete,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The payee is deceased.
            REPRESENTATIVE_PAYEE_DECEASED_OR_UNABLE_TO_CONTINUE_IN_THAT_CAPACITY =
              T.let(
                :representative_payee_deceased_or_unable_to_continue_in_that_capacity,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The account holder is deceased.
            BENEFICIARY_OR_ACCOUNT_HOLDER_DECEASED =
              T.let(
                :beneficiary_or_account_holder_deceased,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The customer refused a credit entry.
            CREDIT_ENTRY_REFUSED_BY_RECEIVER =
              T.let(
                :credit_entry_refused_by_receiver,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The account holder identified this transaction as a duplicate.
            DUPLICATE_ENTRY =
              T.let(
                :duplicate_entry,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The corporate customer no longer authorizes this transaction.
            CORPORATE_CUSTOMER_ADVISED_NOT_AUTHORIZED =
              T.let(
                :corporate_customer_advised_not_authorized,
                Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `ach_decline`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::DeclinedTransaction::Source::ACHDecline::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACH_DECLINE =
              T.let(
                :ach_decline,
                Increase::DeclinedTransaction::Source::ACHDecline::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::ACHDecline::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CardDecline < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::DeclinedTransaction::Source::CardDecline,
                Increase::Internal::AnyHash
              )
            end

          # The Card Decline identifier.
          sig { returns(String) }
          attr_accessor :id

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol
            )
          end
          attr_accessor :actioner

          # Additional amounts associated with the card authorization, such as ATM
          # surcharges fees. These are usually a subset of the `amount` field and are used
          # to provide more detailed information about the transaction.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts
            )
          end
          attr_reader :additional_amounts

          sig do
            params(
              additional_amounts:
                Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::OrHash
            ).void
          end
          attr_writer :additional_amounts

          # The declined amount in the minor unit of the destination account currency. For
          # dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          # account currency.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The identifier of the declined transaction created for this Card Decline.
          sig { returns(String) }
          attr_accessor :declined_transaction_id

          # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          # purchase), the identifier of the token that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :digital_wallet_token_id

          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::CardDecline::Direction::TaggedSymbol
            )
          end
          attr_accessor :direction

          # The identifier of the card authorization this request attempted to incrementally
          # authorize.
          sig { returns(T.nilable(String)) }
          attr_accessor :incremented_card_authorization_id

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
              Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails
            )
          end
          attr_reader :network_details

          sig do
            params(
              network_details:
                Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::OrHash
            ).void
          end
          attr_writer :network_details

          # Network-specific identifiers for a specific request or transaction.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The risk score generated by the card network. For Visa this is the Visa Advanced
          # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
          # score is from 0 to 999, where 999 is the riskiest.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :network_risk_score

          # If the authorization was made in-person with a physical card, the Physical Card
          # that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :physical_card_id

          # The declined amount in the minor unit of the transaction's presentment currency.
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
              Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
            )
          end
          attr_accessor :processing_category

          # The identifier of the Real-Time Decision sent to approve or decline this
          # transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :real_time_decision_id

          # This is present if a specific decline reason was given in the real-time
          # decision.
          sig do
            returns(
              T.nilable(
                Increase::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )
            )
          end
          attr_accessor :real_time_decision_reason

          # Why the transaction was declined.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          # is transacting with.
          sig { returns(T.nilable(String)) }
          attr_accessor :terminal_id

          # Fields related to verification of cardholder-provided values.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::CardDecline::Verification
            )
          end
          attr_reader :verification

          sig do
            params(
              verification:
                Increase::DeclinedTransaction::Source::CardDecline::Verification::OrHash
            ).void
          end
          attr_writer :verification

          # A Card Decline object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_decline`.
          sig do
            params(
              id: String,
              actioner:
                Increase::DeclinedTransaction::Source::CardDecline::Actioner::OrSymbol,
              additional_amounts:
                Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::OrHash,
              amount: Integer,
              card_payment_id: String,
              currency:
                Increase::DeclinedTransaction::Source::CardDecline::Currency::OrSymbol,
              declined_transaction_id: String,
              digital_wallet_token_id: T.nilable(String),
              direction:
                Increase::DeclinedTransaction::Source::CardDecline::Direction::OrSymbol,
              incremented_card_authorization_id: T.nilable(String),
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: T.nilable(String),
              merchant_country: String,
              merchant_descriptor: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_details:
                Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::OrHash,
              network_identifiers:
                Increase::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers::OrHash,
              network_risk_score: T.nilable(Integer),
              physical_card_id: T.nilable(String),
              presentment_amount: Integer,
              presentment_currency: String,
              processing_category:
                Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::OrSymbol,
              real_time_decision_id: T.nilable(String),
              real_time_decision_reason:
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::OrSymbol
                ),
              reason:
                Increase::DeclinedTransaction::Source::CardDecline::Reason::OrSymbol,
              terminal_id: T.nilable(String),
              verification:
                Increase::DeclinedTransaction::Source::CardDecline::Verification::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Decline identifier.
            id:,
            # Whether this authorization was approved by Increase, the card network through
            # stand-in processing, or the user through a real-time decision.
            actioner:,
            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            additional_amounts:,
            # The declined amount in the minor unit of the destination account currency. For
            # dollars, for example, this is cents.
            amount:,
            # The ID of the Card Payment this transaction belongs to.
            card_payment_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
            # account currency.
            currency:,
            # The identifier of the declined transaction created for this Card Decline.
            declined_transaction_id:,
            # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
            # purchase), the identifier of the token that was used.
            digital_wallet_token_id:,
            # The direction describes the direction the funds will move, either from the
            # cardholder to the merchant or from the merchant to the cardholder.
            direction:,
            # The identifier of the card authorization this request attempted to incrementally
            # authorize.
            incremented_card_authorization_id:,
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
            # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
            # score is from 0 to 999, where 999 is the riskiest.
            network_risk_score:,
            # If the authorization was made in-person with a physical card, the Physical Card
            # that was used.
            physical_card_id:,
            # The declined amount in the minor unit of the transaction's presentment currency.
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
            # This is present if a specific decline reason was given in the real-time
            # decision.
            real_time_decision_reason:,
            # Why the transaction was declined.
            reason:,
            # The terminal identifier (commonly abbreviated as TID) of the terminal the card
            # is transacting with.
            terminal_id:,
            # Fields related to verification of cardholder-provided values.
            verification:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                actioner:
                  Increase::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol,
                additional_amounts:
                  Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts,
                amount: Integer,
                card_payment_id: String,
                currency:
                  Increase::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol,
                declined_transaction_id: String,
                digital_wallet_token_id: T.nilable(String),
                direction:
                  Increase::DeclinedTransaction::Source::CardDecline::Direction::TaggedSymbol,
                incremented_card_authorization_id: T.nilable(String),
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_city: T.nilable(String),
                merchant_country: String,
                merchant_descriptor: String,
                merchant_postal_code: T.nilable(String),
                merchant_state: T.nilable(String),
                network_details:
                  Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails,
                network_identifiers:
                  Increase::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers,
                network_risk_score: T.nilable(Integer),
                physical_card_id: T.nilable(String),
                presentment_amount: Integer,
                presentment_currency: String,
                processing_category:
                  Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol,
                real_time_decision_id: T.nilable(String),
                real_time_decision_reason:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
                  ),
                reason:
                  Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol,
                terminal_id: T.nilable(String),
                verification:
                  Increase::DeclinedTransaction::Source::CardDecline::Verification
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
                  Increase::DeclinedTransaction::Source::CardDecline::Actioner
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # This object was actioned by the user through a real-time decision.
            USER =
              T.let(
                :user,
                Increase::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol
              )

            # This object was actioned by Increase without user intervention.
            INCREASE =
              T.let(
                :increase,
                Increase::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol
              )

            # This object was actioned by the network, through stand-in processing.
            NETWORK =
              T.let(
                :network,
                Increase::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol
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
                  Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts,
                  Increase::Internal::AnyHash
                )
              end

            # The part of this transaction amount that was for clinic-related services.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Clinic
                )
              )
            end
            attr_reader :clinic

            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Clinic::OrHash
                  )
              ).void
            end
            attr_writer :clinic

            # The part of this transaction amount that was for dental-related services.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Dental
                )
              )
            end
            attr_reader :dental

            sig do
              params(
                dental:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Dental::OrHash
                  )
              ).void
            end
            attr_writer :dental

            # The original pre-authorized amount.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Original
                )
              )
            end
            attr_reader :original

            sig do
              params(
                original:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Original::OrHash
                  )
              ).void
            end
            attr_writer :original

            # The part of this transaction amount that was for healthcare prescriptions.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Prescription
                )
              )
            end
            attr_reader :prescription

            sig do
              params(
                prescription:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Prescription::OrHash
                  )
              ).void
            end
            attr_writer :prescription

            # The surcharge amount charged for this transaction by the merchant.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Surcharge
                )
              )
            end
            attr_reader :surcharge

            sig do
              params(
                surcharge:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Surcharge::OrHash
                  )
              ).void
            end
            attr_writer :surcharge

            # The total amount of a series of incremental authorizations, optionally provided.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalCumulative
                )
              )
            end
            attr_reader :total_cumulative

            sig do
              params(
                total_cumulative:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalCumulative::OrHash
                  )
              ).void
            end
            attr_writer :total_cumulative

            # The total amount of healthcare-related additional amounts.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalHealthcare
                )
              )
            end
            attr_reader :total_healthcare

            sig do
              params(
                total_healthcare:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalHealthcare::OrHash
                  )
              ).void
            end
            attr_writer :total_healthcare

            # The part of this transaction amount that was for transit-related services.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Transit
                )
              )
            end
            attr_reader :transit

            sig do
              params(
                transit:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Transit::OrHash
                  )
              ).void
            end
            attr_writer :transit

            # An unknown additional amount.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Unknown
                )
              )
            end
            attr_reader :unknown

            sig do
              params(
                unknown:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Unknown::OrHash
                  )
              ).void
            end
            attr_writer :unknown

            # The part of this transaction amount that was for vision-related services.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Vision
                )
              )
            end
            attr_reader :vision

            sig do
              params(
                vision:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Vision::OrHash
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
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Clinic::OrHash
                  ),
                dental:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Dental::OrHash
                  ),
                original:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Original::OrHash
                  ),
                prescription:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Prescription::OrHash
                  ),
                surcharge:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Surcharge::OrHash
                  ),
                total_cumulative:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalCumulative::OrHash
                  ),
                total_healthcare:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalHealthcare::OrHash
                  ),
                transit:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Transit::OrHash
                  ),
                unknown:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Unknown::OrHash
                  ),
                vision:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Vision::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The part of this transaction amount that was for clinic-related services.
              clinic:,
              # The part of this transaction amount that was for dental-related services.
              dental:,
              # The original pre-authorized amount.
              original:,
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
                      Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Clinic
                    ),
                  dental:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Dental
                    ),
                  original:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Original
                    ),
                  prescription:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Prescription
                    ),
                  surcharge:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Surcharge
                    ),
                  total_cumulative:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalCumulative
                    ),
                  total_healthcare:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalHealthcare
                    ),
                  transit:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Transit
                    ),
                  unknown:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Unknown
                    ),
                  vision:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Vision
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
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Clinic,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
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
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
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
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Dental,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
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
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
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

            class Original < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Original,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The original pre-authorized amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
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
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Prescription,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
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
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
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
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Surcharge,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
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
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
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
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalCumulative,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
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
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
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
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalHealthcare,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
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
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
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
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Transit,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
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
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
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
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Unknown,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
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
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
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
                    Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Vision,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
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
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
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

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          # account currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::DeclinedTransaction::Source::CardDecline::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol
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
                  Increase::DeclinedTransaction::Source::CardDecline::Direction
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # A regular card authorization where funds are debited from the cardholder.
            SETTLEMENT =
              T.let(
                :settlement,
                Increase::DeclinedTransaction::Source::CardDecline::Direction::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::DeclinedTransaction::Source::CardDecline::Direction::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::CardDecline::Direction::TaggedSymbol
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
                  Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails,
                  Increase::Internal::AnyHash
                )
              end

            # The payment network used to process this card authorization.
            sig do
              returns(
                Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category::TaggedSymbol
              )
            end
            attr_accessor :category

            # Fields specific to the `pulse` network.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Pulse
                )
              )
            end
            attr_reader :pulse

            sig do
              params(
                pulse:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Pulse::OrHash
                  )
              ).void
            end
            attr_writer :pulse

            # Fields specific to the `visa` network.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa
                )
              )
            end
            attr_reader :visa

            sig do
              params(
                visa:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::OrHash
                  )
              ).void
            end
            attr_writer :visa

            # Fields specific to the `network`.
            sig do
              params(
                category:
                  Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category::OrSymbol,
                pulse:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Pulse::OrHash
                  ),
                visa:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The payment network used to process this card authorization.
              category:,
              # Fields specific to the `pulse` network.
              pulse:,
              # Fields specific to the `visa` network.
              visa:
            )
            end

            sig do
              override.returns(
                {
                  category:
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category::TaggedSymbol,
                  pulse:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Pulse
                    ),
                  visa:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa
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
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Visa
              VISA =
                T.let(
                  :visa,
                  Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category::TaggedSymbol
                )

              # Pulse
              PULSE =
                T.let(
                  :pulse,
                  Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Pulse < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Pulse,
                    Increase::Internal::AnyHash
                  )
                end

              # Fields specific to the `pulse` network.
              sig { returns(T.attached_class) }
              def self.new
              end

              sig { override.returns({}) }
              def to_hash
              end
            end

            class Visa < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa,
                    Increase::Internal::AnyHash
                  )
                end

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              sig do
                returns(
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :electronic_commerce_indicator

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              sig do
                returns(
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )
                )
              end
              attr_accessor :point_of_service_entry_mode

              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              sig do
                returns(
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )
                )
              end
              attr_accessor :stand_in_processing_reason

              # Fields specific to the `visa` network.
              sig do
                params(
                  electronic_commerce_indicator:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::OrSymbol
                    ),
                  point_of_service_entry_mode:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::OrSymbol
                    ),
                  stand_in_processing_reason:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
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
                        Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                      ),
                    point_of_service_entry_mode:
                      T.nilable(
                        Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                      ),
                    stand_in_processing_reason:
                      T.nilable(
                        Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
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
                      Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
                MAIL_PHONE_ORDER =
                  T.let(
                    :mail_phone_order,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
                RECURRING =
                  T.let(
                    :recurring,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
                INSTALLMENT =
                  T.let(
                    :installment,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
                UNKNOWN_MAIL_PHONE_ORDER =
                  T.let(
                    :unknown_mail_phone_order,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
                SECURE_ELECTRONIC_COMMERCE =
                  T.let(
                    :secure_electronic_commerce,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
                NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                  T.let(
                    :non_authenticated_security_transaction_at_3ds_capable_merchant,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however, cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION =
                  T.let(
                    :non_authenticated_security_transaction,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION =
                  T.let(
                    :non_secure_transaction,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
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
                      Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Unknown
                UNKNOWN =
                  T.let(
                    :unknown,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Manual key entry
                MANUAL =
                  T.let(
                    :manual,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read, without card verification value
                MAGNETIC_STRIPE_NO_CVV =
                  T.let(
                    :magnetic_stripe_no_cvv,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Optical code
                OPTICAL_CODE =
                  T.let(
                    :optical_code,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card
                INTEGRATED_CIRCUIT_CARD =
                  T.let(
                    :integrated_circuit_card,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of chip card
                CONTACTLESS =
                  T.let(
                    :contactless,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Transaction initiated using a credential that has previously been stored on file
                CREDENTIAL_ON_FILE =
                  T.let(
                    :credential_on_file,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read
                MAGNETIC_STRIPE =
                  T.let(
                    :magnetic_stripe,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of magnetic stripe data
                CONTACTLESS_MAGNETIC_STRIPE =
                  T.let(
                    :contactless_magnetic_stripe,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card, without card verification value
                INTEGRATED_CIRCUIT_CARD_NO_CVV =
                  T.let(
                    :integrated_circuit_card_no_cvv,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
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
                      Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Increase failed to process the authorization in a timely manner.
                ISSUER_ERROR =
                  T.let(
                    :issuer_error,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
                INVALID_PHYSICAL_CARD =
                  T.let(
                    :invalid_physical_card,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The 3DS cardholder authentication verification value was invalid.
                INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                  T.let(
                    :invalid_cardholder_authentication_verification_value,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
                INTERNAL_VISA_ERROR =
                  T.let(
                    :internal_visa_error,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
                MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                  T.let(
                    :merchant_transaction_advisory_service_authentication_required,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
                PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK =
                  T.let(
                    :payment_fraud_disruption_acquirer_block,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An unspecific reason for stand-in processing.
                OTHER =
                  T.let(
                    :other,
                    Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
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
                  Increase::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

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
                authorization_identification_response: T.nilable(String),
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
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
                  authorization_identification_response: T.nilable(String),
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
                  Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Account funding transactions are transactions used to e.g., fund an account or transfer funds between accounts.
            ACCOUNT_FUNDING =
              T.let(
                :account_funding,
                Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # Automatic fuel dispenser authorizations occur when a card is used at a gas pump, prior to the actual transaction amount being known. They are followed by an advice message that updates the amount of the pending transaction.
            AUTOMATIC_FUEL_DISPENSER =
              T.let(
                :automatic_fuel_dispenser,
                Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # A transaction used to pay a bill.
            BILL_PAYMENT =
              T.let(
                :bill_payment,
                Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # Original credit transactions are used to send money to a cardholder.
            ORIGINAL_CREDIT =
              T.let(
                :original_credit,
                Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # A regular purchase.
            PURCHASE =
              T.let(
                :purchase,
                Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # Quasi-cash transactions represent purchases of items which may be convertible to cash.
            QUASI_CASH =
              T.let(
                :quasi_cash,
                Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # Cash disbursement transactions are used to withdraw cash from an ATM or a point of sale.
            CASH_DISBURSEMENT =
              T.let(
                :cash_disbursement,
                Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # A balance inquiry transaction is used to check the balance of an account associated with a card.
            BALANCE_INQUIRY =
              T.let(
                :balance_inquiry,
                Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # The processing category is unknown.
            UNKNOWN =
              T.let(
                :unknown,
                Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # This is present if a specific decline reason was given in the real-time
          # decision.
          module RealTimeDecisionReason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The cardholder does not have sufficient funds to cover the transaction. The merchant may attempt to process the transaction again.
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # This type of transaction is not allowed for this card. This transaction should not be retried.
            TRANSACTION_NEVER_ALLOWED =
              T.let(
                :transaction_never_allowed,
                Increase::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # The transaction amount exceeds the cardholder's approval limit. The merchant may attempt to process the transaction again.
            EXCEEDS_APPROVAL_LIMIT =
              T.let(
                :exceeds_approval_limit,
                Increase::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # The card has been temporarily disabled or not yet activated. The merchant may attempt to process the transaction again.
            CARD_TEMPORARILY_DISABLED =
              T.let(
                :card_temporarily_disabled,
                Increase::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # The transaction is suspected to be fraudulent. The merchant may attempt to process the transaction again.
            SUSPECTED_FRAUD =
              T.let(
                :suspected_fraud,
                Increase::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # The transaction was declined for another reason. The merchant may attempt to process the transaction again. This should be used sparingly.
            OTHER =
              T.let(
                :other,
                Increase::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Why the transaction was declined.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::DeclinedTransaction::Source::CardDecline::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The account has been closed.
            ACCOUNT_CLOSED =
              T.let(
                :account_closed,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The Card was not active.
            CARD_NOT_ACTIVE =
              T.let(
                :card_not_active,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The Card has been canceled.
            CARD_CANCELED =
              T.let(
                :card_canceled,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The Physical Card was not active.
            PHYSICAL_CARD_NOT_ACTIVE =
              T.let(
                :physical_card_not_active,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The account's entity was not active.
            ENTITY_NOT_ACTIVE =
              T.let(
                :entity_not_active,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The account was inactive.
            GROUP_LOCKED =
              T.let(
                :group_locked,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The Card's Account did not have a sufficient available balance.
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The given CVV2 did not match the card's value.
            CVV2_MISMATCH =
              T.let(
                :cvv2_mismatch,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The given PIN did not match the card's value.
            PIN_MISMATCH =
              T.let(
                :pin_mismatch,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The given expiration date did not match the card's value. Only applies when a CVV2 is present.
            CARD_EXPIRATION_MISMATCH =
              T.let(
                :card_expiration_mismatch,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The attempted card transaction is not allowed per Increase's terms.
            TRANSACTION_NOT_ALLOWED =
              T.let(
                :transaction_not_allowed,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The transaction was blocked by a Limit.
            BREACHES_LIMIT =
              T.let(
                :breaches_limit,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # Your application declined the transaction via webhook.
            WEBHOOK_DECLINED =
              T.let(
                :webhook_declined,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # Your application webhook did not respond without the required timeout.
            WEBHOOK_TIMED_OUT =
              T.let(
                :webhook_timed_out,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # Declined by stand-in processing.
            DECLINED_BY_STAND_IN_PROCESSING =
              T.let(
                :declined_by_stand_in_processing,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The card read had an invalid CVV, dCVV, or authorization request cryptogram.
            INVALID_PHYSICAL_CARD =
              T.let(
                :invalid_physical_card,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The original card authorization for this incremental authorization does not exist.
            MISSING_ORIGINAL_AUTHORIZATION =
              T.let(
                :missing_original_authorization,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The transaction was declined because the 3DS authentication failed.
            FAILED_3DS_AUTHENTICATION =
              T.let(
                :failed_3ds_authentication,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The transaction was suspected to be used by a card tester to test for valid card numbers.
            SUSPECTED_CARD_TESTING =
              T.let(
                :suspected_card_testing,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The transaction was suspected to be fraudulent. Please reach out to support@increase.com for more information.
            SUSPECTED_FRAUD =
              T.let(
                :suspected_fraud,
                Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
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
                  Increase::DeclinedTransaction::Source::CardDecline::Verification,
                  Increase::Internal::AnyHash
                )
              end

            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            sig do
              returns(
                Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode
              )
            end
            attr_reader :card_verification_code

            sig do
              params(
                card_verification_code:
                  Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::OrHash
              ).void
            end
            attr_writer :card_verification_code

            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            sig do
              returns(
                Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress
              )
            end
            attr_reader :cardholder_address

            sig do
              params(
                cardholder_address:
                  Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::OrHash
              ).void
            end
            attr_writer :cardholder_address

            # Cardholder name provided in the authorization request.
            sig do
              returns(
                T.nilable(
                  Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderName
                )
              )
            end
            attr_reader :cardholder_name

            sig do
              params(
                cardholder_name:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderName::OrHash
                  )
              ).void
            end
            attr_writer :cardholder_name

            # Fields related to verification of cardholder-provided values.
            sig do
              params(
                card_verification_code:
                  Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::OrHash,
                cardholder_address:
                  Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::OrHash,
                cardholder_name:
                  T.nilable(
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderName::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # Fields related to verification of the Card Verification Code, a 3-digit code on
              # the back of the card.
              card_verification_code:,
              # Cardholder address provided in the authorization request and the address on file
              # we verified it against.
              cardholder_address:,
              # Cardholder name provided in the authorization request.
              cardholder_name:
            )
            end

            sig do
              override.returns(
                {
                  card_verification_code:
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode,
                  cardholder_address:
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress,
                  cardholder_name:
                    T.nilable(
                      Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderName
                    )
                }
              )
            end
            def to_hash
            end

            class CardVerificationCode < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode,
                    Increase::Internal::AnyHash
                  )
                end

              # The result of verifying the Card Verification Code.
              sig do
                returns(
                  Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                )
              end
              attr_accessor :result

              # Fields related to verification of the Card Verification Code, a 3-digit code on
              # the back of the card.
              sig do
                params(
                  result:
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::OrSymbol
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
                      Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
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
                      Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No card verification code was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code matched the one on file.
                MATCH =
                  T.let(
                    :match,
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code did not match the one on file.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
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
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress,
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
                  Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
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
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::OrSymbol
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
                      Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
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
                      Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No address information was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address does not match or was not provided.
                POSTAL_CODE_MATCH_ADDRESS_NO_MATCH =
                  T.let(
                    :postal_code_match_address_no_match,
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code does not match, but the street address matches or was not provided.
                POSTAL_CODE_NO_MATCH_ADDRESS_MATCH =
                  T.let(
                    :postal_code_no_match_address_match,
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address match.
                MATCH =
                  T.let(
                    :match,
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address do not match.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address was not verified. (deprecated)
                POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED =
                  T.let(
                    :postal_code_match_address_not_checked,
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class CardholderName < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderName,
                    Increase::Internal::AnyHash
                  )
                end

              # The first name provided for verification in the authorization request.
              sig { returns(T.nilable(String)) }
              attr_accessor :provided_first_name

              # The last name provided for verification in the authorization request.
              sig { returns(T.nilable(String)) }
              attr_accessor :provided_last_name

              # The middle name provided for verification in the authorization request.
              sig { returns(T.nilable(String)) }
              attr_accessor :provided_middle_name

              # Cardholder name provided in the authorization request.
              sig do
                params(
                  provided_first_name: T.nilable(String),
                  provided_last_name: T.nilable(String),
                  provided_middle_name: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # The first name provided for verification in the authorization request.
                provided_first_name:,
                # The last name provided for verification in the authorization request.
                provided_last_name:,
                # The middle name provided for verification in the authorization request.
                provided_middle_name:
              )
              end

              sig do
                override.returns(
                  {
                    provided_first_name: T.nilable(String),
                    provided_last_name: T.nilable(String),
                    provided_middle_name: T.nilable(String)
                  }
                )
              end
              def to_hash
              end
            end
          end
        end

        class CheckDecline < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::DeclinedTransaction::Source::CheckDecline,
                Increase::Internal::AnyHash
              )
            end

          # The declined amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # A computer-readable number printed on the MICR line of business checks, usually
          # the check number. This is useful for positive pay checks, but can be unreliably
          # transmitted by the bank of first deposit.
          sig { returns(T.nilable(String)) }
          attr_accessor :auxiliary_on_us

          # The identifier of the API File object containing an image of the back of the
          # declined check.
          sig { returns(T.nilable(String)) }
          attr_accessor :back_image_file_id

          # The identifier of the Check Transfer object associated with this decline.
          sig { returns(T.nilable(String)) }
          attr_accessor :check_transfer_id

          # The identifier of the API File object containing an image of the front of the
          # declined check.
          sig { returns(T.nilable(String)) }
          attr_accessor :front_image_file_id

          # The identifier of the Inbound Check Deposit object associated with this decline.
          sig { returns(T.nilable(String)) }
          attr_accessor :inbound_check_deposit_id

          # Why the check was declined.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          # A Check Decline object. This field will be present in the JSON response if and
          # only if `category` is equal to `check_decline`.
          sig do
            params(
              amount: Integer,
              auxiliary_on_us: T.nilable(String),
              back_image_file_id: T.nilable(String),
              check_transfer_id: T.nilable(String),
              front_image_file_id: T.nilable(String),
              inbound_check_deposit_id: T.nilable(String),
              reason:
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The declined amount in USD cents.
            amount:,
            # A computer-readable number printed on the MICR line of business checks, usually
            # the check number. This is useful for positive pay checks, but can be unreliably
            # transmitted by the bank of first deposit.
            auxiliary_on_us:,
            # The identifier of the API File object containing an image of the back of the
            # declined check.
            back_image_file_id:,
            # The identifier of the Check Transfer object associated with this decline.
            check_transfer_id:,
            # The identifier of the API File object containing an image of the front of the
            # declined check.
            front_image_file_id:,
            # The identifier of the Inbound Check Deposit object associated with this decline.
            inbound_check_deposit_id:,
            # Why the check was declined.
            reason:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                auxiliary_on_us: T.nilable(String),
                back_image_file_id: T.nilable(String),
                check_transfer_id: T.nilable(String),
                front_image_file_id: T.nilable(String),
                inbound_check_deposit_id: T.nilable(String),
                reason:
                  Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Why the check was declined.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::DeclinedTransaction::Source::CheckDecline::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The account number is disabled.
            ACH_ROUTE_DISABLED =
              T.let(
                :ach_route_disabled,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The account number is canceled.
            ACH_ROUTE_CANCELED =
              T.let(
                :ach_route_canceled,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The deposited check was altered or fictitious.
            ALTERED_OR_FICTITIOUS =
              T.let(
                :altered_or_fictitious,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The transaction would cause a limit to be exceeded.
            BREACHES_LIMIT =
              T.let(
                :breaches_limit,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The check was not endorsed by the payee.
            ENDORSEMENT_IRREGULAR =
              T.let(
                :endorsement_irregular,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE =
              T.let(
                :entity_not_active,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # Your account is inactive.
            GROUP_LOCKED =
              T.let(
                :group_locked,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # Your account contains insufficient funds.
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # Stop payment requested for this check.
            STOP_PAYMENT_REQUESTED =
              T.let(
                :stop_payment_requested,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The check was a duplicate deposit.
            DUPLICATE_PRESENTMENT =
              T.let(
                :duplicate_presentment,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The check was not authorized.
            NOT_AUTHORIZED =
              T.let(
                :not_authorized,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The amount the receiving bank is attempting to deposit does not match the amount on the check.
            AMOUNT_MISMATCH =
              T.let(
                :amount_mismatch,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The check attempting to be deposited does not belong to Increase.
            NOT_OUR_ITEM =
              T.let(
                :not_our_item,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The account number on the check does not exist at Increase.
            NO_ACCOUNT_NUMBER_FOUND =
              T.let(
                :no_account_number_found,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The check is not readable. Please refer to the image.
            REFER_TO_IMAGE =
              T.let(
                :refer_to_image,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The check cannot be processed. This is rare: please contact support.
            UNABLE_TO_PROCESS =
              T.let(
                :unable_to_process,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The check image is unusable.
            UNUSABLE_IMAGE =
              T.let(
                :unusable_image,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # Your integration declined this check via the API.
            USER_INITIATED =
              T.let(
                :user_initiated,
                Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CheckDepositRejection < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::DeclinedTransaction::Source::CheckDepositRejection,
                Increase::Internal::AnyHash
              )
            end

          # The rejected amount in the minor unit of check's currency. For dollars, for
          # example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The identifier of the Check Deposit that was rejected.
          sig { returns(String) }
          attr_accessor :check_deposit_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
          # currency.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The identifier of the associated declined transaction.
          sig { returns(String) }
          attr_accessor :declined_transaction_id

          # Why the check deposit was rejected.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the check deposit was rejected.
          sig { returns(Time) }
          attr_accessor :rejected_at

          # A Check Deposit Rejection object. This field will be present in the JSON
          # response if and only if `category` is equal to `check_deposit_rejection`.
          sig do
            params(
              amount: Integer,
              check_deposit_id: String,
              currency:
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Currency::OrSymbol,
              declined_transaction_id: String,
              reason:
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::OrSymbol,
              rejected_at: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # The rejected amount in the minor unit of check's currency. For dollars, for
            # example, this is cents.
            amount:,
            # The identifier of the Check Deposit that was rejected.
            check_deposit_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
            # currency.
            currency:,
            # The identifier of the associated declined transaction.
            declined_transaction_id:,
            # Why the check deposit was rejected.
            reason:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            # the check deposit was rejected.
            rejected_at:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                check_deposit_id: String,
                currency:
                  Increase::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol,
                declined_transaction_id: String,
                reason:
                  Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol,
                rejected_at: Time
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
                  Increase::DeclinedTransaction::Source::CheckDepositRejection::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Why the check deposit was rejected.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The check's image is incomplete.
            INCOMPLETE_IMAGE =
              T.let(
                :incomplete_image,
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # This is a duplicate check submission.
            DUPLICATE =
              T.let(
                :duplicate,
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # This check has poor image quality.
            POOR_IMAGE_QUALITY =
              T.let(
                :poor_image_quality,
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # The check was deposited with the incorrect amount.
            INCORRECT_AMOUNT =
              T.let(
                :incorrect_amount,
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # The check is made out to someone other than the account holder.
            INCORRECT_RECIPIENT =
              T.let(
                :incorrect_recipient,
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # This check was not eligible for mobile deposit.
            NOT_ELIGIBLE_FOR_MOBILE_DEPOSIT =
              T.let(
                :not_eligible_for_mobile_deposit,
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # This check is missing at least one required field.
            MISSING_REQUIRED_DATA_ELEMENTS =
              T.let(
                :missing_required_data_elements,
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # This check is suspected to be fraudulent.
            SUSPECTED_FRAUD =
              T.let(
                :suspected_fraud,
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # This check's deposit window has expired.
            DEPOSIT_WINDOW_EXPIRED =
              T.let(
                :deposit_window_expired,
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # The check was rejected at the user's request.
            REQUESTED_BY_USER =
              T.let(
                :requested_by_user,
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # The check was rejected for an unknown reason.
            UNKNOWN =
              T.let(
                :unknown,
                Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class InboundFednowTransferDecline < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::DeclinedTransaction::Source::InboundFednowTransferDecline,
                Increase::Internal::AnyHash
              )
            end

          # Why the transfer was declined.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          # The identifier of the FedNow Transfer that led to this declined transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # An Inbound FedNow Transfer Decline object. This field will be present in the
          # JSON response if and only if `category` is equal to
          # `inbound_fednow_transfer_decline`.
          sig do
            params(
              reason:
                Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason::OrSymbol,
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
                  Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason::TaggedSymbol,
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
                T.all(
                  Symbol,
                  Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The account number is canceled.
            ACCOUNT_NUMBER_CANCELED =
              T.let(
                :account_number_canceled,
                Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason::TaggedSymbol
              )

            # The account number is disabled.
            ACCOUNT_NUMBER_DISABLED =
              T.let(
                :account_number_disabled,
                Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason::TaggedSymbol
              )

            # Your account is restricted.
            ACCOUNT_RESTRICTED =
              T.let(
                :account_restricted,
                Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason::TaggedSymbol
              )

            # Your account is inactive.
            GROUP_LOCKED =
              T.let(
                :group_locked,
                Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason::TaggedSymbol
              )

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE =
              T.let(
                :entity_not_active,
                Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason::TaggedSymbol
              )

            # Your account is not enabled to receive FedNow transfers.
            FEDNOW_NOT_ENABLED =
              T.let(
                :fednow_not_enabled,
                Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class InboundRealTimePaymentsTransferDecline < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline,
                Increase::Internal::AnyHash
              )
            end

          # The declined amount in the minor unit of the destination account currency. For
          # dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The name the sender of the transfer specified as the recipient of the transfer.
          sig { returns(String) }
          attr_accessor :creditor_name

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the declined
          # transfer's currency. This will always be "USD" for a Real-Time Payments
          # transfer.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol
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

          # Why the transfer was declined.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          # Additional information included with the transfer.
          sig { returns(T.nilable(String)) }
          attr_accessor :remittance_information

          # The Real-Time Payments network identification of the declined transfer.
          sig { returns(String) }
          attr_accessor :transaction_identification

          # The identifier of the Real-Time Payments Transfer that led to this Transaction.
          sig { returns(String) }
          attr_accessor :transfer_id

          # An Inbound Real-Time Payments Transfer Decline object. This field will be
          # present in the JSON response if and only if `category` is equal to
          # `inbound_real_time_payments_transfer_decline`.
          sig do
            params(
              amount: Integer,
              creditor_name: String,
              currency:
                Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::OrSymbol,
              debtor_account_number: String,
              debtor_name: String,
              debtor_routing_number: String,
              reason:
                Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::OrSymbol,
              remittance_information: T.nilable(String),
              transaction_identification: String,
              transfer_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The declined amount in the minor unit of the destination account currency. For
            # dollars, for example, this is cents.
            amount:,
            # The name the sender of the transfer specified as the recipient of the transfer.
            creditor_name:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the declined
            # transfer's currency. This will always be "USD" for a Real-Time Payments
            # transfer.
            currency:,
            # The account number of the account that sent the transfer.
            debtor_account_number:,
            # The name provided by the sender of the transfer.
            debtor_name:,
            # The routing number of the account that sent the transfer.
            debtor_routing_number:,
            # Why the transfer was declined.
            reason:,
            # Additional information included with the transfer.
            remittance_information:,
            # The Real-Time Payments network identification of the declined transfer.
            transaction_identification:,
            # The identifier of the Real-Time Payments Transfer that led to this Transaction.
            transfer_id:
          )
          end

          sig do
            override.returns(
              {
                amount: Integer,
                creditor_name: String,
                currency:
                  Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol,
                debtor_account_number: String,
                debtor_name: String,
                debtor_routing_number: String,
                reason:
                  Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol,
                remittance_information: T.nilable(String),
                transaction_identification: String,
                transfer_id: String
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the declined
          # transfer's currency. This will always be "USD" for a Real-Time Payments
          # transfer.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Why the transfer was declined.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The account number is canceled.
            ACCOUNT_NUMBER_CANCELED =
              T.let(
                :account_number_canceled,
                Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
              )

            # The account number is disabled.
            ACCOUNT_NUMBER_DISABLED =
              T.let(
                :account_number_disabled,
                Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
              )

            # Your account is restricted.
            ACCOUNT_RESTRICTED =
              T.let(
                :account_restricted,
                Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
              )

            # Your account is inactive.
            GROUP_LOCKED =
              T.let(
                :group_locked,
                Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
              )

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE =
              T.let(
                :entity_not_active,
                Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
              )

            # Your account is not enabled to receive Real-Time Payments transfers.
            REAL_TIME_PAYMENTS_NOT_ENABLED =
              T.let(
                :real_time_payments_not_enabled,
                Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Other < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::DeclinedTransaction::Source::Other,
                Increase::Internal::AnyHash
              )
            end

          # If the category of this Transaction source is equal to `other`, this field will
          # contain an empty object, otherwise it will contain null.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class WireDecline < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::DeclinedTransaction::Source::WireDecline,
                Increase::Internal::AnyHash
              )
            end

          # The identifier of the Inbound Wire Transfer that was declined.
          sig { returns(String) }
          attr_accessor :inbound_wire_transfer_id

          # Why the wire transfer was declined.
          sig do
            returns(
              Increase::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          # A Wire Decline object. This field will be present in the JSON response if and
          # only if `category` is equal to `wire_decline`.
          sig do
            params(
              inbound_wire_transfer_id: String,
              reason:
                Increase::DeclinedTransaction::Source::WireDecline::Reason::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The identifier of the Inbound Wire Transfer that was declined.
            inbound_wire_transfer_id:,
            # Why the wire transfer was declined.
            reason:
          )
          end

          sig do
            override.returns(
              {
                inbound_wire_transfer_id: String,
                reason:
                  Increase::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Why the wire transfer was declined.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::DeclinedTransaction::Source::WireDecline::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The account number is canceled.
            ACCOUNT_NUMBER_CANCELED =
              T.let(
                :account_number_canceled,
                Increase::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
              )

            # The account number is disabled.
            ACCOUNT_NUMBER_DISABLED =
              T.let(
                :account_number_disabled,
                Increase::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
              )

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE =
              T.let(
                :entity_not_active,
                Increase::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
              )

            # Your account is inactive.
            GROUP_LOCKED =
              T.let(
                :group_locked,
                Increase::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
              )

            # The beneficiary account number does not exist.
            NO_ACCOUNT_NUMBER =
              T.let(
                :no_account_number,
                Increase::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
              )

            # The transaction is not allowed per Increase's terms.
            TRANSACTION_NOT_ALLOWED =
              T.let(
                :transaction_not_allowed,
                Increase::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `declined_transaction`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::DeclinedTransaction::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DECLINED_TRANSACTION =
          T.let(
            :declined_transaction,
            Increase::DeclinedTransaction::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::DeclinedTransaction::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
