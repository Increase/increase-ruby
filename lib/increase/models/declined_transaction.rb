# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DeclinedTransactions#retrieve
    class DeclinedTransaction < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Declined Transaction identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The identifier for the Account the Declined Transaction belongs to.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The Declined Transaction amount in the minor unit of its currency. For dollars,
      #   for example, this is cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the
      #   Transaction occurred.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Declined
      #   Transaction's currency. This will match the currency on the Declined
      #   Transaction's Account.
      #
      #   @return [Symbol, Increase::Models::DeclinedTransaction::Currency]
      required :currency, enum: -> { Increase::DeclinedTransaction::Currency }

      # @!attribute description
      #   This is the description the vendor provides.
      #
      #   @return [String]
      required :description, String

      # @!attribute route_id
      #   The identifier for the route this Declined Transaction came through. Routes are
      #   things like cards and ACH details.
      #
      #   @return [String, nil]
      required :route_id, String, nil?: true

      # @!attribute route_type
      #   The type of the route this Declined Transaction came through.
      #
      #   @return [Symbol, Increase::Models::DeclinedTransaction::RouteType, nil]
      required :route_type, enum: -> { Increase::DeclinedTransaction::RouteType }, nil?: true

      # @!attribute source
      #   This is an object giving more details on the network-level event that caused the
      #   Declined Transaction. For example, for a card transaction this lists the
      #   merchant's industry and location. Note that for backwards compatibility reasons,
      #   additional undocumented keys may appear in this object. These should be treated
      #   as deprecated and will be removed in the future.
      #
      #   @return [Increase::Models::DeclinedTransaction::Source]
      required :source, -> { Increase::DeclinedTransaction::Source }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `declined_transaction`.
      #
      #   @return [Symbol, Increase::Models::DeclinedTransaction::Type]
      required :type, enum: -> { Increase::DeclinedTransaction::Type }

      # @!method initialize(id:, account_id:, amount:, created_at:, currency:, description:, route_id:, route_type:, source:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::DeclinedTransaction} for more details.
      #
      #   Declined Transactions are refused additions and removals of money from your bank
      #   account. For example, Declined Transactions are caused when your Account has an
      #   insufficient balance or your Limits are triggered.
      #
      #   @param id [String] The Declined Transaction identifier.
      #
      #   @param account_id [String] The identifier for the Account the Declined Transaction belongs to.
      #
      #   @param amount [Integer] The Declined Transaction amount in the minor unit of its currency. For dollars,
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date on which the Transac
      #
      #   @param currency [Symbol, Increase::Models::DeclinedTransaction::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Declined Tra
      #
      #   @param description [String] This is the description the vendor provides.
      #
      #   @param route_id [String, nil] The identifier for the route this Declined Transaction came through. Routes are
      #
      #   @param route_type [Symbol, Increase::Models::DeclinedTransaction::RouteType, nil] The type of the route this Declined Transaction came through.
      #
      #   @param source [Increase::Models::DeclinedTransaction::Source] This is an object giving more details on the network-level event that caused the
      #
      #   @param type [Symbol, Increase::Models::DeclinedTransaction::Type] A constant representing the object's type. For this resource it will always be `

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the Declined
      # Transaction's currency. This will match the currency on the Declined
      # Transaction's Account.
      #
      # @see Increase::Models::DeclinedTransaction#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # Canadian Dollar (CAD)
        CAD = :CAD

        # Swiss Franc (CHF)
        CHF = :CHF

        # Euro (EUR)
        EUR = :EUR

        # British Pound (GBP)
        GBP = :GBP

        # Japanese Yen (JPY)
        JPY = :JPY

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The type of the route this Declined Transaction came through.
      #
      # @see Increase::Models::DeclinedTransaction#route_type
      module RouteType
        extend Increase::Internal::Type::Enum

        # An Account Number.
        ACCOUNT_NUMBER = :account_number

        # A Card.
        CARD = :card

        # A Lockbox.
        LOCKBOX = :lockbox

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::DeclinedTransaction#source
      class Source < Increase::Internal::Type::BaseModel
        # @!attribute ach_decline
        #   An ACH Decline object. This field will be present in the JSON response if and
        #   only if `category` is equal to `ach_decline`.
        #
        #   @return [Increase::Models::DeclinedTransaction::Source::ACHDecline, nil]
        required :ach_decline, -> { Increase::DeclinedTransaction::Source::ACHDecline }, nil?: true

        # @!attribute card_decline
        #   A Card Decline object. This field will be present in the JSON response if and
        #   only if `category` is equal to `card_decline`.
        #
        #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline, nil]
        required :card_decline, -> { Increase::DeclinedTransaction::Source::CardDecline }, nil?: true

        # @!attribute category
        #   The type of the resource. We may add additional possible values for this enum
        #   over time; your application should be able to handle such additions gracefully.
        #
        #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::Category]
        required :category, enum: -> { Increase::DeclinedTransaction::Source::Category }

        # @!attribute check_decline
        #   A Check Decline object. This field will be present in the JSON response if and
        #   only if `category` is equal to `check_decline`.
        #
        #   @return [Increase::Models::DeclinedTransaction::Source::CheckDecline, nil]
        required :check_decline, -> { Increase::DeclinedTransaction::Source::CheckDecline }, nil?: true

        # @!attribute check_deposit_rejection
        #   A Check Deposit Rejection object. This field will be present in the JSON
        #   response if and only if `category` is equal to `check_deposit_rejection`.
        #
        #   @return [Increase::Models::DeclinedTransaction::Source::CheckDepositRejection, nil]
        required :check_deposit_rejection,
                 -> { Increase::DeclinedTransaction::Source::CheckDepositRejection },
                 nil?: true

        # @!attribute inbound_fednow_transfer_decline
        #   An Inbound FedNow Transfer Decline object. This field will be present in the
        #   JSON response if and only if `category` is equal to
        #   `inbound_fednow_transfer_decline`.
        #
        #   @return [Increase::Models::DeclinedTransaction::Source::InboundFednowTransferDecline, nil]
        required :inbound_fednow_transfer_decline,
                 -> { Increase::DeclinedTransaction::Source::InboundFednowTransferDecline },
                 nil?: true

        # @!attribute inbound_real_time_payments_transfer_decline
        #   An Inbound Real-Time Payments Transfer Decline object. This field will be
        #   present in the JSON response if and only if `category` is equal to
        #   `inbound_real_time_payments_transfer_decline`.
        #
        #   @return [Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline, nil]
        required :inbound_real_time_payments_transfer_decline,
                 -> { Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline },
                 nil?: true

        # @!attribute other
        #   If the category of this Transaction source is equal to `other`, this field will
        #   contain an empty object, otherwise it will contain null.
        #
        #   @return [Object, nil]
        required :other, Increase::Internal::Type::Unknown, nil?: true

        # @!attribute wire_decline
        #   A Wire Decline object. This field will be present in the JSON response if and
        #   only if `category` is equal to `wire_decline`.
        #
        #   @return [Increase::Models::DeclinedTransaction::Source::WireDecline, nil]
        required :wire_decline, -> { Increase::DeclinedTransaction::Source::WireDecline }, nil?: true

        # @!method initialize(ach_decline:, card_decline:, category:, check_decline:, check_deposit_rejection:, inbound_fednow_transfer_decline:, inbound_real_time_payments_transfer_decline:, other:, wire_decline:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::DeclinedTransaction::Source} for more details.
        #
        #   This is an object giving more details on the network-level event that caused the
        #   Declined Transaction. For example, for a card transaction this lists the
        #   merchant's industry and location. Note that for backwards compatibility reasons,
        #   additional undocumented keys may appear in this object. These should be treated
        #   as deprecated and will be removed in the future.
        #
        #   @param ach_decline [Increase::Models::DeclinedTransaction::Source::ACHDecline, nil] An ACH Decline object. This field will be present in the JSON response if and on
        #
        #   @param card_decline [Increase::Models::DeclinedTransaction::Source::CardDecline, nil] A Card Decline object. This field will be present in the JSON response if and on
        #
        #   @param category [Symbol, Increase::Models::DeclinedTransaction::Source::Category] The type of the resource. We may add additional possible values for this enum ov
        #
        #   @param check_decline [Increase::Models::DeclinedTransaction::Source::CheckDecline, nil] A Check Decline object. This field will be present in the JSON response if and o
        #
        #   @param check_deposit_rejection [Increase::Models::DeclinedTransaction::Source::CheckDepositRejection, nil] A Check Deposit Rejection object. This field will be present in the JSON respons
        #
        #   @param inbound_fednow_transfer_decline [Increase::Models::DeclinedTransaction::Source::InboundFednowTransferDecline, nil] An Inbound FedNow Transfer Decline object. This field will be present in the JSO
        #
        #   @param inbound_real_time_payments_transfer_decline [Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline, nil] An Inbound Real-Time Payments Transfer Decline object. This field will be presen
        #
        #   @param other [Object, nil] If the category of this Transaction source is equal to `other`, this field will
        #
        #   @param wire_decline [Increase::Models::DeclinedTransaction::Source::WireDecline, nil] A Wire Decline object. This field will be present in the JSON response if and on

        # @see Increase::Models::DeclinedTransaction::Source#ach_decline
        class ACHDecline < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The ACH Decline's identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute amount
          #   The declined amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute inbound_ach_transfer_id
          #   The identifier of the Inbound ACH Transfer object associated with this decline.
          #
          #   @return [String]
          required :inbound_ach_transfer_id, String

          # @!attribute originator_company_descriptive_date
          #   The descriptive date of the transfer.
          #
          #   @return [String, nil]
          required :originator_company_descriptive_date, String, nil?: true

          # @!attribute originator_company_discretionary_data
          #   The additional information included with the transfer.
          #
          #   @return [String, nil]
          required :originator_company_discretionary_data, String, nil?: true

          # @!attribute originator_company_id
          #   The identifier of the company that initiated the transfer.
          #
          #   @return [String]
          required :originator_company_id, String

          # @!attribute originator_company_name
          #   The name of the company that initiated the transfer.
          #
          #   @return [String]
          required :originator_company_name, String

          # @!attribute reason
          #   Why the ACH transfer was declined.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason]
          required :reason, enum: -> { Increase::DeclinedTransaction::Source::ACHDecline::Reason }

          # @!attribute receiver_id_number
          #   The id of the receiver of the transfer.
          #
          #   @return [String, nil]
          required :receiver_id_number, String, nil?: true

          # @!attribute receiver_name
          #   The name of the receiver of the transfer.
          #
          #   @return [String, nil]
          required :receiver_name, String, nil?: true

          # @!attribute trace_number
          #   The trace number of the transfer.
          #
          #   @return [String]
          required :trace_number, String

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `ach_decline`.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::ACHDecline::Type]
          required :type, enum: -> { Increase::DeclinedTransaction::Source::ACHDecline::Type }

          # @!method initialize(id:, amount:, inbound_ach_transfer_id:, originator_company_descriptive_date:, originator_company_discretionary_data:, originator_company_id:, originator_company_name:, reason:, receiver_id_number:, receiver_name:, trace_number:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::DeclinedTransaction::Source::ACHDecline} for more details.
          #
          #   An ACH Decline object. This field will be present in the JSON response if and
          #   only if `category` is equal to `ach_decline`.
          #
          #   @param id [String] The ACH Decline's identifier.
          #
          #   @param amount [Integer] The declined amount in USD cents.
          #
          #   @param inbound_ach_transfer_id [String] The identifier of the Inbound ACH Transfer object associated with this decline.
          #
          #   @param originator_company_descriptive_date [String, nil] The descriptive date of the transfer.
          #
          #   @param originator_company_discretionary_data [String, nil] The additional information included with the transfer.
          #
          #   @param originator_company_id [String] The identifier of the company that initiated the transfer.
          #
          #   @param originator_company_name [String] The name of the company that initiated the transfer.
          #
          #   @param reason [Symbol, Increase::Models::DeclinedTransaction::Source::ACHDecline::Reason] Why the ACH transfer was declined.
          #
          #   @param receiver_id_number [String, nil] The id of the receiver of the transfer.
          #
          #   @param receiver_name [String, nil] The name of the receiver of the transfer.
          #
          #   @param trace_number [String] The trace number of the transfer.
          #
          #   @param type [Symbol, Increase::Models::DeclinedTransaction::Source::ACHDecline::Type] A constant representing the object's type. For this resource it will always be `

          # Why the ACH transfer was declined.
          #
          # @see Increase::Models::DeclinedTransaction::Source::ACHDecline#reason
          module Reason
            extend Increase::Internal::Type::Enum

            # The account number is canceled.
            ACH_ROUTE_CANCELED = :ach_route_canceled

            # The account number is disabled.
            ACH_ROUTE_DISABLED = :ach_route_disabled

            # The transaction would cause an Increase limit to be exceeded.
            BREACHES_LIMIT = :breaches_limit

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE = :entity_not_active

            # Your account is inactive.
            GROUP_LOCKED = :group_locked

            # The transaction is not allowed per Increase's terms.
            TRANSACTION_NOT_ALLOWED = :transaction_not_allowed

            # Your integration declined this transfer via the API.
            USER_INITIATED = :user_initiated

            # Your account contains insufficient funds.
            INSUFFICIENT_FUNDS = :insufficient_funds

            # The originating financial institution asked for this transfer to be returned. The receiving bank is complying with the request.
            RETURNED_PER_ODFI_REQUEST = :returned_per_odfi_request

            # The customer no longer authorizes this transaction.
            AUTHORIZATION_REVOKED_BY_CUSTOMER = :authorization_revoked_by_customer

            # The customer asked for the payment to be stopped.
            PAYMENT_STOPPED = :payment_stopped

            # The customer advises that the debit was unauthorized.
            CUSTOMER_ADVISED_UNAUTHORIZED_IMPROPER_INELIGIBLE_OR_INCOMPLETE =
              :customer_advised_unauthorized_improper_ineligible_or_incomplete

            # The payee is deceased.
            REPRESENTATIVE_PAYEE_DECEASED_OR_UNABLE_TO_CONTINUE_IN_THAT_CAPACITY =
              :representative_payee_deceased_or_unable_to_continue_in_that_capacity

            # The account holder is deceased.
            BENEFICIARY_OR_ACCOUNT_HOLDER_DECEASED = :beneficiary_or_account_holder_deceased

            # The customer refused a credit entry.
            CREDIT_ENTRY_REFUSED_BY_RECEIVER = :credit_entry_refused_by_receiver

            # The account holder identified this transaction as a duplicate.
            DUPLICATE_ENTRY = :duplicate_entry

            # The corporate customer no longer authorizes this transaction.
            CORPORATE_CUSTOMER_ADVISED_NOT_AUTHORIZED = :corporate_customer_advised_not_authorized

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # A constant representing the object's type. For this resource it will always be
          # `ach_decline`.
          #
          # @see Increase::Models::DeclinedTransaction::Source::ACHDecline#type
          module Type
            extend Increase::Internal::Type::Enum

            ACH_DECLINE = :ach_decline

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::DeclinedTransaction::Source#card_decline
        class CardDecline < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Decline identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute actioner
          #   Whether this authorization was approved by Increase, the card network through
          #   stand-in processing, or the user through a real-time decision.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Actioner]
          required :actioner, enum: -> { Increase::DeclinedTransaction::Source::CardDecline::Actioner }

          # @!attribute additional_amounts
          #   Additional amounts associated with the card authorization, such as ATM
          #   surcharges fees. These are usually a subset of the `amount` field and are used
          #   to provide more detailed information about the transaction.
          #
          #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts]
          required :additional_amounts, -> { Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts }

          # @!attribute amount
          #   The declined amount in the minor unit of the destination account currency. For
          #   dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute card_payment_id
          #   The ID of the Card Payment this transaction belongs to.
          #
          #   @return [String]
          required :card_payment_id, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          #   account currency.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Currency]
          required :currency, enum: -> { Increase::DeclinedTransaction::Source::CardDecline::Currency }

          # @!attribute declined_transaction_id
          #   The identifier of the declined transaction created for this Card Decline.
          #
          #   @return [String]
          required :declined_transaction_id, String

          # @!attribute digital_wallet_token_id
          #   If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          #   purchase), the identifier of the token that was used.
          #
          #   @return [String, nil]
          required :digital_wallet_token_id, String, nil?: true

          # @!attribute direction
          #   The direction describes the direction the funds will move, either from the
          #   cardholder to the merchant or from the merchant to the cardholder.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Direction]
          required :direction, enum: -> { Increase::DeclinedTransaction::Source::CardDecline::Direction }

          # @!attribute incremented_card_authorization_id
          #   The identifier of the card authorization this request attempted to incrementally
          #   authorize.
          #
          #   @return [String, nil]
          required :incremented_card_authorization_id, String, nil?: true

          # @!attribute merchant_acceptor_id
          #   The merchant identifier (commonly abbreviated as MID) of the merchant the card
          #   is transacting with.
          #
          #   @return [String]
          required :merchant_acceptor_id, String

          # @!attribute merchant_category_code
          #   The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
          #   card is transacting with.
          #
          #   @return [String]
          required :merchant_category_code, String

          # @!attribute merchant_city
          #   The city the merchant resides in.
          #
          #   @return [String, nil]
          required :merchant_city, String, nil?: true

          # @!attribute merchant_country
          #   The country the merchant resides in.
          #
          #   @return [String]
          required :merchant_country, String

          # @!attribute merchant_descriptor
          #   The merchant descriptor of the merchant the card is transacting with.
          #
          #   @return [String]
          required :merchant_descriptor, String

          # @!attribute merchant_postal_code
          #   The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
          #   ZIP code, where the first 5 and last 4 are separated by a dash.
          #
          #   @return [String, nil]
          required :merchant_postal_code, String, nil?: true

          # @!attribute merchant_state
          #   The state the merchant resides in.
          #
          #   @return [String, nil]
          required :merchant_state, String, nil?: true

          # @!attribute network_details
          #   Fields specific to the `network`.
          #
          #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails]
          required :network_details, -> { Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails }

          # @!attribute network_identifiers
          #   Network-specific identifiers for a specific request or transaction.
          #
          #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers]
          required :network_identifiers,
                   -> { Increase::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers }

          # @!attribute network_risk_score
          #   The risk score generated by the card network. For Visa this is the Visa Advanced
          #   Authorization risk score, from 0 to 99, where 99 is the riskiest.
          #
          #   @return [Integer, nil]
          required :network_risk_score, Integer, nil?: true

          # @!attribute physical_card_id
          #   If the authorization was made in-person with a physical card, the Physical Card
          #   that was used.
          #
          #   @return [String, nil]
          required :physical_card_id, String, nil?: true

          # @!attribute presentment_amount
          #   The declined amount in the minor unit of the transaction's presentment currency.
          #
          #   @return [Integer]
          required :presentment_amount, Integer

          # @!attribute presentment_currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's presentment currency.
          #
          #   @return [String]
          required :presentment_currency, String

          # @!attribute processing_category
          #   The processing category describes the intent behind the authorization, such as
          #   whether it was used for bill payments or an automatic fuel dispenser.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory]
          required :processing_category,
                   enum: -> { Increase::DeclinedTransaction::Source::CardDecline::ProcessingCategory }

          # @!attribute real_time_decision_id
          #   The identifier of the Real-Time Decision sent to approve or decline this
          #   transaction.
          #
          #   @return [String, nil]
          required :real_time_decision_id, String, nil?: true

          # @!attribute real_time_decision_reason
          #   This is present if a specific decline reason was given in the real-time
          #   decision.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason, nil]
          required :real_time_decision_reason,
                   enum: -> { Increase::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason },
                   nil?: true

          # @!attribute reason
          #   Why the transaction was declined.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Reason]
          required :reason, enum: -> { Increase::DeclinedTransaction::Source::CardDecline::Reason }

          # @!attribute terminal_id
          #   The terminal identifier (commonly abbreviated as TID) of the terminal the card
          #   is transacting with.
          #
          #   @return [String, nil]
          required :terminal_id, String, nil?: true

          # @!attribute verification
          #   Fields related to verification of cardholder-provided values.
          #
          #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::Verification]
          required :verification, -> { Increase::DeclinedTransaction::Source::CardDecline::Verification }

          # @!method initialize(id:, actioner:, additional_amounts:, amount:, card_payment_id:, currency:, declined_transaction_id:, digital_wallet_token_id:, direction:, incremented_card_authorization_id:, merchant_acceptor_id:, merchant_category_code:, merchant_city:, merchant_country:, merchant_descriptor:, merchant_postal_code:, merchant_state:, network_details:, network_identifiers:, network_risk_score:, physical_card_id:, presentment_amount:, presentment_currency:, processing_category:, real_time_decision_id:, real_time_decision_reason:, reason:, terminal_id:, verification:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::DeclinedTransaction::Source::CardDecline} for more details.
          #
          #   A Card Decline object. This field will be present in the JSON response if and
          #   only if `category` is equal to `card_decline`.
          #
          #   @param id [String] The Card Decline identifier.
          #
          #   @param actioner [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Actioner] Whether this authorization was approved by Increase, the card network through st
          #
          #   @param additional_amounts [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts] Additional amounts associated with the card authorization, such as ATM surcharge
          #
          #   @param amount [Integer] The declined amount in the minor unit of the destination account currency. For d
          #
          #   @param card_payment_id [String] The ID of the Card Payment this transaction belongs to.
          #
          #   @param currency [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          #
          #   @param declined_transaction_id [String] The identifier of the declined transaction created for this Card Decline.
          #
          #   @param digital_wallet_token_id [String, nil] If the authorization was made via a Digital Wallet Token (such as an Apple Pay p
          #
          #   @param direction [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Direction] The direction describes the direction the funds will move, either from the cardh
          #
          #   @param incremented_card_authorization_id [String, nil] The identifier of the card authorization this request attempted to incrementally
          #
          #   @param merchant_acceptor_id [String] The merchant identifier (commonly abbreviated as MID) of the merchant the card i
          #
          #   @param merchant_category_code [String] The Merchant Category Code (commonly abbreviated as MCC) of the merchant the car
          #
          #   @param merchant_city [String, nil] The city the merchant resides in.
          #
          #   @param merchant_country [String] The country the merchant resides in.
          #
          #   @param merchant_descriptor [String] The merchant descriptor of the merchant the card is transacting with.
          #
          #   @param merchant_postal_code [String, nil] The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
          #
          #   @param merchant_state [String, nil] The state the merchant resides in.
          #
          #   @param network_details [Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails] Fields specific to the `network`.
          #
          #   @param network_identifiers [Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers] Network-specific identifiers for a specific request or transaction.
          #
          #   @param network_risk_score [Integer, nil] The risk score generated by the card network. For Visa this is the Visa Advanced
          #
          #   @param physical_card_id [String, nil] If the authorization was made in-person with a physical card, the Physical Card
          #
          #   @param presentment_amount [Integer] The declined amount in the minor unit of the transaction's presentment currency.
          #
          #   @param presentment_currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param processing_category [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::ProcessingCategory] The processing category describes the intent behind the authorization, such as w
          #
          #   @param real_time_decision_id [String, nil] The identifier of the Real-Time Decision sent to approve or decline this transac
          #
          #   @param real_time_decision_reason [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::RealTimeDecisionReason, nil] This is present if a specific decline reason was given in the real-time decision
          #
          #   @param reason [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Reason] Why the transaction was declined.
          #
          #   @param terminal_id [String, nil] The terminal identifier (commonly abbreviated as TID) of the terminal the card i
          #
          #   @param verification [Increase::Models::DeclinedTransaction::Source::CardDecline::Verification] Fields related to verification of cardholder-provided values.

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          #
          # @see Increase::Models::DeclinedTransaction::Source::CardDecline#actioner
          module Actioner
            extend Increase::Internal::Type::Enum

            # This object was actioned by the user through a real-time decision.
            USER = :user

            # This object was actioned by Increase without user intervention.
            INCREASE = :increase

            # This object was actioned by the network, through stand-in processing.
            NETWORK = :network

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::DeclinedTransaction::Source::CardDecline#additional_amounts
          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            # @!attribute clinic
            #   The part of this transaction amount that was for clinic-related services.
            #
            #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Clinic, nil]
            required :clinic,
                     -> { Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Clinic },
                     nil?: true

            # @!attribute dental
            #   The part of this transaction amount that was for dental-related services.
            #
            #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Dental, nil]
            required :dental,
                     -> { Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Dental },
                     nil?: true

            # @!attribute prescription
            #   The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Prescription, nil]
            required :prescription,
                     -> {
                       Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Prescription
                     },
                     nil?: true

            # @!attribute surcharge
            #   The surcharge amount charged for this transaction by the merchant.
            #
            #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Surcharge, nil]
            required :surcharge,
                     -> { Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Surcharge },
                     nil?: true

            # @!attribute total_cumulative
            #   The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalCumulative, nil]
            required :total_cumulative,
                     -> {
                       Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalCumulative
                     },
                     nil?: true

            # @!attribute total_healthcare
            #   The total amount of healthcare-related additional amounts.
            #
            #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalHealthcare, nil]
            required :total_healthcare,
                     -> {
                       Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalHealthcare
                     },
                     nil?: true

            # @!attribute transit
            #   The part of this transaction amount that was for transit-related services.
            #
            #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Transit, nil]
            required :transit,
                     -> { Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Transit },
                     nil?: true

            # @!attribute unknown
            #   An unknown additional amount.
            #
            #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Unknown, nil]
            required :unknown,
                     -> { Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Unknown },
                     nil?: true

            # @!attribute vision
            #   The part of this transaction amount that was for vision-related services.
            #
            #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Vision, nil]
            required :vision,
                     -> { Increase::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Vision },
                     nil?: true

            # @!method initialize(clinic:, dental:, prescription:, surcharge:, total_cumulative:, total_healthcare:, transit:, unknown:, vision:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts}
            #   for more details.
            #
            #   Additional amounts associated with the card authorization, such as ATM
            #   surcharges fees. These are usually a subset of the `amount` field and are used
            #   to provide more detailed information about the transaction.
            #
            #   @param clinic [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Clinic, nil] The part of this transaction amount that was for clinic-related services.
            #
            #   @param dental [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Dental, nil] The part of this transaction amount that was for dental-related services.
            #
            #   @param prescription [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Prescription, nil] The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @param surcharge [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Surcharge, nil] The surcharge amount charged for this transaction by the merchant.
            #
            #   @param total_cumulative [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalCumulative, nil] The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @param total_healthcare [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalHealthcare, nil] The total amount of healthcare-related additional amounts.
            #
            #   @param transit [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Transit, nil] The part of this transaction amount that was for transit-related services.
            #
            #   @param unknown [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Unknown, nil] An unknown additional amount.
            #
            #   @param vision [Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Vision, nil] The part of this transaction amount that was for vision-related services.

            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts#clinic
            class Clinic < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Clinic}
              #   for more details.
              #
              #   The part of this transaction amount that was for clinic-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts#dental
            class Dental < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Dental}
              #   for more details.
              #
              #   The part of this transaction amount that was for dental-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts#prescription
            class Prescription < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Prescription}
              #   for more details.
              #
              #   The part of this transaction amount that was for healthcare prescriptions.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts#surcharge
            class Surcharge < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Surcharge}
              #   for more details.
              #
              #   The surcharge amount charged for this transaction by the merchant.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts#total_cumulative
            class TotalCumulative < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalCumulative}
              #   for more details.
              #
              #   The total amount of a series of incremental authorizations, optionally provided.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts#total_healthcare
            class TotalHealthcare < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::TotalHealthcare}
              #   for more details.
              #
              #   The total amount of healthcare-related additional amounts.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts#transit
            class Transit < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Transit}
              #   for more details.
              #
              #   The part of this transaction amount that was for transit-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts#unknown
            class Unknown < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Unknown}
              #   for more details.
              #
              #   An unknown additional amount.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts#vision
            class Vision < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              #   amount's currency.
              #
              #   @return [String]
              required :currency, String

              # @!method initialize(amount:, currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::DeclinedTransaction::Source::CardDecline::AdditionalAmounts::Vision}
              #   for more details.
              #
              #   The part of this transaction amount that was for vision-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          # account currency.
          #
          # @see Increase::Models::DeclinedTransaction::Source::CardDecline#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          #
          # @see Increase::Models::DeclinedTransaction::Source::CardDecline#direction
          module Direction
            extend Increase::Internal::Type::Enum

            # A regular card authorization where funds are debited from the cardholder.
            SETTLEMENT = :settlement

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND = :refund

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::DeclinedTransaction::Source::CardDecline#network_details
          class NetworkDetails < Increase::Internal::Type::BaseModel
            # @!attribute category
            #   The payment network used to process this card authorization.
            #
            #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category]
            required :category,
                     enum: -> { Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category }

            # @!attribute visa
            #   Fields specific to the `visa` network.
            #
            #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa, nil]
            required :visa,
                     -> { Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa },
                     nil?: true

            # @!method initialize(category:, visa:)
            #   Fields specific to the `network`.
            #
            #   @param category [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Category] The payment network used to process this card authorization.
            #
            #   @param visa [Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa, nil] Fields specific to the `visa` network.

            # The payment network used to process this card authorization.
            #
            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails#category
            module Category
              extend Increase::Internal::Type::Enum

              # Visa
              VISA = :visa

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails#visa
            class Visa < Increase::Internal::Type::BaseModel
              # @!attribute electronic_commerce_indicator
              #   For electronic commerce transactions, this identifies the level of security used
              #   in obtaining the customer's payment credential. For mail or telephone order
              #   transactions, identifies the type of mail or telephone order.
              #
              #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator, nil]
              required :electronic_commerce_indicator,
                       enum: -> {
                         Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator
                       },
                       nil?: true

              # @!attribute point_of_service_entry_mode
              #   The method used to enter the cardholder's primary account number and card
              #   expiration date.
              #
              #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode, nil]
              required :point_of_service_entry_mode,
                       enum: -> {
                         Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode
                       },
                       nil?: true

              # @!attribute stand_in_processing_reason
              #   Only present when `actioner: network`. Describes why a card authorization was
              #   approved or declined by Visa through stand-in processing.
              #
              #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason, nil]
              required :stand_in_processing_reason,
                       enum: -> {
                         Increase::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason
                       },
                       nil?: true

              # @!method initialize(electronic_commerce_indicator:, point_of_service_entry_mode:, stand_in_processing_reason:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa}
              #   for more details.
              #
              #   Fields specific to the `visa` network.
              #
              #   @param electronic_commerce_indicator [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator, nil] For electronic commerce transactions, this identifies the level of security used
              #
              #   @param point_of_service_entry_mode [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode, nil] The method used to enter the cardholder's primary account number and card expira
              #
              #   @param stand_in_processing_reason [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa::StandInProcessingReason, nil] Only present when `actioner: network`. Describes why a card authorization was ap

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              #
              # @see Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa#electronic_commerce_indicator
              module ElectronicCommerceIndicator
                extend Increase::Internal::Type::Enum

                # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
                MAIL_PHONE_ORDER = :mail_phone_order

                # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
                RECURRING = :recurring

                # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
                INSTALLMENT = :installment

                # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
                UNKNOWN_MAIL_PHONE_ORDER = :unknown_mail_phone_order

                # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
                SECURE_ELECTRONIC_COMMERCE = :secure_electronic_commerce

                # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
                NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                  :non_authenticated_security_transaction_at_3ds_capable_merchant

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however , cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION = :non_authenticated_security_transaction

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION = :non_secure_transaction

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              #
              # @see Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa#point_of_service_entry_mode
              module PointOfServiceEntryMode
                extend Increase::Internal::Type::Enum

                # Unknown
                UNKNOWN = :unknown

                # Manual key entry
                MANUAL = :manual

                # Magnetic stripe read, without card verification value
                MAGNETIC_STRIPE_NO_CVV = :magnetic_stripe_no_cvv

                # Optical code
                OPTICAL_CODE = :optical_code

                # Contact chip card
                INTEGRATED_CIRCUIT_CARD = :integrated_circuit_card

                # Contactless read of chip card
                CONTACTLESS = :contactless

                # Transaction initiated using a credential that has previously been stored on file
                CREDENTIAL_ON_FILE = :credential_on_file

                # Magnetic stripe read
                MAGNETIC_STRIPE = :magnetic_stripe

                # Contactless read of magnetic stripe data
                CONTACTLESS_MAGNETIC_STRIPE = :contactless_magnetic_stripe

                # Contact chip card, without card verification value
                INTEGRATED_CIRCUIT_CARD_NO_CVV = :integrated_circuit_card_no_cvv

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              #
              # @see Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkDetails::Visa#stand_in_processing_reason
              module StandInProcessingReason
                extend Increase::Internal::Type::Enum

                # Increase failed to process the authorization in a timely manner.
                ISSUER_ERROR = :issuer_error

                # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
                INVALID_PHYSICAL_CARD = :invalid_physical_card

                # The 3DS cardholder authentication verification value was invalid.
                INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                  :invalid_cardholder_authentication_verification_value

                # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
                INTERNAL_VISA_ERROR = :internal_visa_error

                # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
                MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                  :merchant_transaction_advisory_service_authentication_required

                # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
                PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK = :payment_fraud_disruption_acquirer_block

                # An unspecific reason for stand-in processing.
                OTHER = :other

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end

          # @see Increase::Models::DeclinedTransaction::Source::CardDecline#network_identifiers
          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            # @!attribute retrieval_reference_number
            #   A life-cycle identifier used across e.g., an authorization and a reversal.
            #   Expected to be unique per acquirer within a window of time. For some card
            #   networks the retrieval reference number includes the trace counter.
            #
            #   @return [String, nil]
            required :retrieval_reference_number, String, nil?: true

            # @!attribute trace_number
            #   A counter used to verify an individual authorization. Expected to be unique per
            #   acquirer within a window of time.
            #
            #   @return [String, nil]
            required :trace_number, String, nil?: true

            # @!attribute transaction_id
            #   A globally unique transaction identifier provided by the card network, used
            #   across multiple life-cycle requests.
            #
            #   @return [String, nil]
            required :transaction_id, String, nil?: true

            # @!method initialize(retrieval_reference_number:, trace_number:, transaction_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::DeclinedTransaction::Source::CardDecline::NetworkIdentifiers}
            #   for more details.
            #
            #   Network-specific identifiers for a specific request or transaction.
            #
            #   @param retrieval_reference_number [String, nil] A life-cycle identifier used across e.g., an authorization and a reversal. Expec
            #
            #   @param trace_number [String, nil] A counter used to verify an individual authorization. Expected to be unique per
            #
            #   @param transaction_id [String, nil] A globally unique transaction identifier provided by the card network, used acro
          end

          # The processing category describes the intent behind the authorization, such as
          # whether it was used for bill payments or an automatic fuel dispenser.
          #
          # @see Increase::Models::DeclinedTransaction::Source::CardDecline#processing_category
          module ProcessingCategory
            extend Increase::Internal::Type::Enum

            # Account funding transactions are transactions used to e.g., fund an account or transfer funds between accounts.
            ACCOUNT_FUNDING = :account_funding

            # Automatic fuel dispenser authorizations occur when a card is used at a gas pump, prior to the actual transaction amount being known. They are followed by an advice message that updates the amount of the pending transaction.
            AUTOMATIC_FUEL_DISPENSER = :automatic_fuel_dispenser

            # A transaction used to pay a bill.
            BILL_PAYMENT = :bill_payment

            # Original credit transactions are used to send money to a cardholder.
            ORIGINAL_CREDIT = :original_credit

            # A regular purchase.
            PURCHASE = :purchase

            # Quasi-cash transactions represent purchases of items which may be convertible to cash.
            QUASI_CASH = :quasi_cash

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND = :refund

            # Cash disbursement transactions are used to withdraw cash from an ATM or a point of sale.
            CASH_DISBURSEMENT = :cash_disbursement

            # The processing category is unknown.
            UNKNOWN = :unknown

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # This is present if a specific decline reason was given in the real-time
          # decision.
          #
          # @see Increase::Models::DeclinedTransaction::Source::CardDecline#real_time_decision_reason
          module RealTimeDecisionReason
            extend Increase::Internal::Type::Enum

            # The cardholder does not have sufficient funds to cover the transaction. The merchant may attempt to process the transaction again.
            INSUFFICIENT_FUNDS = :insufficient_funds

            # This type of transaction is not allowed for this card. This transaction should not be retried.
            TRANSACTION_NEVER_ALLOWED = :transaction_never_allowed

            # The transaction amount exceeds the cardholder's approval limit. The merchant may attempt to process the transaction again.
            EXCEEDS_APPROVAL_LIMIT = :exceeds_approval_limit

            # The card has been temporarily disabled or not yet activated. The merchant may attempt to process the transaction again.
            CARD_TEMPORARILY_DISABLED = :card_temporarily_disabled

            # The transaction is suspected to be fraudulent. The merchant may attempt to process the transaction again.
            SUSPECTED_FRAUD = :suspected_fraud

            # The transaction was declined for another reason. The merchant may attempt to process the transaction again. This should be used sparingly.
            OTHER = :other

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Why the transaction was declined.
          #
          # @see Increase::Models::DeclinedTransaction::Source::CardDecline#reason
          module Reason
            extend Increase::Internal::Type::Enum

            # The account has been closed.
            ACCOUNT_CLOSED = :account_closed

            # The Card was not active.
            CARD_NOT_ACTIVE = :card_not_active

            # The Card has been canceled.
            CARD_CANCELED = :card_canceled

            # The Physical Card was not active.
            PHYSICAL_CARD_NOT_ACTIVE = :physical_card_not_active

            # The account's entity was not active.
            ENTITY_NOT_ACTIVE = :entity_not_active

            # The account was inactive.
            GROUP_LOCKED = :group_locked

            # The Card's Account did not have a sufficient available balance.
            INSUFFICIENT_FUNDS = :insufficient_funds

            # The given CVV2 did not match the card's value.
            CVV2_MISMATCH = :cvv2_mismatch

            # The given PIN did not match the card's value.
            PIN_MISMATCH = :pin_mismatch

            # The given expiration date did not match the card's value. Only applies when a CVV2 is present.
            CARD_EXPIRATION_MISMATCH = :card_expiration_mismatch

            # The attempted card transaction is not allowed per Increase's terms.
            TRANSACTION_NOT_ALLOWED = :transaction_not_allowed

            # The transaction was blocked by a Limit.
            BREACHES_LIMIT = :breaches_limit

            # Your application declined the transaction via webhook.
            WEBHOOK_DECLINED = :webhook_declined

            # Your application webhook did not respond without the required timeout.
            WEBHOOK_TIMED_OUT = :webhook_timed_out

            # Declined by stand-in processing.
            DECLINED_BY_STAND_IN_PROCESSING = :declined_by_stand_in_processing

            # The card read had an invalid CVV, dCVV, or authorization request cryptogram.
            INVALID_PHYSICAL_CARD = :invalid_physical_card

            # The original card authorization for this incremental authorization does not exist.
            MISSING_ORIGINAL_AUTHORIZATION = :missing_original_authorization

            # The transaction was declined because the 3DS authentication failed.
            FAILED_3DS_AUTHENTICATION = :failed_3ds_authentication

            # The transaction was suspected to be used by a card tester to test for valid card numbers.
            SUSPECTED_CARD_TESTING = :suspected_card_testing

            # The transaction was suspected to be fraudulent. Please reach out to support@increase.com for more information.
            SUSPECTED_FRAUD = :suspected_fraud

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::DeclinedTransaction::Source::CardDecline#verification
          class Verification < Increase::Internal::Type::BaseModel
            # @!attribute card_verification_code
            #   Fields related to verification of the Card Verification Code, a 3-digit code on
            #   the back of the card.
            #
            #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode]
            required :card_verification_code,
                     -> { Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode }

            # @!attribute cardholder_address
            #   Cardholder address provided in the authorization request and the address on file
            #   we verified it against.
            #
            #   @return [Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress]
            required :cardholder_address,
                     -> { Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress }

            # @!method initialize(card_verification_code:, cardholder_address:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::DeclinedTransaction::Source::CardDecline::Verification} for
            #   more details.
            #
            #   Fields related to verification of cardholder-provided values.
            #
            #   @param card_verification_code [Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode] Fields related to verification of the Card Verification Code, a 3-digit code on
            #
            #   @param cardholder_address [Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress] Cardholder address provided in the authorization request and the address on file

            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::Verification#card_verification_code
            class CardVerificationCode < Increase::Internal::Type::BaseModel
              # @!attribute result
              #   The result of verifying the Card Verification Code.
              #
              #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result]
              required :result,
                       enum: -> { Increase::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result }

              # @!method initialize(result:)
              #   Fields related to verification of the Card Verification Code, a 3-digit code on
              #   the back of the card.
              #
              #   @param result [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode::Result] The result of verifying the Card Verification Code.

              # The result of verifying the Card Verification Code.
              #
              # @see Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardVerificationCode#result
              module Result
                extend Increase::Internal::Type::Enum

                # No card verification code was provided in the authorization request.
                NOT_CHECKED = :not_checked

                # The card verification code matched the one on file.
                MATCH = :match

                # The card verification code did not match the one on file.
                NO_MATCH = :no_match

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::DeclinedTransaction::Source::CardDecline::Verification#cardholder_address
            class CardholderAddress < Increase::Internal::Type::BaseModel
              # @!attribute actual_line1
              #   Line 1 of the address on file for the cardholder.
              #
              #   @return [String, nil]
              required :actual_line1, String, nil?: true

              # @!attribute actual_postal_code
              #   The postal code of the address on file for the cardholder.
              #
              #   @return [String, nil]
              required :actual_postal_code, String, nil?: true

              # @!attribute provided_line1
              #   The cardholder address line 1 provided for verification in the authorization
              #   request.
              #
              #   @return [String, nil]
              required :provided_line1, String, nil?: true

              # @!attribute provided_postal_code
              #   The postal code provided for verification in the authorization request.
              #
              #   @return [String, nil]
              required :provided_postal_code, String, nil?: true

              # @!attribute result
              #   The address verification result returned to the card network.
              #
              #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result]
              required :result,
                       enum: -> { Increase::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result }

              # @!method initialize(actual_line1:, actual_postal_code:, provided_line1:, provided_postal_code:, result:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress}
              #   for more details.
              #
              #   Cardholder address provided in the authorization request and the address on file
              #   we verified it against.
              #
              #   @param actual_line1 [String, nil] Line 1 of the address on file for the cardholder.
              #
              #   @param actual_postal_code [String, nil] The postal code of the address on file for the cardholder.
              #
              #   @param provided_line1 [String, nil] The cardholder address line 1 provided for verification in the authorization req
              #
              #   @param provided_postal_code [String, nil] The postal code provided for verification in the authorization request.
              #
              #   @param result [Symbol, Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress::Result] The address verification result returned to the card network.

              # The address verification result returned to the card network.
              #
              # @see Increase::Models::DeclinedTransaction::Source::CardDecline::Verification::CardholderAddress#result
              module Result
                extend Increase::Internal::Type::Enum

                # No address information was provided in the authorization request.
                NOT_CHECKED = :not_checked

                # Postal code matches, but the street address does not match or was not provided.
                POSTAL_CODE_MATCH_ADDRESS_NO_MATCH = :postal_code_match_address_no_match

                # Postal code does not match, but the street address matches or was not provided.
                POSTAL_CODE_NO_MATCH_ADDRESS_MATCH = :postal_code_no_match_address_match

                # Postal code and street address match.
                MATCH = :match

                # Postal code and street address do not match.
                NO_MATCH = :no_match

                # Postal code matches, but the street address was not verified. (deprecated)
                POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED = :postal_code_match_address_not_checked

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end
        end

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        #
        # @see Increase::Models::DeclinedTransaction::Source#category
        module Category
          extend Increase::Internal::Type::Enum

          # ACH Decline: details will be under the `ach_decline` object.
          ACH_DECLINE = :ach_decline

          # Card Decline: details will be under the `card_decline` object.
          CARD_DECLINE = :card_decline

          # Check Decline: details will be under the `check_decline` object.
          CHECK_DECLINE = :check_decline

          # Inbound Real-Time Payments Transfer Decline: details will be under the `inbound_real_time_payments_transfer_decline` object.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_DECLINE = :inbound_real_time_payments_transfer_decline

          # Inbound FedNow Transfer Decline: details will be under the `inbound_fednow_transfer_decline` object.
          INBOUND_FEDNOW_TRANSFER_DECLINE = :inbound_fednow_transfer_decline

          # Wire Decline: details will be under the `wire_decline` object.
          WIRE_DECLINE = :wire_decline

          # Check Deposit Rejection: details will be under the `check_deposit_rejection` object.
          CHECK_DEPOSIT_REJECTION = :check_deposit_rejection

          # The Declined Transaction was made for an undocumented or deprecated reason.
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::DeclinedTransaction::Source#check_decline
        class CheckDecline < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The declined amount in USD cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute auxiliary_on_us
          #   A computer-readable number printed on the MICR line of business checks, usually
          #   the check number. This is useful for positive pay checks, but can be unreliably
          #   transmitted by the bank of first deposit.
          #
          #   @return [String, nil]
          required :auxiliary_on_us, String, nil?: true

          # @!attribute back_image_file_id
          #   The identifier of the API File object containing an image of the back of the
          #   declined check.
          #
          #   @return [String, nil]
          required :back_image_file_id, String, nil?: true

          # @!attribute check_transfer_id
          #   The identifier of the Check Transfer object associated with this decline.
          #
          #   @return [String, nil]
          required :check_transfer_id, String, nil?: true

          # @!attribute front_image_file_id
          #   The identifier of the API File object containing an image of the front of the
          #   declined check.
          #
          #   @return [String, nil]
          required :front_image_file_id, String, nil?: true

          # @!attribute inbound_check_deposit_id
          #   The identifier of the Inbound Check Deposit object associated with this decline.
          #
          #   @return [String, nil]
          required :inbound_check_deposit_id, String, nil?: true

          # @!attribute reason
          #   Why the check was declined.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason]
          required :reason, enum: -> { Increase::DeclinedTransaction::Source::CheckDecline::Reason }

          # @!method initialize(amount:, auxiliary_on_us:, back_image_file_id:, check_transfer_id:, front_image_file_id:, inbound_check_deposit_id:, reason:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::DeclinedTransaction::Source::CheckDecline} for more details.
          #
          #   A Check Decline object. This field will be present in the JSON response if and
          #   only if `category` is equal to `check_decline`.
          #
          #   @param amount [Integer] The declined amount in USD cents.
          #
          #   @param auxiliary_on_us [String, nil] A computer-readable number printed on the MICR line of business checks, usually
          #
          #   @param back_image_file_id [String, nil] The identifier of the API File object containing an image of the back of the dec
          #
          #   @param check_transfer_id [String, nil] The identifier of the Check Transfer object associated with this decline.
          #
          #   @param front_image_file_id [String, nil] The identifier of the API File object containing an image of the front of the de
          #
          #   @param inbound_check_deposit_id [String, nil] The identifier of the Inbound Check Deposit object associated with this decline.
          #
          #   @param reason [Symbol, Increase::Models::DeclinedTransaction::Source::CheckDecline::Reason] Why the check was declined.

          # Why the check was declined.
          #
          # @see Increase::Models::DeclinedTransaction::Source::CheckDecline#reason
          module Reason
            extend Increase::Internal::Type::Enum

            # The account number is disabled.
            ACH_ROUTE_DISABLED = :ach_route_disabled

            # The account number is canceled.
            ACH_ROUTE_CANCELED = :ach_route_canceled

            # The deposited check was altered or fictitious.
            ALTERED_OR_FICTITIOUS = :altered_or_fictitious

            # The transaction would cause a limit to be exceeded.
            BREACHES_LIMIT = :breaches_limit

            # The check was not endorsed by the payee.
            ENDORSEMENT_IRREGULAR = :endorsement_irregular

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE = :entity_not_active

            # Your account is inactive.
            GROUP_LOCKED = :group_locked

            # Your account contains insufficient funds.
            INSUFFICIENT_FUNDS = :insufficient_funds

            # Stop payment requested for this check.
            STOP_PAYMENT_REQUESTED = :stop_payment_requested

            # The check was a duplicate deposit.
            DUPLICATE_PRESENTMENT = :duplicate_presentment

            # The check was not authorized.
            NOT_AUTHORIZED = :not_authorized

            # The amount the receiving bank is attempting to deposit does not match the amount on the check.
            AMOUNT_MISMATCH = :amount_mismatch

            # The check attempting to be deposited does not belong to Increase.
            NOT_OUR_ITEM = :not_our_item

            # The account number on the check does not exist at Increase.
            NO_ACCOUNT_NUMBER_FOUND = :no_account_number_found

            # The check is not readable. Please refer to the image.
            REFER_TO_IMAGE = :refer_to_image

            # The check cannot be processed. This is rare: please contact support.
            UNABLE_TO_PROCESS = :unable_to_process

            # The check image is unusable.
            UNUSABLE_IMAGE = :unusable_image

            # Your integration declined this check via the API.
            USER_INITIATED = :user_initiated

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::DeclinedTransaction::Source#check_deposit_rejection
        class CheckDepositRejection < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The rejected amount in the minor unit of check's currency. For dollars, for
          #   example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute check_deposit_id
          #   The identifier of the Check Deposit that was rejected.
          #
          #   @return [String]
          required :check_deposit_id, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
          #   currency.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency]
          required :currency, enum: -> { Increase::DeclinedTransaction::Source::CheckDepositRejection::Currency }

          # @!attribute declined_transaction_id
          #   The identifier of the associated declined transaction.
          #
          #   @return [String]
          required :declined_transaction_id, String

          # @!attribute reason
          #   Why the check deposit was rejected.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason]
          required :reason, enum: -> { Increase::DeclinedTransaction::Source::CheckDepositRejection::Reason }

          # @!attribute rejected_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the check deposit was rejected.
          #
          #   @return [Time]
          required :rejected_at, Time

          # @!method initialize(amount:, check_deposit_id:, currency:, declined_transaction_id:, reason:, rejected_at:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::DeclinedTransaction::Source::CheckDepositRejection} for more
          #   details.
          #
          #   A Check Deposit Rejection object. This field will be present in the JSON
          #   response if and only if `category` is equal to `check_deposit_rejection`.
          #
          #   @param amount [Integer] The rejected amount in the minor unit of check's currency. For dollars, for exam
          #
          #   @param check_deposit_id [String] The identifier of the Check Deposit that was rejected.
          #
          #   @param currency [Symbol, Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's curr
          #
          #   @param declined_transaction_id [String] The identifier of the associated declined transaction.
          #
          #   @param reason [Symbol, Increase::Models::DeclinedTransaction::Source::CheckDepositRejection::Reason] Why the check deposit was rejected.
          #
          #   @param rejected_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
          # currency.
          #
          # @see Increase::Models::DeclinedTransaction::Source::CheckDepositRejection#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Why the check deposit was rejected.
          #
          # @see Increase::Models::DeclinedTransaction::Source::CheckDepositRejection#reason
          module Reason
            extend Increase::Internal::Type::Enum

            # The check's image is incomplete.
            INCOMPLETE_IMAGE = :incomplete_image

            # This is a duplicate check submission.
            DUPLICATE = :duplicate

            # This check has poor image quality.
            POOR_IMAGE_QUALITY = :poor_image_quality

            # The check was deposited with the incorrect amount.
            INCORRECT_AMOUNT = :incorrect_amount

            # The check is made out to someone other than the account holder.
            INCORRECT_RECIPIENT = :incorrect_recipient

            # This check was not eligible for mobile deposit.
            NOT_ELIGIBLE_FOR_MOBILE_DEPOSIT = :not_eligible_for_mobile_deposit

            # This check is missing at least one required field.
            MISSING_REQUIRED_DATA_ELEMENTS = :missing_required_data_elements

            # This check is suspected to be fraudulent.
            SUSPECTED_FRAUD = :suspected_fraud

            # This check's deposit window has expired.
            DEPOSIT_WINDOW_EXPIRED = :deposit_window_expired

            # The check was rejected at the user's request.
            REQUESTED_BY_USER = :requested_by_user

            # The check was rejected for an unknown reason.
            UNKNOWN = :unknown

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::DeclinedTransaction::Source#inbound_fednow_transfer_decline
        class InboundFednowTransferDecline < Increase::Internal::Type::BaseModel
          # @!attribute reason
          #   Why the transfer was declined.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason]
          required :reason, enum: -> { Increase::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason }

          # @!attribute transfer_id
          #   The identifier of the FedNow Transfer that led to this declined transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(reason:, transfer_id:)
          #   An Inbound FedNow Transfer Decline object. This field will be present in the
          #   JSON response if and only if `category` is equal to
          #   `inbound_fednow_transfer_decline`.
          #
          #   @param reason [Symbol, Increase::Models::DeclinedTransaction::Source::InboundFednowTransferDecline::Reason] Why the transfer was declined.
          #
          #   @param transfer_id [String] The identifier of the FedNow Transfer that led to this declined transaction.

          # Why the transfer was declined.
          #
          # @see Increase::Models::DeclinedTransaction::Source::InboundFednowTransferDecline#reason
          module Reason
            extend Increase::Internal::Type::Enum

            # The account number is canceled.
            ACCOUNT_NUMBER_CANCELED = :account_number_canceled

            # The account number is disabled.
            ACCOUNT_NUMBER_DISABLED = :account_number_disabled

            # Your account is restricted.
            ACCOUNT_RESTRICTED = :account_restricted

            # Your account is inactive.
            GROUP_LOCKED = :group_locked

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE = :entity_not_active

            # Your account is not enabled to receive FedNow transfers.
            FEDNOW_NOT_ENABLED = :fednow_not_enabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::DeclinedTransaction::Source#inbound_real_time_payments_transfer_decline
        class InboundRealTimePaymentsTransferDecline < Increase::Internal::Type::BaseModel
          # @!attribute amount
          #   The declined amount in the minor unit of the destination account currency. For
          #   dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute creditor_name
          #   The name the sender of the transfer specified as the recipient of the transfer.
          #
          #   @return [String]
          required :creditor_name, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the declined
          #   transfer's currency. This will always be "USD" for a Real-Time Payments
          #   transfer.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency]
          required :currency,
                   enum: -> { Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency }

          # @!attribute debtor_account_number
          #   The account number of the account that sent the transfer.
          #
          #   @return [String]
          required :debtor_account_number, String

          # @!attribute debtor_name
          #   The name provided by the sender of the transfer.
          #
          #   @return [String]
          required :debtor_name, String

          # @!attribute debtor_routing_number
          #   The routing number of the account that sent the transfer.
          #
          #   @return [String]
          required :debtor_routing_number, String

          # @!attribute reason
          #   Why the transfer was declined.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason]
          required :reason,
                   enum: -> { Increase::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason }

          # @!attribute remittance_information
          #   Additional information included with the transfer.
          #
          #   @return [String, nil]
          required :remittance_information, String, nil?: true

          # @!attribute transaction_identification
          #   The Real-Time Payments network identification of the declined transfer.
          #
          #   @return [String]
          required :transaction_identification, String

          # @!attribute transfer_id
          #   The identifier of the Real-Time Payments Transfer that led to this Transaction.
          #
          #   @return [String]
          required :transfer_id, String

          # @!method initialize(amount:, creditor_name:, currency:, debtor_account_number:, debtor_name:, debtor_routing_number:, reason:, remittance_information:, transaction_identification:, transfer_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline}
          #   for more details.
          #
          #   An Inbound Real-Time Payments Transfer Decline object. This field will be
          #   present in the JSON response if and only if `category` is equal to
          #   `inbound_real_time_payments_transfer_decline`.
          #
          #   @param amount [Integer] The declined amount in the minor unit of the destination account currency. For d
          #
          #   @param creditor_name [String] The name the sender of the transfer specified as the recipient of the transfer.
          #
          #   @param currency [Symbol, Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the declined tran
          #
          #   @param debtor_account_number [String] The account number of the account that sent the transfer.
          #
          #   @param debtor_name [String] The name provided by the sender of the transfer.
          #
          #   @param debtor_routing_number [String] The routing number of the account that sent the transfer.
          #
          #   @param reason [Symbol, Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline::Reason] Why the transfer was declined.
          #
          #   @param remittance_information [String, nil] Additional information included with the transfer.
          #
          #   @param transaction_identification [String] The Real-Time Payments network identification of the declined transfer.
          #
          #   @param transfer_id [String] The identifier of the Real-Time Payments Transfer that led to this Transaction.

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the declined
          # transfer's currency. This will always be "USD" for a Real-Time Payments
          # transfer.
          #
          # @see Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Why the transfer was declined.
          #
          # @see Increase::Models::DeclinedTransaction::Source::InboundRealTimePaymentsTransferDecline#reason
          module Reason
            extend Increase::Internal::Type::Enum

            # The account number is canceled.
            ACCOUNT_NUMBER_CANCELED = :account_number_canceled

            # The account number is disabled.
            ACCOUNT_NUMBER_DISABLED = :account_number_disabled

            # Your account is restricted.
            ACCOUNT_RESTRICTED = :account_restricted

            # Your account is inactive.
            GROUP_LOCKED = :group_locked

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE = :entity_not_active

            # Your account is not enabled to receive Real-Time Payments transfers.
            REAL_TIME_PAYMENTS_NOT_ENABLED = :real_time_payments_not_enabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::DeclinedTransaction::Source#wire_decline
        class WireDecline < Increase::Internal::Type::BaseModel
          # @!attribute inbound_wire_transfer_id
          #   The identifier of the Inbound Wire Transfer that was declined.
          #
          #   @return [String]
          required :inbound_wire_transfer_id, String

          # @!attribute reason
          #   Why the wire transfer was declined.
          #
          #   @return [Symbol, Increase::Models::DeclinedTransaction::Source::WireDecline::Reason]
          required :reason, enum: -> { Increase::DeclinedTransaction::Source::WireDecline::Reason }

          # @!method initialize(inbound_wire_transfer_id:, reason:)
          #   A Wire Decline object. This field will be present in the JSON response if and
          #   only if `category` is equal to `wire_decline`.
          #
          #   @param inbound_wire_transfer_id [String] The identifier of the Inbound Wire Transfer that was declined.
          #
          #   @param reason [Symbol, Increase::Models::DeclinedTransaction::Source::WireDecline::Reason] Why the wire transfer was declined.

          # Why the wire transfer was declined.
          #
          # @see Increase::Models::DeclinedTransaction::Source::WireDecline#reason
          module Reason
            extend Increase::Internal::Type::Enum

            # The account number is canceled.
            ACCOUNT_NUMBER_CANCELED = :account_number_canceled

            # The account number is disabled.
            ACCOUNT_NUMBER_DISABLED = :account_number_disabled

            # The account's entity is not active.
            ENTITY_NOT_ACTIVE = :entity_not_active

            # Your account is inactive.
            GROUP_LOCKED = :group_locked

            # The beneficiary account number does not exist.
            NO_ACCOUNT_NUMBER = :no_account_number

            # The transaction is not allowed per Increase's terms.
            TRANSACTION_NOT_ALLOWED = :transaction_not_allowed

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `declined_transaction`.
      #
      # @see Increase::Models::DeclinedTransaction#type
      module Type
        extend Increase::Internal::Type::Enum

        DECLINED_TRANSACTION = :declined_transaction

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
