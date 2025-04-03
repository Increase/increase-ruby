# typed: strong

module Increase
  module Models
    class DeclinedTransaction < Increase::Internal::Type::BaseModel
      # The Declined Transaction identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the Account the Declined Transaction belongs to.
      sig { returns(String) }
      attr_accessor :account_id

      # The Declined Transaction amount in the minor unit of its currency. For dollars,
      #   for example, this is cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the
      #   Transaction occurred.
      sig { returns(Time) }
      attr_accessor :created_at

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Declined
      #   Transaction's currency. This will match the currency on the Declined
      #   Transaction's Account.
      sig { returns(Increase::Models::DeclinedTransaction::Currency::TaggedSymbol) }
      attr_accessor :currency

      # This is the description the vendor provides.
      sig { returns(String) }
      attr_accessor :description

      # The identifier for the route this Declined Transaction came through. Routes are
      #   things like cards and ACH details.
      sig { returns(T.nilable(String)) }
      attr_accessor :route_id

      # The type of the route this Declined Transaction came through.
      sig { returns(T.nilable(Increase::Models::DeclinedTransaction::RouteType::TaggedSymbol)) }
      attr_accessor :route_type

      # This is an object giving more details on the network-level event that caused the
      #   Declined Transaction. For example, for a card transaction this lists the
      #   merchant's industry and location. Note that for backwards compatibility reasons,
      #   additional undocumented keys may appear in this object. These should be treated
      #   as deprecated and will be removed in the future.
      sig { returns(Increase::Models::DeclinedTransaction::Source) }
      attr_reader :source

      sig { params(source: T.any(Increase::Models::DeclinedTransaction::Source, Increase::Internal::AnyHash)).void }
      attr_writer :source

      # A constant representing the object's type. For this resource it will always be
      #   `declined_transaction`.
      sig { returns(Increase::Models::DeclinedTransaction::Type::TaggedSymbol) }
      attr_accessor :type

      # Declined Transactions are refused additions and removals of money from your bank
      #   account. For example, Declined Transactions are caused when your Account has an
      #   insufficient balance or your Limits are triggered.
      sig do
        params(
          id: String,
          account_id: String,
          amount: Integer,
          created_at: Time,
          currency: Increase::Models::DeclinedTransaction::Currency::OrSymbol,
          description: String,
          route_id: T.nilable(String),
          route_type: T.nilable(Increase::Models::DeclinedTransaction::RouteType::OrSymbol),
          source: T.any(Increase::Models::DeclinedTransaction::Source, Increase::Internal::AnyHash),
          type: Increase::Models::DeclinedTransaction::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        account_id:,
        amount:,
        created_at:,
        currency:,
        description:,
        route_id:,
        route_type:,
        source:,
        type:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              account_id: String,
              amount: Integer,
              created_at: Time,
              currency: Increase::Models::DeclinedTransaction::Currency::TaggedSymbol,
              description: String,
              route_id: T.nilable(String),
              route_type: T.nilable(Increase::Models::DeclinedTransaction::RouteType::TaggedSymbol),
              source: Increase::Models::DeclinedTransaction::Source,
              type: Increase::Models::DeclinedTransaction::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Declined
      #   Transaction's currency. This will match the currency on the Declined
      #   Transaction's Account.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Currency) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransaction::Currency::TaggedSymbol) }

        # Canadian Dollar (CAD)
        CAD = T.let(:CAD, Increase::Models::DeclinedTransaction::Currency::TaggedSymbol)

        # Swiss Franc (CHF)
        CHF = T.let(:CHF, Increase::Models::DeclinedTransaction::Currency::TaggedSymbol)

        # Euro (EUR)
        EUR = T.let(:EUR, Increase::Models::DeclinedTransaction::Currency::TaggedSymbol)

        # British Pound (GBP)
        GBP = T.let(:GBP, Increase::Models::DeclinedTransaction::Currency::TaggedSymbol)

        # Japanese Yen (JPY)
        JPY = T.let(:JPY, Increase::Models::DeclinedTransaction::Currency::TaggedSymbol)

        # US Dollar (USD)
        USD = T.let(:USD, Increase::Models::DeclinedTransaction::Currency::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::DeclinedTransaction::Currency::TaggedSymbol]) }
        def self.values
        end
      end

      # The type of the route this Declined Transaction came through.
      module RouteType
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::RouteType) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransaction::RouteType::TaggedSymbol) }

        # An Account Number.
        ACCOUNT_NUMBER = T.let(:account_number, Increase::Models::DeclinedTransaction::RouteType::TaggedSymbol)

        # A Card.
        CARD = T.let(:card, Increase::Models::DeclinedTransaction::RouteType::TaggedSymbol)

        # A Lockbox.
        LOCKBOX = T.let(:lockbox, Increase::Models::DeclinedTransaction::RouteType::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::DeclinedTransaction::RouteType::TaggedSymbol]) }
        def self.values
        end
      end

      class Source < Increase::Internal::Type::BaseModel
        # An ACH Decline object. This field will be present in the JSON response if and
        #   only if `category` is equal to `ach_decline`.
        sig { returns(T.nilable(Increase::Models::DeclinedTransaction::Source::ACHDecline)) }
        attr_reader :ach_decline

        sig do
          params(
            ach_decline: T.nilable(T.any(Increase::Models::DeclinedTransaction::Source::ACHDecline, Increase::Internal::AnyHash))
          )
            .void
        end
        attr_writer :ach_decline

        # A Card Decline object. This field will be present in the JSON response if and
        #   only if `category` is equal to `card_decline`.
        sig { returns(T.nilable(Increase::Models::DeclinedTransaction::Source::CardDecline)) }
        attr_reader :card_decline

        sig do
          params(
            card_decline: T.nilable(T.any(Increase::Models::DeclinedTransaction::Source::CardDecline, Increase::Internal::AnyHash))
          )
            .void
        end
        attr_writer :card_decline

        # The type of the resource. We may add additional possible values for this enum
        #   over time; your application should be able to handle such additions gracefully.
        sig { returns(Increase::Models::DeclinedTransaction::Source::Category::TaggedSymbol) }
        attr_accessor :category

        # A Check Decline object. This field will be present in the JSON response if and
        #   only if `category` is equal to `check_decline`.
        sig { returns(T.nilable(Increase::Models::DeclinedTransaction::Source::CheckDecline)) }
        attr_reader :check_decline

        sig do
          params(
            check_decline: T.nilable(T.any(Increase::Models::DeclinedTransaction::Source::CheckDecline, Increase::Internal::AnyHash))
          )
            .void
        end
        attr_writer :check_decline

        # A Check Deposit Rejection object. This field will be present in the JSON
        #   response if and only if `category` is equal to `check_deposit_rejection`.
        sig { returns(T.nilable(Increase::Models::DeclinedTransaction::Source::CheckDepositRejection)) }
        attr_reader :check_deposit_rejection

        sig do
          params(
            check_deposit_rejection: T.nilable(
              T.any(Increase::Models::DeclinedTransaction::Source::CheckDepositRejection, Increase::Internal::AnyHash)
            )
          )
            .void
        end
        attr_writer :check_deposit_rejection

        # An Inbound Real-Time Payments Transfer Decline object. This field will be
        #   present in the JSON response if and only if `category` is equal to
        #   `inbound_real_time_payments_transfer_decline`.
        sig { returns(T.nilable(Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline)) }
        attr_reader :inbound_real_time_payments_transfer_decline

        sig do
          params(
            inbound_real_time_payments_transfer_decline: T.nilable(
              T.any(
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline,
                Increase::Internal::AnyHash
              )
            )
          )
            .void
        end
        attr_writer :inbound_real_time_payments_transfer_decline

        # If the category of this Transaction source is equal to `other`, this field will
        #   contain an empty object, otherwise it will contain null.
        sig { returns(T.nilable(T.anything)) }
        attr_accessor :other

        # A Wire Decline object. This field will be present in the JSON response if and
        #   only if `category` is equal to `wire_decline`.
        sig { returns(T.nilable(Increase::Models::DeclinedTransaction::Source::WireDecline)) }
        attr_reader :wire_decline

        sig do
          params(
            wire_decline: T.nilable(T.any(Increase::Models::DeclinedTransaction::Source::WireDecline, Increase::Internal::AnyHash))
          )
            .void
        end
        attr_writer :wire_decline

        # This is an object giving more details on the network-level event that caused the
        #   Declined Transaction. For example, for a card transaction this lists the
        #   merchant's industry and location. Note that for backwards compatibility reasons,
        #   additional undocumented keys may appear in this object. These should be treated
        #   as deprecated and will be removed in the future.
        sig do
          params(
            ach_decline: T.nilable(T.any(Increase::Models::DeclinedTransaction::Source::ACHDecline, Increase::Internal::AnyHash)),
            card_decline: T.nilable(T.any(Increase::Models::DeclinedTransaction::Source::CardDecline, Increase::Internal::AnyHash)),
            category: Increase::Models::DeclinedTransaction::Source::Category::OrSymbol,
            check_decline: T.nilable(T.any(Increase::Models::DeclinedTransaction::Source::CheckDecline, Increase::Internal::AnyHash)),
            check_deposit_rejection: T.nilable(
              T.any(Increase::Models::DeclinedTransaction::Source::CheckDepositRejection, Increase::Internal::AnyHash)
            ),
            inbound_real_time_payments_transfer_decline: T.nilable(
              T.any(
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline,
                Increase::Internal::AnyHash
              )
            ),
            other: T.nilable(T.anything),
            wire_decline: T.nilable(T.any(Increase::Models::DeclinedTransaction::Source::WireDecline, Increase::Internal::AnyHash))
          )
            .returns(T.attached_class)
        end
        def self.new(
          ach_decline:,
          card_decline:,
          category:,
          check_decline:,
          check_deposit_rejection:,
          inbound_real_time_payments_transfer_decline:,
          other:,
          wire_decline:
        )
        end

        sig do
          override
            .returns(
              {
                ach_decline: T.nilable(Increase::Models::DeclinedTransaction::Source::ACHDecline),
                card_decline: T.nilable(Increase::Models::DeclinedTransaction::Source::CardDecline),
                category: Increase::Models::DeclinedTransaction::Source::Category::TaggedSymbol,
                check_decline: T.nilable(Increase::Models::DeclinedTransaction::Source::CheckDecline),
                check_deposit_rejection: T.nilable(Increase::Models::DeclinedTransaction::Source::CheckDepositRejection),
                inbound_real_time_payments_transfer_decline: T.nilable(Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline),
                other: T.nilable(T.anything),
                wire_decline: T.nilable(Increase::Models::DeclinedTransaction::Source::WireDecline)
              }
            )
        end
        def to_hash
        end

        class ACHDecline < Increase::Internal::Type::BaseModel
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
          sig { returns(Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol) }
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
          #   `ach_decline`.
          sig { returns(Increase::Models::DeclinedTransaction::Source::ACHDecline::Type::TaggedSymbol) }
          attr_accessor :type

          # An ACH Decline object. This field will be present in the JSON response if and
          #   only if `category` is equal to `ach_decline`.
          sig do
            params(
              id: String,
              amount: Integer,
              inbound_ach_transfer_id: String,
              originator_company_descriptive_date: T.nilable(String),
              originator_company_discretionary_data: T.nilable(String),
              originator_company_id: String,
              originator_company_name: String,
              reason: Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::OrSymbol,
              receiver_id_number: T.nilable(String),
              receiver_name: T.nilable(String),
              trace_number: String,
              type: Increase::Models::DeclinedTransaction::Source::ACHDecline::Type::OrSymbol
            )
              .returns(T.attached_class)
          end
          def self.new(
            id:,
            amount:,
            inbound_ach_transfer_id:,
            originator_company_descriptive_date:,
            originator_company_discretionary_data:,
            originator_company_id:,
            originator_company_name:,
            reason:,
            receiver_id_number:,
            receiver_name:,
            trace_number:,
            type:
          )
          end

          sig do
            override
              .returns(
                {
                  id: String,
                  amount: Integer,
                  inbound_ach_transfer_id: String,
                  originator_company_descriptive_date: T.nilable(String),
                  originator_company_discretionary_data: T.nilable(String),
                  originator_company_id: String,
                  originator_company_name: String,
                  reason: Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol,
                  receiver_id_number: T.nilable(String),
                  receiver_name: T.nilable(String),
                  trace_number: String,
                  type: Increase::Models::DeclinedTransaction::Source::ACHDecline::Type::TaggedSymbol
                }
              )
          end
          def to_hash
          end

          # Why the ACH transfer was declined.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol) }

            # The account number is canceled.
            ACH_ROUTE_CANCELED =
              T.let(
                :ach_route_canceled,
                Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The account number is disabled.
            ACH_ROUTE_DISABLED =
              T.let(
                :ach_route_disabled,
                Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The transaction would cause an Increase limit to be exceeded.
            BREACHES_LIMIT =
              T.let(:breaches_limit, Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol)

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE =
              T.let(:entity_not_active, Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol)

            # Your account is inactive.
            GROUP_LOCKED =
              T.let(:group_locked, Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol)

            # The transaction is not allowed per Increase's terms.
            TRANSACTION_NOT_ALLOWED =
              T.let(
                :transaction_not_allowed,
                Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # Your integration declined this transfer via the API.
            USER_INITIATED =
              T.let(:user_initiated, Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol)

            # Your account contains insufficient funds.
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The originating financial institution asked for this transfer to be returned. The receiving bank is complying with the request.
            RETURNED_PER_ODFI_REQUEST =
              T.let(
                :returned_per_odfi_request,
                Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The customer no longer authorizes this transaction.
            AUTHORIZATION_REVOKED_BY_CUSTOMER =
              T.let(
                :authorization_revoked_by_customer,
                Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The customer asked for the payment to be stopped.
            PAYMENT_STOPPED =
              T.let(:payment_stopped, Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol)

            # The customer advises that the debit was unauthorized.
            CUSTOMER_ADVISED_UNAUTHORIZED_IMPROPER_INELIGIBLE_OR_INCOMPLETE =
              T.let(
                :customer_advised_unauthorized_improper_ineligible_or_incomplete,
                Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The payee is deceased.
            REPRESENTATIVE_PAYEE_DECEASED_OR_UNABLE_TO_CONTINUE_IN_THAT_CAPACITY =
              T.let(
                :representative_payee_deceased_or_unable_to_continue_in_that_capacity,
                Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The account holder is deceased.
            BENEFICIARY_OR_ACCOUNT_HOLDER_DECEASED =
              T.let(
                :beneficiary_or_account_holder_deceased,
                Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The customer refused a credit entry.
            CREDIT_ENTRY_REFUSED_BY_RECEIVER =
              T.let(
                :credit_entry_refused_by_receiver,
                Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            # The account holder identified this transaction as a duplicate.
            DUPLICATE_ENTRY =
              T.let(:duplicate_entry, Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol)

            # The corporate customer no longer authorizes this transaction.
            CORPORATE_CUSTOMER_ADVISED_NOT_AUTHORIZED =
              T.let(
                :corporate_customer_advised_not_authorized,
                Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol
              )

            sig do
              override.returns(T::Array[Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason::TaggedSymbol])
            end
            def self.values
            end
          end

          # A constant representing the object's type. For this resource it will always be
          #   `ach_decline`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::ACHDecline::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransaction::Source::ACHDecline::Type::TaggedSymbol) }

            ACH_DECLINE =
              T.let(:ach_decline, Increase::Models::DeclinedTransaction::Source::ACHDecline::Type::TaggedSymbol)

            sig { override.returns(T::Array[Increase::Models::DeclinedTransaction::Source::ACHDecline::Type::TaggedSymbol]) }
            def self.values
            end
          end
        end

        class CardDecline < Increase::Internal::Type::BaseModel
          # The Card Decline identifier.
          sig { returns(String) }
          attr_accessor :id

          # Whether this authorization was approved by Increase, the card network through
          #   stand-in processing, or the user through a real-time decision.
          sig { returns(Increase::Models::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol) }
          attr_accessor :actioner

          # The declined amount in the minor unit of the destination account currency. For
          #   dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          #   account currency.
          sig { returns(Increase::Models::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol) }
          attr_accessor :currency

          # The identifier of the declined transaction created for this Card Decline.
          sig { returns(String) }
          attr_accessor :declined_transaction_id

          # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          #   purchase), the identifier of the token that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :digital_wallet_token_id

          # The direction describes the direction the funds will move, either from the
          #   cardholder to the merchant or from the merchant to the cardholder.
          sig { returns(Increase::Models::DeclinedTransaction::Source::CardDecline::Direction::TaggedSymbol) }
          attr_accessor :direction

          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          #   is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_acceptor_id

          # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
          #   card is transacting with.
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
          #   ZIP code, where the first 5 and last 4 are separated by a dash.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_postal_code

          # The state the merchant resides in.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_state

          # Fields specific to the `network`.
          sig { returns(Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails) }
          attr_reader :network_details

          sig do
            params(
              network_details: T.any(
                Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails,
                Increase::Internal::AnyHash
              )
            )
              .void
          end
          attr_writer :network_details

          # Network-specific identifiers for a specific request or transaction.
          sig { returns(Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers) }
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers: T.any(
                Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers,
                Increase::Internal::AnyHash
              )
            )
              .void
          end
          attr_writer :network_identifiers

          # The risk score generated by the card network. For Visa this is the Visa Advanced
          #   Authorization risk score, from 0 to 99, where 99 is the riskiest.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :network_risk_score

          # If the authorization was made in-person with a physical card, the Physical Card
          #   that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :physical_card_id

          # The declined amount in the minor unit of the transaction's presentment currency.
          sig { returns(Integer) }
          attr_accessor :presentment_amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's presentment currency.
          sig { returns(String) }
          attr_accessor :presentment_currency

          # The processing category describes the intent behind the authorization, such as
          #   whether it was used for bill payments or an automatic fuel dispenser.
          sig { returns(Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol) }
          attr_accessor :processing_category

          # The identifier of the Real-Time Decision sent to approve or decline this
          #   transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :real_time_decision_id

          # This is present if a specific decline reason was given in the real-time
          #   decision.
          sig do
            returns(
              T.nilable(
                Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )
            )
          end
          attr_accessor :real_time_decision_reason

          # Why the transaction was declined.
          sig { returns(Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol) }
          attr_accessor :reason

          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          #   is transacting with.
          sig { returns(T.nilable(String)) }
          attr_accessor :terminal_id

          # Fields related to verification of cardholder-provided values.
          sig { returns(Increase::Models::DeclinedTransaction::Source::CardDecline::Verification) }
          attr_reader :verification

          sig do
            params(
              verification: T.any(
                Increase::Models::DeclinedTransaction::Source::CardDecline::Verification,
                Increase::Internal::AnyHash
              )
            )
              .void
          end
          attr_writer :verification

          # A Card Decline object. This field will be present in the JSON response if and
          #   only if `category` is equal to `card_decline`.
          sig do
            params(
              id: String,
              actioner: Increase::Models::DeclinedTransaction::Source::CardDecline::Actioner::OrSymbol,
              amount: Integer,
              card_payment_id: String,
              currency: Increase::Models::DeclinedTransaction::Source::CardDecline::Currency::OrSymbol,
              declined_transaction_id: String,
              digital_wallet_token_id: T.nilable(String),
              direction: Increase::Models::DeclinedTransaction::Source::CardDecline::Direction::OrSymbol,
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: T.nilable(String),
              merchant_country: String,
              merchant_descriptor: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_details: T.any(
                Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails,
                Increase::Internal::AnyHash
              ),
              network_identifiers: T.any(
                Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers,
                Increase::Internal::AnyHash
              ),
              network_risk_score: T.nilable(Integer),
              physical_card_id: T.nilable(String),
              presentment_amount: Integer,
              presentment_currency: String,
              processing_category: Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory::OrSymbol,
              real_time_decision_id: T.nilable(String),
              real_time_decision_reason: T.nilable(Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::OrSymbol),
              reason: Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::OrSymbol,
              terminal_id: T.nilable(String),
              verification: T.any(
                Increase::Models::DeclinedTransaction::Source::CardDecline::Verification,
                Increase::Internal::AnyHash
              )
            )
              .returns(T.attached_class)
          end
          def self.new(
            id:,
            actioner:,
            amount:,
            card_payment_id:,
            currency:,
            declined_transaction_id:,
            digital_wallet_token_id:,
            direction:,
            merchant_acceptor_id:,
            merchant_category_code:,
            merchant_city:,
            merchant_country:,
            merchant_descriptor:,
            merchant_postal_code:,
            merchant_state:,
            network_details:,
            network_identifiers:,
            network_risk_score:,
            physical_card_id:,
            presentment_amount:,
            presentment_currency:,
            processing_category:,
            real_time_decision_id:,
            real_time_decision_reason:,
            reason:,
            terminal_id:,
            verification:
          )
          end

          sig do
            override
              .returns(
                {
                  id: String,
                  actioner: Increase::Models::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol,
                  amount: Integer,
                  card_payment_id: String,
                  currency: Increase::Models::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol,
                  declined_transaction_id: String,
                  digital_wallet_token_id: T.nilable(String),
                  direction: Increase::Models::DeclinedTransaction::Source::CardDecline::Direction::TaggedSymbol,
                  merchant_acceptor_id: String,
                  merchant_category_code: String,
                  merchant_city: T.nilable(String),
                  merchant_country: String,
                  merchant_descriptor: String,
                  merchant_postal_code: T.nilable(String),
                  merchant_state: T.nilable(String),
                  network_details: Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails,
                  network_identifiers: Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers,
                  network_risk_score: T.nilable(Integer),
                  physical_card_id: T.nilable(String),
                  presentment_amount: Integer,
                  presentment_currency: String,
                  processing_category: Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol,
                  real_time_decision_id: T.nilable(String),
                  real_time_decision_reason: T.nilable(
                    Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
                  ),
                  reason: Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol,
                  terminal_id: T.nilable(String),
                  verification: Increase::Models::DeclinedTransaction::Source::CardDecline::Verification
                }
              )
          end
          def to_hash
          end

          # Whether this authorization was approved by Increase, the card network through
          #   stand-in processing, or the user through a real-time decision.
          module Actioner
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Actioner) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol) }

            # This object was actioned by the user through a real-time decision.
            USER = T.let(:user, Increase::Models::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol)

            # This object was actioned by Increase without user intervention.
            INCREASE =
              T.let(:increase, Increase::Models::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol)

            # This object was actioned by the network, through stand-in processing.
            NETWORK =
              T.let(:network, Increase::Models::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol)

            sig do
              override
                .returns(T::Array[Increase::Models::DeclinedTransaction::Source::CardDecline::Actioner::TaggedSymbol])
            end
            def self.values
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          #   account currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Currency) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol) }

            # Canadian Dollar (CAD)
            CAD = T.let(:CAD, Increase::Models::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol)

            # Swiss Franc (CHF)
            CHF = T.let(:CHF, Increase::Models::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol)

            # Euro (EUR)
            EUR = T.let(:EUR, Increase::Models::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol)

            # British Pound (GBP)
            GBP = T.let(:GBP, Increase::Models::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol)

            # Japanese Yen (JPY)
            JPY = T.let(:JPY, Increase::Models::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol)

            # US Dollar (USD)
            USD = T.let(:USD, Increase::Models::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol)

            sig do
              override
                .returns(T::Array[Increase::Models::DeclinedTransaction::Source::CardDecline::Currency::TaggedSymbol])
            end
            def self.values
            end
          end

          # The direction describes the direction the funds will move, either from the
          #   cardholder to the merchant or from the merchant to the cardholder.
          module Direction
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Direction) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransaction::Source::CardDecline::Direction::TaggedSymbol) }

            # A regular card authorization where funds are debited from the cardholder.
            SETTLEMENT =
              T.let(:settlement, Increase::Models::DeclinedTransaction::Source::CardDecline::Direction::TaggedSymbol)

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(:refund, Increase::Models::DeclinedTransaction::Source::CardDecline::Direction::TaggedSymbol)

            sig do
              override
                .returns(T::Array[Increase::Models::DeclinedTransaction::Source::CardDecline::Direction::TaggedSymbol])
            end
            def self.values
            end
          end

          class NetworkDetails < Increase::Internal::Type::BaseModel
            # The payment network used to process this card authorization.
            sig do
              returns(
                Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category::TaggedSymbol
              )
            end
            attr_accessor :category

            # Fields specific to the `visa` network.
            sig { returns(T.nilable(Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa)) }
            attr_reader :visa

            sig do
              params(
                visa: T.nilable(
                  T.any(
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa,
                    Increase::Internal::AnyHash
                  )
                )
              )
                .void
            end
            attr_writer :visa

            # Fields specific to the `network`.
            sig do
              params(
                category: Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category::OrSymbol,
                visa: T.nilable(
                  T.any(
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa,
                    Increase::Internal::AnyHash
                  )
                )
              )
                .returns(T.attached_class)
            end
            def self.new(category:, visa:)
            end

            sig do
              override
                .returns(
                  {
                    category: Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category::TaggedSymbol,
                    visa: T.nilable(Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa)
                  }
                )
            end
            def to_hash
            end

            # The payment network used to process this card authorization.
            module Category
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category) }
              OrSymbol =
                T.type_alias do
                  T.any(
                    Symbol,
                    String,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category::TaggedSymbol
                  )
                end

              # Visa
              VISA =
                T.let(
                  :visa,
                  Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category::TaggedSymbol
                )

              sig do
                override
                  .returns(
                    T::Array[Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category::TaggedSymbol]
                  )
              end
              def self.values
              end
            end

            class Visa < Increase::Internal::Type::BaseModel
              # For electronic commerce transactions, this identifies the level of security used
              #   in obtaining the customer's payment credential. For mail or telephone order
              #   transactions, identifies the type of mail or telephone order.
              sig do
                returns(
                  T.nilable(
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :electronic_commerce_indicator

              # The method used to enter the cardholder's primary account number and card
              #   expiration date.
              sig do
                returns(
                  T.nilable(
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )
                )
              end
              attr_accessor :point_of_service_entry_mode

              # Only present when `actioner: network`. Describes why a card authorization was
              #   approved or declined by Visa through stand-in processing.
              sig do
                returns(
                  T.nilable(
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )
                )
              end
              attr_accessor :stand_in_processing_reason

              # Fields specific to the `visa` network.
              sig do
                params(
                  electronic_commerce_indicator: T.nilable(
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::OrSymbol
                  ),
                  point_of_service_entry_mode: T.nilable(
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::OrSymbol
                  ),
                  stand_in_processing_reason: T.nilable(
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
                  )
                )
                  .returns(T.attached_class)
              end
              def self.new(
                electronic_commerce_indicator:,
                point_of_service_entry_mode:,
                stand_in_processing_reason:
              )
              end

              sig do
                override
                  .returns(
                    {
                      electronic_commerce_indicator: T.nilable(
                        Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                      ),
                      point_of_service_entry_mode: T.nilable(
                        Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                      ),
                      stand_in_processing_reason: T.nilable(
                        Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                      )
                    }
                  )
              end
              def to_hash
              end

              # For electronic commerce transactions, this identifies the level of security used
              #   in obtaining the customer's payment credential. For mail or telephone order
              #   transactions, identifies the type of mail or telephone order.
              module ElectronicCommerceIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator)
                  end
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                    )
                  end

                # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
                MAIL_PHONE_ORDER =
                  T.let(
                    :mail_phone_order,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
                RECURRING =
                  T.let(
                    :recurring,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
                INSTALLMENT =
                  T.let(
                    :installment,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
                UNKNOWN_MAIL_PHONE_ORDER =
                  T.let(
                    :unknown_mail_phone_order,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
                SECURE_ELECTRONIC_COMMERCE =
                  T.let(
                    :secure_electronic_commerce,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
                NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                  T.let(
                    :non_authenticated_security_transaction_at_3ds_capable_merchant,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however , cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION =
                  T.let(
                    :non_authenticated_security_transaction,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION =
                  T.let(
                    :non_secure_transaction,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                sig do
                  override
                    .returns(
                      T::Array[
                      Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                      ]
                    )
                end
                def self.values
                end
              end

              # The method used to enter the cardholder's primary account number and card
              #   expiration date.
              module PointOfServiceEntryMode
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode)
                  end
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                    )
                  end

                # Unknown
                UNKNOWN =
                  T.let(
                    :unknown,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Manual key entry
                MANUAL =
                  T.let(
                    :manual,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read, without card verification value
                MAGNETIC_STRIPE_NO_CVV =
                  T.let(
                    :magnetic_stripe_no_cvv,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Optical code
                OPTICAL_CODE =
                  T.let(
                    :optical_code,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card
                INTEGRATED_CIRCUIT_CARD =
                  T.let(
                    :integrated_circuit_card,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of chip card
                CONTACTLESS =
                  T.let(
                    :contactless,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Transaction initiated using a credential that has previously been stored on file
                CREDENTIAL_ON_FILE =
                  T.let(
                    :credential_on_file,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read
                MAGNETIC_STRIPE =
                  T.let(
                    :magnetic_stripe,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of magnetic stripe data
                CONTACTLESS_MAGNETIC_STRIPE =
                  T.let(
                    :contactless_magnetic_stripe,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card, without card verification value
                INTEGRATED_CIRCUIT_CARD_NO_CVV =
                  T.let(
                    :integrated_circuit_card_no_cvv,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                sig do
                  override
                    .returns(
                      T::Array[
                      Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                      ]
                    )
                end
                def self.values
                end
              end

              # Only present when `actioner: network`. Describes why a card authorization was
              #   approved or declined by Visa through stand-in processing.
              module StandInProcessingReason
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason)
                  end
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                    )
                  end

                # Increase failed to process the authorization in a timely manner.
                ISSUER_ERROR =
                  T.let(
                    :issuer_error,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
                INVALID_PHYSICAL_CARD =
                  T.let(
                    :invalid_physical_card,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The 3DS cardholder authentication verification value was invalid.
                INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                  T.let(
                    :invalid_cardholder_authentication_verification_value,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
                INTERNAL_VISA_ERROR =
                  T.let(
                    :internal_visa_error,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
                MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                  T.let(
                    :merchant_transaction_advisory_service_authentication_required,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
                PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK =
                  T.let(
                    :payment_fraud_disruption_acquirer_block,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An unspecific reason for stand-in processing.
                OTHER =
                  T.let(
                    :other,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                sig do
                  override
                    .returns(
                      T::Array[
                      Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                      ]
                    )
                end
                def self.values
                end
              end
            end
          end

          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            # A life-cycle identifier used across e.g., an authorization and a reversal.
            #   Expected to be unique per acquirer within a window of time. For some card
            #   networks the retrieval reference number includes the trace counter.
            sig { returns(T.nilable(String)) }
            attr_accessor :retrieval_reference_number

            # A counter used to verify an individual authorization. Expected to be unique per
            #   acquirer within a window of time.
            sig { returns(T.nilable(String)) }
            attr_accessor :trace_number

            # A globally unique transaction identifier provided by the card network, used
            #   across multiple life-cycle requests.
            sig { returns(T.nilable(String)) }
            attr_accessor :transaction_id

            # Network-specific identifiers for a specific request or transaction.
            sig do
              params(
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              )
                .returns(T.attached_class)
            end
            def self.new(retrieval_reference_number:, trace_number:, transaction_id:)
            end

            sig do
              override
                .returns(
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
          #   whether it was used for bill payments or an automatic fuel dispenser.
          module ProcessingCategory
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory) }
            OrSymbol =
              T.type_alias do
                T.any(
                  Symbol,
                  String,
                  Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
                )
              end

            # Account funding transactions are transactions used to e.g., fund an account or transfer funds between accounts.
            ACCOUNT_FUNDING =
              T.let(
                :account_funding,
                Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # Automatic fuel dispenser authorizations occur when a card is used at a gas pump, prior to the actual transaction amount being known. They are followed by an advice message that updates the amount of the pending transaction.
            AUTOMATIC_FUEL_DISPENSER =
              T.let(
                :automatic_fuel_dispenser,
                Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # A transaction used to pay a bill.
            BILL_PAYMENT =
              T.let(
                :bill_payment,
                Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # A regular purchase.
            PURCHASE =
              T.let(
                :purchase,
                Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # Quasi-cash transactions represent purchases of items which may be convertible to cash.
            QUASI_CASH =
              T.let(
                :quasi_cash,
                Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol
              )

            sig do
              override
                .returns(
                  T::Array[Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory::TaggedSymbol]
                )
            end
            def self.values
            end
          end

          # This is present if a specific decline reason was given in the real-time
          #   decision.
          module RealTimeDecisionReason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason) }
            OrSymbol =
              T.type_alias do
                T.any(
                  Symbol,
                  String,
                  Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
                )
              end

            # The cardholder does not have sufficient funds to cover the transaction. The merchant may attempt to process the transaction again.
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # This type of transaction is not allowed for this card. This transaction should not be retried.
            TRANSACTION_NEVER_ALLOWED =
              T.let(
                :transaction_never_allowed,
                Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # The transaction amount exceeds the cardholder's approval limit. The merchant may attempt to process the transaction again.
            EXCEEDS_APPROVAL_LIMIT =
              T.let(
                :exceeds_approval_limit,
                Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # The card has been temporarily disabled or not yet activated. The merchant may attempt to process the transaction again.
            CARD_TEMPORARILY_DISABLED =
              T.let(
                :card_temporarily_disabled,
                Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # The transaction is suspected to be fraudulent. The merchant may attempt to process the transaction again.
            SUSPECTED_FRAUD =
              T.let(
                :suspected_fraud,
                Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # The transaction was declined for another reason. The merchant may attempt to process the transaction again. This should be used sparingly.
            OTHER =
              T.let(
                :other,
                Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            sig do
              override
                .returns(
                  T::Array[Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason::TaggedSymbol]
                )
            end
            def self.values
            end
          end

          # Why the transaction was declined.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Reason) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol) }

            # The account has been closed.
            ACCOUNT_CLOSED =
              T.let(:account_closed, Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol)

            # The Card was not active.
            CARD_NOT_ACTIVE =
              T.let(:card_not_active, Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol)

            # The Card has been canceled.
            CARD_CANCELED =
              T.let(:card_canceled, Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol)

            # The Physical Card was not active.
            PHYSICAL_CARD_NOT_ACTIVE =
              T.let(
                :physical_card_not_active,
                Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The account's entity was not active.
            ENTITY_NOT_ACTIVE =
              T.let(
                :entity_not_active,
                Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The account was inactive.
            GROUP_LOCKED =
              T.let(:group_locked, Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol)

            # The Card's Account did not have a sufficient available balance.
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The given CVV2 did not match the card's value.
            CVV2_MISMATCH =
              T.let(:cvv2_mismatch, Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol)

            # The given expiration date did not match the card's value. Only applies when a CVV2 is present.
            CARD_EXPIRATION_MISMATCH =
              T.let(
                :card_expiration_mismatch,
                Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The attempted card transaction is not allowed per Increase's terms.
            TRANSACTION_NOT_ALLOWED =
              T.let(
                :transaction_not_allowed,
                Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The transaction was blocked by a Limit.
            BREACHES_LIMIT =
              T.let(:breaches_limit, Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol)

            # Your application declined the transaction via webhook.
            WEBHOOK_DECLINED =
              T.let(:webhook_declined, Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol)

            # Your application webhook did not respond without the required timeout.
            WEBHOOK_TIMED_OUT =
              T.let(
                :webhook_timed_out,
                Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # Declined by stand-in processing.
            DECLINED_BY_STAND_IN_PROCESSING =
              T.let(
                :declined_by_stand_in_processing,
                Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The card read had an invalid CVV, dCVV, or authorization request cryptogram.
            INVALID_PHYSICAL_CARD =
              T.let(
                :invalid_physical_card,
                Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The original card authorization for this incremental authorization does not exist.
            MISSING_ORIGINAL_AUTHORIZATION =
              T.let(
                :missing_original_authorization,
                Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol
              )

            # The transaction was suspected to be fraudulent. Please reach out to support@increase.com for more information.
            SUSPECTED_FRAUD =
              T.let(:suspected_fraud, Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol)

            sig do
              override
                .returns(T::Array[Increase::Models::DeclinedTransaction::Source::CardDecline::Reason::TaggedSymbol])
            end
            def self.values
            end
          end

          class Verification < Increase::Internal::Type::BaseModel
            # Fields related to verification of the Card Verification Code, a 3-digit code on
            #   the back of the card.
            sig { returns(Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode) }
            attr_reader :card_verification_code

            sig do
              params(
                card_verification_code: T.any(
                  Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :card_verification_code

            # Cardholder address provided in the authorization request and the address on file
            #   we verified it against.
            sig { returns(Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress) }
            attr_reader :cardholder_address

            sig do
              params(
                cardholder_address: T.any(
                  Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress,
                  Increase::Internal::AnyHash
                )
              )
                .void
            end
            attr_writer :cardholder_address

            # Fields related to verification of cardholder-provided values.
            sig do
              params(
                card_verification_code: T.any(
                  Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode,
                  Increase::Internal::AnyHash
                ),
                cardholder_address: T.any(
                  Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress,
                  Increase::Internal::AnyHash
                )
              )
                .returns(T.attached_class)
            end
            def self.new(card_verification_code:, cardholder_address:)
            end

            sig do
              override
                .returns(
                  {
                    card_verification_code: Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode,
                    cardholder_address: Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress
                  }
                )
            end
            def to_hash
            end

            class CardVerificationCode < Increase::Internal::Type::BaseModel
              # The result of verifying the Card Verification Code.
              sig do
                returns(
                  Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                )
              end
              attr_accessor :result

              # Fields related to verification of the Card Verification Code, a 3-digit code on
              #   the back of the card.
              sig do
                params(
                  result: Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::OrSymbol
                )
                  .returns(T.attached_class)
              end
              def self.new(result:)
              end

              sig do
                override
                  .returns(
                    {
                      result: Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
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
                    T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result)
                  end
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                    )
                  end

                # No card verification code was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code matched the one on file.
                MATCH =
                  T.let(
                    :match,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code did not match the one on file.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                sig do
                  override
                    .returns(
                      T::Array[
                      Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                      ]
                    )
                end
                def self.values
                end
              end
            end

            class CardholderAddress < Increase::Internal::Type::BaseModel
              # Line 1 of the address on file for the cardholder.
              sig { returns(T.nilable(String)) }
              attr_accessor :actual_line1

              # The postal code of the address on file for the cardholder.
              sig { returns(T.nilable(String)) }
              attr_accessor :actual_postal_code

              # The cardholder address line 1 provided for verification in the authorization
              #   request.
              sig { returns(T.nilable(String)) }
              attr_accessor :provided_line1

              # The postal code provided for verification in the authorization request.
              sig { returns(T.nilable(String)) }
              attr_accessor :provided_postal_code

              # The address verification result returned to the card network.
              sig do
                returns(
                  Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                )
              end
              attr_accessor :result

              # Cardholder address provided in the authorization request and the address on file
              #   we verified it against.
              sig do
                params(
                  actual_line1: T.nilable(String),
                  actual_postal_code: T.nilable(String),
                  provided_line1: T.nilable(String),
                  provided_postal_code: T.nilable(String),
                  result: Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::OrSymbol
                )
                  .returns(T.attached_class)
              end
              def self.new(
                actual_line1:,
                actual_postal_code:,
                provided_line1:,
                provided_postal_code:,
                result:
              )
              end

              sig do
                override
                  .returns(
                    {
                      actual_line1: T.nilable(String),
                      actual_postal_code: T.nilable(String),
                      provided_line1: T.nilable(String),
                      provided_postal_code: T.nilable(String),
                      result: Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
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
                    T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result)
                  end
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                    )
                  end

                # No adress was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address was not verified.
                POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED =
                  T.let(
                    :postal_code_match_address_not_checked,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address does not match.
                POSTAL_CODE_MATCH_ADDRESS_NO_MATCH =
                  T.let(
                    :postal_code_match_address_no_match,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code does not match, but the street address matches.
                POSTAL_CODE_NO_MATCH_ADDRESS_MATCH =
                  T.let(
                    :postal_code_no_match_address_match,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address match.
                MATCH =
                  T.let(
                    :match,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address do not match.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                sig do
                  override
                    .returns(
                      T::Array[
                      Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                      ]
                    )
                end
                def self.values
                end
              end
            end
          end
        end

        # The type of the resource. We may add additional possible values for this enum
        #   over time; your application should be able to handle such additions gracefully.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::Category) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransaction::Source::Category::TaggedSymbol) }

          # ACH Decline: details will be under the `ach_decline` object.
          ACH_DECLINE = T.let(:ach_decline, Increase::Models::DeclinedTransaction::Source::Category::TaggedSymbol)

          # Card Decline: details will be under the `card_decline` object.
          CARD_DECLINE =
            T.let(:card_decline, Increase::Models::DeclinedTransaction::Source::Category::TaggedSymbol)

          # Check Decline: details will be under the `check_decline` object.
          CHECK_DECLINE =
            T.let(:check_decline, Increase::Models::DeclinedTransaction::Source::Category::TaggedSymbol)

          # Inbound Real-Time Payments Transfer Decline: details will be under the `inbound_real_time_payments_transfer_decline` object.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_DECLINE =
            T.let(
              :inbound_real_time_payments_transfer_decline,
              Increase::Models::DeclinedTransaction::Source::Category::TaggedSymbol
            )

          # Wire Decline: details will be under the `wire_decline` object.
          WIRE_DECLINE =
            T.let(:wire_decline, Increase::Models::DeclinedTransaction::Source::Category::TaggedSymbol)

          # Check Deposit Rejection: details will be under the `check_deposit_rejection` object.
          CHECK_DEPOSIT_REJECTION =
            T.let(:check_deposit_rejection, Increase::Models::DeclinedTransaction::Source::Category::TaggedSymbol)

          # The Declined Transaction was made for an undocumented or deprecated reason.
          OTHER = T.let(:other, Increase::Models::DeclinedTransaction::Source::Category::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::DeclinedTransaction::Source::Category::TaggedSymbol]) }
          def self.values
          end
        end

        class CheckDecline < Increase::Internal::Type::BaseModel
          # The declined amount in USD cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # A computer-readable number printed on the MICR line of business checks, usually
          #   the check number. This is useful for positive pay checks, but can be unreliably
          #   transmitted by the bank of first deposit.
          sig { returns(T.nilable(String)) }
          attr_accessor :auxiliary_on_us

          # The identifier of the API File object containing an image of the back of the
          #   declined check.
          sig { returns(T.nilable(String)) }
          attr_accessor :back_image_file_id

          # The identifier of the Check Transfer object associated with this decline.
          sig { returns(T.nilable(String)) }
          attr_accessor :check_transfer_id

          # The identifier of the API File object containing an image of the front of the
          #   declined check.
          sig { returns(T.nilable(String)) }
          attr_accessor :front_image_file_id

          # The identifier of the Inbound Check Deposit object associated with this decline.
          sig { returns(T.nilable(String)) }
          attr_accessor :inbound_check_deposit_id

          # Why the check was declined.
          sig { returns(Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol) }
          attr_accessor :reason

          # A Check Decline object. This field will be present in the JSON response if and
          #   only if `category` is equal to `check_decline`.
          sig do
            params(
              amount: Integer,
              auxiliary_on_us: T.nilable(String),
              back_image_file_id: T.nilable(String),
              check_transfer_id: T.nilable(String),
              front_image_file_id: T.nilable(String),
              inbound_check_deposit_id: T.nilable(String),
              reason: Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::OrSymbol
            )
              .returns(T.attached_class)
          end
          def self.new(
            amount:,
            auxiliary_on_us:,
            back_image_file_id:,
            check_transfer_id:,
            front_image_file_id:,
            inbound_check_deposit_id:,
            reason:
          )
          end

          sig do
            override
              .returns(
                {
                  amount: Integer,
                  auxiliary_on_us: T.nilable(String),
                  back_image_file_id: T.nilable(String),
                  check_transfer_id: T.nilable(String),
                  front_image_file_id: T.nilable(String),
                  inbound_check_deposit_id: T.nilable(String),
                  reason: Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
                }
              )
          end
          def to_hash
          end

          # Why the check was declined.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol) }

            # The account number is disabled.
            ACH_ROUTE_DISABLED =
              T.let(
                :ach_route_disabled,
                Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The account number is canceled.
            ACH_ROUTE_CANCELED =
              T.let(
                :ach_route_canceled,
                Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The deposited check was altered or fictitious.
            ALTERED_OR_FICTITIOUS =
              T.let(
                :altered_or_fictitious,
                Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The transaction would cause a limit to be exceeded.
            BREACHES_LIMIT =
              T.let(:breaches_limit, Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol)

            # The check was not endorsed by the payee.
            ENDORSEMENT_IRREGULAR =
              T.let(
                :endorsement_irregular,
                Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE =
              T.let(
                :entity_not_active,
                Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # Your account is inactive.
            GROUP_LOCKED =
              T.let(:group_locked, Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol)

            # Your account contains insufficient funds.
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # Stop payment requested for this check.
            STOP_PAYMENT_REQUESTED =
              T.let(
                :stop_payment_requested,
                Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The check was a duplicate deposit.
            DUPLICATE_PRESENTMENT =
              T.let(
                :duplicate_presentment,
                Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The check was not authorized.
            NOT_AUTHORIZED =
              T.let(:not_authorized, Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol)

            # The amount the receiving bank is attempting to deposit does not match the amount on the check.
            AMOUNT_MISMATCH =
              T.let(:amount_mismatch, Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol)

            # The check attempting to be deposited does not belong to Increase.
            NOT_OUR_ITEM =
              T.let(:not_our_item, Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol)

            # The account number on the check does not exist at Increase.
            NO_ACCOUNT_NUMBER_FOUND =
              T.let(
                :no_account_number_found,
                Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # The check is not readable. Please refer to the image.
            REFER_TO_IMAGE =
              T.let(:refer_to_image, Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol)

            # The check cannot be processed. This is rare: please contact support.
            UNABLE_TO_PROCESS =
              T.let(
                :unable_to_process,
                Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol
              )

            # Your integration declined this check via the API.
            USER_INITIATED =
              T.let(:user_initiated, Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol)

            sig do
              override
                .returns(T::Array[Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason::TaggedSymbol])
            end
            def self.values
            end
          end
        end

        class CheckDepositRejection < Increase::Internal::Type::BaseModel
          # The rejected amount in the minor unit of check's currency. For dollars, for
          #   example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The identifier of the Check Deposit that was rejected.
          sig { returns(String) }
          attr_accessor :check_deposit_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
          #   currency.
          sig { returns(Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol) }
          attr_accessor :currency

          # The identifier of the associated declined transaction.
          sig { returns(String) }
          attr_accessor :declined_transaction_id

          # Why the check deposit was rejected.
          sig { returns(Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol) }
          attr_accessor :reason

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the check deposit was rejected.
          sig { returns(Time) }
          attr_accessor :rejected_at

          # A Check Deposit Rejection object. This field will be present in the JSON
          #   response if and only if `category` is equal to `check_deposit_rejection`.
          sig do
            params(
              amount: Integer,
              check_deposit_id: String,
              currency: Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency::OrSymbol,
              declined_transaction_id: String,
              reason: Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::OrSymbol,
              rejected_at: Time
            )
              .returns(T.attached_class)
          end
          def self.new(amount:, check_deposit_id:, currency:, declined_transaction_id:, reason:, rejected_at:)
          end

          sig do
            override
              .returns(
                {
                  amount: Integer,
                  check_deposit_id: String,
                  currency: Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol,
                  declined_transaction_id: String,
                  reason: Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol,
                  rejected_at: Time
                }
              )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
          #   currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency) }
            OrSymbol =
              T.type_alias do
                T.any(
                  Symbol,
                  String,
                  Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol
                )
              end

            # Canadian Dollar (CAD)
            CAD =
              T.let(:CAD, Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol)

            # Swiss Franc (CHF)
            CHF =
              T.let(:CHF, Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol)

            # Euro (EUR)
            EUR =
              T.let(:EUR, Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol)

            # British Pound (GBP)
            GBP =
              T.let(:GBP, Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol)

            # Japanese Yen (JPY)
            JPY =
              T.let(:JPY, Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol)

            # US Dollar (USD)
            USD =
              T.let(:USD, Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol)

            sig do
              override
                .returns(
                  T::Array[Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency::TaggedSymbol]
                )
            end
            def self.values
            end
          end

          # Why the check deposit was rejected.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason) }
            OrSymbol =
              T.type_alias do
                T.any(
                  Symbol,
                  String,
                  Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
                )
              end

            # The check's image is incomplete.
            INCOMPLETE_IMAGE =
              T.let(
                :incomplete_image,
                Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # This is a duplicate check submission.
            DUPLICATE =
              T.let(
                :duplicate,
                Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # This check has poor image quality.
            POOR_IMAGE_QUALITY =
              T.let(
                :poor_image_quality,
                Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # The check was deposited with the incorrect amount.
            INCORRECT_AMOUNT =
              T.let(
                :incorrect_amount,
                Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # The check is made out to someone other than the account holder.
            INCORRECT_RECIPIENT =
              T.let(
                :incorrect_recipient,
                Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # This check was not eligible for mobile deposit.
            NOT_ELIGIBLE_FOR_MOBILE_DEPOSIT =
              T.let(
                :not_eligible_for_mobile_deposit,
                Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # This check is missing at least one required field.
            MISSING_REQUIRED_DATA_ELEMENTS =
              T.let(
                :missing_required_data_elements,
                Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # This check is suspected to be fraudulent.
            SUSPECTED_FRAUD =
              T.let(
                :suspected_fraud,
                Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # This check's deposit window has expired.
            DEPOSIT_WINDOW_EXPIRED =
              T.let(
                :deposit_window_expired,
                Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # The check was rejected at the user's request.
            REQUESTED_BY_USER =
              T.let(
                :requested_by_user,
                Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            # The check was rejected for an unknown reason.
            UNKNOWN =
              T.let(
                :unknown,
                Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol
              )

            sig do
              override
                .returns(
                  T::Array[Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason::TaggedSymbol]
                )
            end
            def self.values
            end
          end
        end

        class InboundRealTimePaymentsTransferDecline < Increase::Internal::Type::BaseModel
          # The declined amount in the minor unit of the destination account currency. For
          #   dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The name the sender of the transfer specified as the recipient of the transfer.
          sig { returns(String) }
          attr_accessor :creditor_name

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the declined
          #   transfer's currency. This will always be "USD" for a Real-Time Payments
          #   transfer.
          sig do
            returns(
              Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol
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
              Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
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
          #   present in the JSON response if and only if `category` is equal to
          #   `inbound_real_time_payments_transfer_decline`.
          sig do
            params(
              amount: Integer,
              creditor_name: String,
              currency: Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::OrSymbol,
              debtor_account_number: String,
              debtor_name: String,
              debtor_routing_number: String,
              reason: Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::OrSymbol,
              remittance_information: T.nilable(String),
              transaction_identification: String,
              transfer_id: String
            )
              .returns(T.attached_class)
          end
          def self.new(
            amount:,
            creditor_name:,
            currency:,
            debtor_account_number:,
            debtor_name:,
            debtor_routing_number:,
            reason:,
            remittance_information:,
            transaction_identification:,
            transfer_id:
          )
          end

          sig do
            override
              .returns(
                {
                  amount: Integer,
                  creditor_name: String,
                  currency: Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol,
                  debtor_account_number: String,
                  debtor_name: String,
                  debtor_routing_number: String,
                  reason: Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol,
                  remittance_information: T.nilable(String),
                  transaction_identification: String,
                  transfer_id: String
                }
              )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the declined
          #   transfer's currency. This will always be "USD" for a Real-Time Payments
          #   transfer.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency)
              end
            OrSymbol =
              T.type_alias do
                T.any(
                  Symbol,
                  String,
                  Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol
                )
              end

            # Canadian Dollar (CAD)
            CAD =
              T.let(
                :CAD,
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol
              )

            # Swiss Franc (CHF)
            CHF =
              T.let(
                :CHF,
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol
              )

            # Euro (EUR)
            EUR =
              T.let(
                :EUR,
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol
              )

            # British Pound (GBP)
            GBP =
              T.let(
                :GBP,
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol
              )

            # Japanese Yen (JPY)
            JPY =
              T.let(
                :JPY,
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol
              )

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol
              )

            sig do
              override
                .returns(
                  T::Array[
                  Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency::TaggedSymbol
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
                T.all(Symbol, Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason)
              end
            OrSymbol =
              T.type_alias do
                T.any(
                  Symbol,
                  String,
                  Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
                )
              end

            # The account number is canceled.
            ACCOUNT_NUMBER_CANCELED =
              T.let(
                :account_number_canceled,
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
              )

            # The account number is disabled.
            ACCOUNT_NUMBER_DISABLED =
              T.let(
                :account_number_disabled,
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
              )

            # Your account is restricted.
            ACCOUNT_RESTRICTED =
              T.let(
                :account_restricted,
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
              )

            # Your account is inactive.
            GROUP_LOCKED =
              T.let(
                :group_locked,
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
              )

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE =
              T.let(
                :entity_not_active,
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
              )

            # Your account is not enabled to receive Real-Time Payments transfers.
            REAL_TIME_PAYMENTS_NOT_ENABLED =
              T.let(
                :real_time_payments_not_enabled,
                Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
              )

            sig do
              override
                .returns(
                  T::Array[
                  Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason::TaggedSymbol
                  ]
                )
            end
            def self.values
            end
          end
        end

        class WireDecline < Increase::Internal::Type::BaseModel
          # The identifier of the Inbound Wire Transfer that was declined.
          sig { returns(String) }
          attr_accessor :inbound_wire_transfer_id

          # Why the wire transfer was declined.
          sig { returns(Increase::Models::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol) }
          attr_accessor :reason

          # A Wire Decline object. This field will be present in the JSON response if and
          #   only if `category` is equal to `wire_decline`.
          sig do
            params(
              inbound_wire_transfer_id: String,
              reason: Increase::Models::DeclinedTransaction::Source::WireDecline::Reason::OrSymbol
            )
              .returns(T.attached_class)
          end
          def self.new(inbound_wire_transfer_id:, reason:)
          end

          sig do
            override
              .returns(
                {
                  inbound_wire_transfer_id: String,
                  reason: Increase::Models::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
                }
              )
          end
          def to_hash
          end

          # Why the wire transfer was declined.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Source::WireDecline::Reason) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol) }

            # The account number is canceled.
            ACCOUNT_NUMBER_CANCELED =
              T.let(
                :account_number_canceled,
                Increase::Models::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
              )

            # The account number is disabled.
            ACCOUNT_NUMBER_DISABLED =
              T.let(
                :account_number_disabled,
                Increase::Models::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
              )

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE =
              T.let(
                :entity_not_active,
                Increase::Models::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
              )

            # Your account is inactive.
            GROUP_LOCKED =
              T.let(:group_locked, Increase::Models::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol)

            # The beneficiary account number does not exist.
            NO_ACCOUNT_NUMBER =
              T.let(
                :no_account_number,
                Increase::Models::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
              )

            # The transaction is not allowed per Increase's terms.
            TRANSACTION_NOT_ALLOWED =
              T.let(
                :transaction_not_allowed,
                Increase::Models::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol
              )

            sig do
              override
                .returns(T::Array[Increase::Models::DeclinedTransaction::Source::WireDecline::Reason::TaggedSymbol])
            end
            def self.values
            end
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `declined_transaction`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransaction::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransaction::Type::TaggedSymbol) }

        DECLINED_TRANSACTION =
          T.let(:declined_transaction, Increase::Models::DeclinedTransaction::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::DeclinedTransaction::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
