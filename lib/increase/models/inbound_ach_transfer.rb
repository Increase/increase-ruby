# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundACHTransfers#retrieve
    class InboundACHTransfer < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The inbound ACH transfer's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute acceptance
      #   If your transfer is accepted, this will contain details of the acceptance.
      #
      #   @return [Increase::Models::InboundACHTransfer::Acceptance, nil]
      required :acceptance, -> { Increase::InboundACHTransfer::Acceptance }, nil?: true

      # @!attribute account_id
      #   The Account to which the transfer belongs.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute account_number_id
      #   The identifier of the Account Number to which this transfer was sent.
      #
      #   @return [String]
      required :account_number_id, String

      # @!attribute addenda
      #   Additional information sent from the originator.
      #
      #   @return [Increase::Models::InboundACHTransfer::Addenda, nil]
      required :addenda, -> { Increase::InboundACHTransfer::Addenda }, nil?: true

      # @!attribute amount
      #   The transfer amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute automatically_resolves_at
      #   The time at which the transfer will be automatically resolved.
      #
      #   @return [Time]
      required :automatically_resolves_at, Time

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the inbound ACH transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute decline
      #   If your transfer is declined, this will contain details of the decline.
      #
      #   @return [Increase::Models::InboundACHTransfer::Decline, nil]
      required :decline, -> { Increase::InboundACHTransfer::Decline }, nil?: true

      # @!attribute direction
      #   The direction of the transfer.
      #
      #   @return [Symbol, Increase::Models::InboundACHTransfer::Direction]
      required :direction, enum: -> { Increase::InboundACHTransfer::Direction }

      # @!attribute effective_date
      #   The effective date of the transfer. This is sent by the sending bank and is a
      #   factor in determining funds availability.
      #
      #   @return [Date]
      required :effective_date, Date

      # @!attribute expected_settlement_schedule
      #   The settlement schedule the transfer is expected to follow.
      #
      #   @return [Symbol, Increase::Models::InboundACHTransfer::ExpectedSettlementSchedule]
      required :expected_settlement_schedule,
               enum: -> { Increase::InboundACHTransfer::ExpectedSettlementSchedule }

      # @!attribute international_addenda
      #   If the Inbound ACH Transfer has a Standard Entry Class Code of IAT, this will
      #   contain fields pertaining to the International ACH Transaction.
      #
      #   @return [Increase::Models::InboundACHTransfer::InternationalAddenda, nil]
      required :international_addenda, -> { Increase::InboundACHTransfer::InternationalAddenda }, nil?: true

      # @!attribute notification_of_change
      #   If you initiate a notification of change in response to the transfer, this will
      #   contain its details.
      #
      #   @return [Increase::Models::InboundACHTransfer::NotificationOfChange, nil]
      required :notification_of_change, -> { Increase::InboundACHTransfer::NotificationOfChange }, nil?: true

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

      # @!attribute originator_company_entry_description
      #   The description of the transfer.
      #
      #   @return [String]
      required :originator_company_entry_description, String

      # @!attribute originator_company_id
      #   The id of the company that initiated the transfer.
      #
      #   @return [String]
      required :originator_company_id, String

      # @!attribute originator_company_name
      #   The name of the company that initiated the transfer.
      #
      #   @return [String]
      required :originator_company_name, String

      # @!attribute originator_routing_number
      #   The American Banking Association (ABA) routing number of the bank originating
      #   the transfer.
      #
      #   @return [String]
      required :originator_routing_number, String

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

      # @!attribute standard_entry_class_code
      #   The Standard Entry Class (SEC) code of the transfer.
      #
      #   @return [Symbol, Increase::Models::InboundACHTransfer::StandardEntryClassCode]
      required :standard_entry_class_code, enum: -> { Increase::InboundACHTransfer::StandardEntryClassCode }

      # @!attribute status
      #   The status of the transfer.
      #
      #   @return [Symbol, Increase::Models::InboundACHTransfer::Status]
      required :status, enum: -> { Increase::InboundACHTransfer::Status }

      # @!attribute trace_number
      #   A 15 digit number set by the sending bank and transmitted to the receiving bank.
      #   Along with the amount, date, and originating routing number, this can be used to
      #   identify the ACH transfer. ACH trace numbers are not unique, but are
      #   [used to correlate returns](https://increase.com/documentation/ach-returns#ach-returns).
      #
      #   @return [String]
      required :trace_number, String

      # @!attribute transfer_return
      #   If your transfer is returned, this will contain details of the return.
      #
      #   @return [Increase::Models::InboundACHTransfer::TransferReturn, nil]
      required :transfer_return, -> { Increase::InboundACHTransfer::TransferReturn }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `inbound_ach_transfer`.
      #
      #   @return [Symbol, Increase::Models::InboundACHTransfer::Type]
      required :type, enum: -> { Increase::InboundACHTransfer::Type }

      # @!method initialize(id:, acceptance:, account_id:, account_number_id:, addenda:, amount:, automatically_resolves_at:, created_at:, decline:, direction:, effective_date:, expected_settlement_schedule:, international_addenda:, notification_of_change:, originator_company_descriptive_date:, originator_company_discretionary_data:, originator_company_entry_description:, originator_company_id:, originator_company_name:, originator_routing_number:, receiver_id_number:, receiver_name:, standard_entry_class_code:, status:, trace_number:, transfer_return:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::InboundACHTransfer} for more details.
      #
      #   An Inbound ACH Transfer is an ACH transfer initiated outside of Increase to your
      #   account.
      #
      #   @param id [String] The inbound ACH transfer's identifier.
      #
      #   @param acceptance [Increase::Models::InboundACHTransfer::Acceptance, nil] If your transfer is accepted, this will contain details of the acceptance.
      #
      #   @param account_id [String] The Account to which the transfer belongs.
      #
      #   @param account_number_id [String] The identifier of the Account Number to which this transfer was sent.
      #
      #   @param addenda [Increase::Models::InboundACHTransfer::Addenda, nil] Additional information sent from the originator.
      #
      #   @param amount [Integer] The transfer amount in USD cents.
      #
      #   @param automatically_resolves_at [Time] The time at which the transfer will be automatically resolved.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param decline [Increase::Models::InboundACHTransfer::Decline, nil] If your transfer is declined, this will contain details of the decline.
      #
      #   @param direction [Symbol, Increase::Models::InboundACHTransfer::Direction] The direction of the transfer.
      #
      #   @param effective_date [Date] The effective date of the transfer. This is sent by the sending bank and is a fa
      #
      #   @param expected_settlement_schedule [Symbol, Increase::Models::InboundACHTransfer::ExpectedSettlementSchedule] The settlement schedule the transfer is expected to follow.
      #
      #   @param international_addenda [Increase::Models::InboundACHTransfer::InternationalAddenda, nil] If the Inbound ACH Transfer has a Standard Entry Class Code of IAT, this will co
      #
      #   @param notification_of_change [Increase::Models::InboundACHTransfer::NotificationOfChange, nil] If you initiate a notification of change in response to the transfer, this will
      #
      #   @param originator_company_descriptive_date [String, nil] The descriptive date of the transfer.
      #
      #   @param originator_company_discretionary_data [String, nil] The additional information included with the transfer.
      #
      #   @param originator_company_entry_description [String] The description of the transfer.
      #
      #   @param originator_company_id [String] The id of the company that initiated the transfer.
      #
      #   @param originator_company_name [String] The name of the company that initiated the transfer.
      #
      #   @param originator_routing_number [String] The American Banking Association (ABA) routing number of the bank originating th
      #
      #   @param receiver_id_number [String, nil] The id of the receiver of the transfer.
      #
      #   @param receiver_name [String, nil] The name of the receiver of the transfer.
      #
      #   @param standard_entry_class_code [Symbol, Increase::Models::InboundACHTransfer::StandardEntryClassCode] The Standard Entry Class (SEC) code of the transfer.
      #
      #   @param status [Symbol, Increase::Models::InboundACHTransfer::Status] The status of the transfer.
      #
      #   @param trace_number [String] A 15 digit number set by the sending bank and transmitted to the receiving bank.
      #
      #   @param transfer_return [Increase::Models::InboundACHTransfer::TransferReturn, nil] If your transfer is returned, this will contain details of the return.
      #
      #   @param type [Symbol, Increase::Models::InboundACHTransfer::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::InboundACHTransfer#acceptance
      class Acceptance < Increase::Internal::Type::BaseModel
        # @!attribute accepted_at
        #   The time at which the transfer was accepted.
        #
        #   @return [Time]
        required :accepted_at, Time

        # @!attribute transaction_id
        #   The id of the transaction for the accepted transfer.
        #
        #   @return [String]
        required :transaction_id, String

        # @!method initialize(accepted_at:, transaction_id:)
        #   If your transfer is accepted, this will contain details of the acceptance.
        #
        #   @param accepted_at [Time] The time at which the transfer was accepted.
        #
        #   @param transaction_id [String] The id of the transaction for the accepted transfer.
      end

      # @see Increase::Models::InboundACHTransfer#addenda
      class Addenda < Increase::Internal::Type::BaseModel
        # @!attribute category
        #   The type of addendum.
        #
        #   @return [Symbol, Increase::Models::InboundACHTransfer::Addenda::Category]
        required :category, enum: -> { Increase::InboundACHTransfer::Addenda::Category }

        # @!attribute freeform
        #   Unstructured `payment_related_information` passed through by the originator.
        #
        #   @return [Increase::Models::InboundACHTransfer::Addenda::Freeform, nil]
        required :freeform, -> { Increase::InboundACHTransfer::Addenda::Freeform }, nil?: true

        # @!method initialize(category:, freeform:)
        #   Additional information sent from the originator.
        #
        #   @param category [Symbol, Increase::Models::InboundACHTransfer::Addenda::Category] The type of addendum.
        #
        #   @param freeform [Increase::Models::InboundACHTransfer::Addenda::Freeform, nil] Unstructured `payment_related_information` passed through by the originator.

        # The type of addendum.
        #
        # @see Increase::Models::InboundACHTransfer::Addenda#category
        module Category
          extend Increase::Internal::Type::Enum

          # Unstructured addendum.
          FREEFORM = :freeform

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::InboundACHTransfer::Addenda#freeform
        class Freeform < Increase::Internal::Type::BaseModel
          # @!attribute entries
          #   Each entry represents an addendum received from the originator.
          #
          #   @return [Array<Increase::Models::InboundACHTransfer::Addenda::Freeform::Entry>]
          required :entries,
                   -> {
                     Increase::Internal::Type::ArrayOf[Increase::InboundACHTransfer::Addenda::Freeform::Entry]
                   }

          # @!method initialize(entries:)
          #   Unstructured `payment_related_information` passed through by the originator.
          #
          #   @param entries [Array<Increase::Models::InboundACHTransfer::Addenda::Freeform::Entry>] Each entry represents an addendum received from the originator.

          class Entry < Increase::Internal::Type::BaseModel
            # @!attribute payment_related_information
            #   The payment related information passed in the addendum.
            #
            #   @return [String]
            required :payment_related_information, String

            # @!method initialize(payment_related_information:)
            #   @param payment_related_information [String] The payment related information passed in the addendum.
          end
        end
      end

      # @see Increase::Models::InboundACHTransfer#decline
      class Decline < Increase::Internal::Type::BaseModel
        # @!attribute declined_at
        #   The time at which the transfer was declined.
        #
        #   @return [Time]
        required :declined_at, Time

        # @!attribute declined_transaction_id
        #   The id of the transaction for the declined transfer.
        #
        #   @return [String]
        required :declined_transaction_id, String

        # @!attribute reason
        #   The reason for the transfer decline.
        #
        #   @return [Symbol, Increase::Models::InboundACHTransfer::Decline::Reason]
        required :reason, enum: -> { Increase::InboundACHTransfer::Decline::Reason }

        # @!method initialize(declined_at:, declined_transaction_id:, reason:)
        #   If your transfer is declined, this will contain details of the decline.
        #
        #   @param declined_at [Time] The time at which the transfer was declined.
        #
        #   @param declined_transaction_id [String] The id of the transaction for the declined transfer.
        #
        #   @param reason [Symbol, Increase::Models::InboundACHTransfer::Decline::Reason] The reason for the transfer decline.

        # The reason for the transfer decline.
        #
        # @see Increase::Models::InboundACHTransfer::Decline#reason
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
      end

      # The direction of the transfer.
      #
      # @see Increase::Models::InboundACHTransfer#direction
      module Direction
        extend Increase::Internal::Type::Enum

        # Credit
        CREDIT = :credit

        # Debit
        DEBIT = :debit

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The settlement schedule the transfer is expected to follow.
      #
      # @see Increase::Models::InboundACHTransfer#expected_settlement_schedule
      module ExpectedSettlementSchedule
        extend Increase::Internal::Type::Enum

        # The transfer is expected to settle same-day.
        SAME_DAY = :same_day

        # The transfer is expected to settle on a future date.
        FUTURE_DATED = :future_dated

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::InboundACHTransfer#international_addenda
      class InternationalAddenda < Increase::Internal::Type::BaseModel
        # @!attribute destination_country_code
        #   The [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2
        #   country code of the destination country.
        #
        #   @return [String]
        required :destination_country_code, String

        # @!attribute destination_currency_code
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the
        #   destination bank account.
        #
        #   @return [String]
        required :destination_currency_code, String

        # @!attribute foreign_exchange_indicator
        #   A description of how the foreign exchange rate was calculated.
        #
        #   @return [Symbol, Increase::Models::InboundACHTransfer::InternationalAddenda::ForeignExchangeIndicator]
        required :foreign_exchange_indicator,
                 enum: -> { Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeIndicator }

        # @!attribute foreign_exchange_reference
        #   Depending on the `foreign_exchange_reference_indicator`, an exchange rate or a
        #   reference to a well-known rate.
        #
        #   @return [String, nil]
        required :foreign_exchange_reference, String, nil?: true

        # @!attribute foreign_exchange_reference_indicator
        #   An instruction of how to interpret the `foreign_exchange_reference` field for
        #   this Transaction.
        #
        #   @return [Symbol, Increase::Models::InboundACHTransfer::InternationalAddenda::ForeignExchangeReferenceIndicator]
        required :foreign_exchange_reference_indicator,
                 enum: -> {
                   Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeReferenceIndicator
                 }

        # @!attribute foreign_payment_amount
        #   The amount in the minor unit of the foreign payment currency. For dollars, for
        #   example, this is cents.
        #
        #   @return [Integer]
        required :foreign_payment_amount, Integer

        # @!attribute foreign_trace_number
        #   A reference number in the foreign banking infrastructure.
        #
        #   @return [String, nil]
        required :foreign_trace_number, String, nil?: true

        # @!attribute international_transaction_type_code
        #   The type of transfer. Set by the originator.
        #
        #   @return [Symbol, Increase::Models::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode]
        required :international_transaction_type_code,
                 enum: -> {
                   Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode
                 }

        # @!attribute originating_currency_code
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the
        #   originating bank account.
        #
        #   @return [String]
        required :originating_currency_code, String

        # @!attribute originating_depository_financial_institution_branch_country
        #   The [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2
        #   country code of the originating branch country.
        #
        #   @return [String]
        required :originating_depository_financial_institution_branch_country, String

        # @!attribute originating_depository_financial_institution_id
        #   An identifier for the originating bank. One of an International Bank Account
        #   Number (IBAN) bank identifier, SWIFT Bank Identification Code (BIC), or a
        #   domestic identifier like a US Routing Number.
        #
        #   @return [String]
        required :originating_depository_financial_institution_id, String

        # @!attribute originating_depository_financial_institution_id_qualifier
        #   An instruction of how to interpret the
        #   `originating_depository_financial_institution_id` field for this Transaction.
        #
        #   @return [Symbol, Increase::Models::InboundACHTransfer::InternationalAddenda::OriginatingDepositoryFinancialInstitutionIDQualifier]
        required :originating_depository_financial_institution_id_qualifier,
                 enum: -> {
                   Increase::InboundACHTransfer::InternationalAddenda::OriginatingDepositoryFinancialInstitutionIDQualifier
                 }

        # @!attribute originating_depository_financial_institution_name
        #   The name of the originating bank. Sometimes this will refer to an American bank
        #   and obscure the correspondent foreign bank.
        #
        #   @return [String]
        required :originating_depository_financial_institution_name, String

        # @!attribute originator_city
        #   A portion of the originator address. This may be incomplete.
        #
        #   @return [String]
        required :originator_city, String

        # @!attribute originator_country
        #   A portion of the originator address. The
        #   [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2 country
        #   code of the originator country.
        #
        #   @return [String]
        required :originator_country, String

        # @!attribute originator_identification
        #   An identifier for the originating company. This is generally stable across
        #   multiple ACH transfers.
        #
        #   @return [String]
        required :originator_identification, String

        # @!attribute originator_name
        #   Either the name of the originator or an intermediary money transmitter.
        #
        #   @return [String]
        required :originator_name, String

        # @!attribute originator_postal_code
        #   A portion of the originator address. This may be incomplete.
        #
        #   @return [String, nil]
        required :originator_postal_code, String, nil?: true

        # @!attribute originator_state_or_province
        #   A portion of the originator address. This may be incomplete.
        #
        #   @return [String, nil]
        required :originator_state_or_province, String, nil?: true

        # @!attribute originator_street_address
        #   A portion of the originator address. This may be incomplete.
        #
        #   @return [String]
        required :originator_street_address, String

        # @!attribute payment_related_information
        #   A description field set by the originator.
        #
        #   @return [String, nil]
        required :payment_related_information, String, nil?: true

        # @!attribute payment_related_information2
        #   A description field set by the originator.
        #
        #   @return [String, nil]
        required :payment_related_information2, String, nil?: true

        # @!attribute receiver_city
        #   A portion of the receiver address. This may be incomplete.
        #
        #   @return [String]
        required :receiver_city, String

        # @!attribute receiver_country
        #   A portion of the receiver address. The
        #   [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2 country
        #   code of the receiver country.
        #
        #   @return [String]
        required :receiver_country, String

        # @!attribute receiver_identification_number
        #   An identification number the originator uses for the receiver.
        #
        #   @return [String, nil]
        required :receiver_identification_number, String, nil?: true

        # @!attribute receiver_postal_code
        #   A portion of the receiver address. This may be incomplete.
        #
        #   @return [String, nil]
        required :receiver_postal_code, String, nil?: true

        # @!attribute receiver_state_or_province
        #   A portion of the receiver address. This may be incomplete.
        #
        #   @return [String, nil]
        required :receiver_state_or_province, String, nil?: true

        # @!attribute receiver_street_address
        #   A portion of the receiver address. This may be incomplete.
        #
        #   @return [String]
        required :receiver_street_address, String

        # @!attribute receiving_company_or_individual_name
        #   The name of the receiver of the transfer. This is not verified by Increase.
        #
        #   @return [String]
        required :receiving_company_or_individual_name, String

        # @!attribute receiving_depository_financial_institution_country
        #   The [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2
        #   country code of the receiving bank country.
        #
        #   @return [String]
        required :receiving_depository_financial_institution_country, String

        # @!attribute receiving_depository_financial_institution_id
        #   An identifier for the receiving bank. One of an International Bank Account
        #   Number (IBAN) bank identifier, SWIFT Bank Identification Code (BIC), or a
        #   domestic identifier like a US Routing Number.
        #
        #   @return [String]
        required :receiving_depository_financial_institution_id, String

        # @!attribute receiving_depository_financial_institution_id_qualifier
        #   An instruction of how to interpret the
        #   `receiving_depository_financial_institution_id` field for this Transaction.
        #
        #   @return [Symbol, Increase::Models::InboundACHTransfer::InternationalAddenda::ReceivingDepositoryFinancialInstitutionIDQualifier]
        required :receiving_depository_financial_institution_id_qualifier,
                 enum: -> {
                   Increase::InboundACHTransfer::InternationalAddenda::ReceivingDepositoryFinancialInstitutionIDQualifier
                 }

        # @!attribute receiving_depository_financial_institution_name
        #   The name of the receiving bank, as set by the sending financial institution.
        #
        #   @return [String]
        required :receiving_depository_financial_institution_name, String

        # @!method initialize(destination_country_code:, destination_currency_code:, foreign_exchange_indicator:, foreign_exchange_reference:, foreign_exchange_reference_indicator:, foreign_payment_amount:, foreign_trace_number:, international_transaction_type_code:, originating_currency_code:, originating_depository_financial_institution_branch_country:, originating_depository_financial_institution_id:, originating_depository_financial_institution_id_qualifier:, originating_depository_financial_institution_name:, originator_city:, originator_country:, originator_identification:, originator_name:, originator_postal_code:, originator_state_or_province:, originator_street_address:, payment_related_information:, payment_related_information2:, receiver_city:, receiver_country:, receiver_identification_number:, receiver_postal_code:, receiver_state_or_province:, receiver_street_address:, receiving_company_or_individual_name:, receiving_depository_financial_institution_country:, receiving_depository_financial_institution_id:, receiving_depository_financial_institution_id_qualifier:, receiving_depository_financial_institution_name:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::InboundACHTransfer::InternationalAddenda} for more details.
        #
        #   If the Inbound ACH Transfer has a Standard Entry Class Code of IAT, this will
        #   contain fields pertaining to the International ACH Transaction.
        #
        #   @param destination_country_code [String] The [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2 countr
        #
        #   @param destination_currency_code [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the des
        #
        #   @param foreign_exchange_indicator [Symbol, Increase::Models::InboundACHTransfer::InternationalAddenda::ForeignExchangeIndicator] A description of how the foreign exchange rate was calculated.
        #
        #   @param foreign_exchange_reference [String, nil] Depending on the `foreign_exchange_reference_indicator`, an exchange rate or a r
        #
        #   @param foreign_exchange_reference_indicator [Symbol, Increase::Models::InboundACHTransfer::InternationalAddenda::ForeignExchangeReferenceIndicator] An instruction of how to interpret the `foreign_exchange_reference` field for th
        #
        #   @param foreign_payment_amount [Integer] The amount in the minor unit of the foreign payment currency. For dollars, for e
        #
        #   @param foreign_trace_number [String, nil] A reference number in the foreign banking infrastructure.
        #
        #   @param international_transaction_type_code [Symbol, Increase::Models::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode] The type of transfer. Set by the originator.
        #
        #   @param originating_currency_code [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the ori
        #
        #   @param originating_depository_financial_institution_branch_country [String] The [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2 countr
        #
        #   @param originating_depository_financial_institution_id [String] An identifier for the originating bank. One of an International Bank Account Num
        #
        #   @param originating_depository_financial_institution_id_qualifier [Symbol, Increase::Models::InboundACHTransfer::InternationalAddenda::OriginatingDepositoryFinancialInstitutionIDQualifier] An instruction of how to interpret the `originating_depository_financial_institu
        #
        #   @param originating_depository_financial_institution_name [String] The name of the originating bank. Sometimes this will refer to an American bank
        #
        #   @param originator_city [String] A portion of the originator address. This may be incomplete.
        #
        #   @param originator_country [String] A portion of the originator address. The [ISO 3166](https://en.wikipedia.org/wik
        #
        #   @param originator_identification [String] An identifier for the originating company. This is generally stable across multi
        #
        #   @param originator_name [String] Either the name of the originator or an intermediary money transmitter.
        #
        #   @param originator_postal_code [String, nil] A portion of the originator address. This may be incomplete.
        #
        #   @param originator_state_or_province [String, nil] A portion of the originator address. This may be incomplete.
        #
        #   @param originator_street_address [String] A portion of the originator address. This may be incomplete.
        #
        #   @param payment_related_information [String, nil] A description field set by the originator.
        #
        #   @param payment_related_information2 [String, nil] A description field set by the originator.
        #
        #   @param receiver_city [String] A portion of the receiver address. This may be incomplete.
        #
        #   @param receiver_country [String] A portion of the receiver address. The [ISO 3166](https://en.wikipedia.org/wiki/
        #
        #   @param receiver_identification_number [String, nil] An identification number the originator uses for the receiver.
        #
        #   @param receiver_postal_code [String, nil] A portion of the receiver address. This may be incomplete.
        #
        #   @param receiver_state_or_province [String, nil] A portion of the receiver address. This may be incomplete.
        #
        #   @param receiver_street_address [String] A portion of the receiver address. This may be incomplete.
        #
        #   @param receiving_company_or_individual_name [String] The name of the receiver of the transfer. This is not verified by Increase.
        #
        #   @param receiving_depository_financial_institution_country [String] The [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2 countr
        #
        #   @param receiving_depository_financial_institution_id [String] An identifier for the receiving bank. One of an International Bank Account Numbe
        #
        #   @param receiving_depository_financial_institution_id_qualifier [Symbol, Increase::Models::InboundACHTransfer::InternationalAddenda::ReceivingDepositoryFinancialInstitutionIDQualifier] An instruction of how to interpret the `receiving_depository_financial_instituti
        #
        #   @param receiving_depository_financial_institution_name [String] The name of the receiving bank, as set by the sending financial institution.

        # A description of how the foreign exchange rate was calculated.
        #
        # @see Increase::Models::InboundACHTransfer::InternationalAddenda#foreign_exchange_indicator
        module ForeignExchangeIndicator
          extend Increase::Internal::Type::Enum

          # The originator chose an amount in their own currency. The settled amount in USD was converted using the exchange rate.
          FIXED_TO_VARIABLE = :fixed_to_variable

          # The originator chose an amount to settle in USD. The originator's amount was variable; known only after the foreign exchange conversion.
          VARIABLE_TO_FIXED = :variable_to_fixed

          # The amount was originated and settled as a fixed amount in USD. There is no foreign exchange conversion.
          FIXED_TO_FIXED = :fixed_to_fixed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # An instruction of how to interpret the `foreign_exchange_reference` field for
        # this Transaction.
        #
        # @see Increase::Models::InboundACHTransfer::InternationalAddenda#foreign_exchange_reference_indicator
        module ForeignExchangeReferenceIndicator
          extend Increase::Internal::Type::Enum

          # The ACH file contains a foreign exchange rate.
          FOREIGN_EXCHANGE_RATE = :foreign_exchange_rate

          # The ACH file contains a reference to a well-known foreign exchange rate.
          FOREIGN_EXCHANGE_REFERENCE_NUMBER = :foreign_exchange_reference_number

          # There is no foreign exchange for this transfer, so the `foreign_exchange_reference` field is blank.
          BLANK = :blank

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The type of transfer. Set by the originator.
        #
        # @see Increase::Models::InboundACHTransfer::InternationalAddenda#international_transaction_type_code
        module InternationalTransactionTypeCode
          extend Increase::Internal::Type::Enum

          # Sent as `ANN` in the Nacha file.
          ANNUITY = :annuity

          # Sent as `BUS` in the Nacha file.
          BUSINESS_OR_COMMERCIAL = :business_or_commercial

          # Sent as `DEP` in the Nacha file.
          DEPOSIT = :deposit

          # Sent as `LOA` in the Nacha file.
          LOAN = :loan

          # Sent as `MIS` in the Nacha file.
          MISCELLANEOUS = :miscellaneous

          # Sent as `MOR` in the Nacha file.
          MORTGAGE = :mortgage

          # Sent as `PEN` in the Nacha file.
          PENSION = :pension

          # Sent as `REM` in the Nacha file.
          REMITTANCE = :remittance

          # Sent as `RLS` in the Nacha file.
          RENT_OR_LEASE = :rent_or_lease

          # Sent as `SAL` in the Nacha file.
          SALARY_OR_PAYROLL = :salary_or_payroll

          # Sent as `TAX` in the Nacha file.
          TAX = :tax

          # Sent as `ARC` in the Nacha file.
          ACCOUNTS_RECEIVABLE = :accounts_receivable

          # Sent as `BOC` in the Nacha file.
          BACK_OFFICE_CONVERSION = :back_office_conversion

          # Sent as `MTE` in the Nacha file.
          MACHINE_TRANSFER = :machine_transfer

          # Sent as `POP` in the Nacha file.
          POINT_OF_PURCHASE = :point_of_purchase

          # Sent as `POS` in the Nacha file.
          POINT_OF_SALE = :point_of_sale

          # Sent as `RCK` in the Nacha file.
          REPRESENTED_CHECK = :represented_check

          # Sent as `SHR` in the Nacha file.
          SHARED_NETWORK_TRANSACTION = :shared_network_transaction

          # Sent as `TEL` in the Nacha file.
          TELPHONE_INITIATED = :telphone_initiated

          # Sent as `WEB` in the Nacha file.
          INTERNET_INITIATED = :internet_initiated

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # An instruction of how to interpret the
        # `originating_depository_financial_institution_id` field for this Transaction.
        #
        # @see Increase::Models::InboundACHTransfer::InternationalAddenda#originating_depository_financial_institution_id_qualifier
        module OriginatingDepositoryFinancialInstitutionIDQualifier
          extend Increase::Internal::Type::Enum

          # A domestic clearing system number. In the US, for example, this is the American Banking Association (ABA) routing number.
          NATIONAL_CLEARING_SYSTEM_NUMBER = :national_clearing_system_number

          # The SWIFT Bank Identifier Code (BIC) of the bank.
          BIC_CODE = :bic_code

          # An International Bank Account Number.
          IBAN = :iban

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # An instruction of how to interpret the
        # `receiving_depository_financial_institution_id` field for this Transaction.
        #
        # @see Increase::Models::InboundACHTransfer::InternationalAddenda#receiving_depository_financial_institution_id_qualifier
        module ReceivingDepositoryFinancialInstitutionIDQualifier
          extend Increase::Internal::Type::Enum

          # A domestic clearing system number. In the US, for example, this is the American Banking Association (ABA) routing number.
          NATIONAL_CLEARING_SYSTEM_NUMBER = :national_clearing_system_number

          # The SWIFT Bank Identifier Code (BIC) of the bank.
          BIC_CODE = :bic_code

          # An International Bank Account Number.
          IBAN = :iban

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::InboundACHTransfer#notification_of_change
      class NotificationOfChange < Increase::Internal::Type::BaseModel
        # @!attribute updated_account_number
        #   The new account number provided in the notification of change.
        #
        #   @return [String, nil]
        required :updated_account_number, String, nil?: true

        # @!attribute updated_routing_number
        #   The new account number provided in the notification of change.
        #
        #   @return [String, nil]
        required :updated_routing_number, String, nil?: true

        # @!method initialize(updated_account_number:, updated_routing_number:)
        #   If you initiate a notification of change in response to the transfer, this will
        #   contain its details.
        #
        #   @param updated_account_number [String, nil] The new account number provided in the notification of change.
        #
        #   @param updated_routing_number [String, nil] The new account number provided in the notification of change.
      end

      # The Standard Entry Class (SEC) code of the transfer.
      #
      # @see Increase::Models::InboundACHTransfer#standard_entry_class_code
      module StandardEntryClassCode
        extend Increase::Internal::Type::Enum

        # Corporate Credit and Debit (CCD).
        CORPORATE_CREDIT_OR_DEBIT = :corporate_credit_or_debit

        # Corporate Trade Exchange (CTX).
        CORPORATE_TRADE_EXCHANGE = :corporate_trade_exchange

        # Prearranged Payments and Deposits (PPD).
        PREARRANGED_PAYMENTS_AND_DEPOSIT = :prearranged_payments_and_deposit

        # Internet Initiated (WEB).
        INTERNET_INITIATED = :internet_initiated

        # Point of Sale (POS).
        POINT_OF_SALE = :point_of_sale

        # Telephone Initiated (TEL).
        TELEPHONE_INITIATED = :telephone_initiated

        # Customer Initiated (CIE).
        CUSTOMER_INITIATED = :customer_initiated

        # Accounts Receivable (ARC).
        ACCOUNTS_RECEIVABLE = :accounts_receivable

        # Machine Transfer (MTE).
        MACHINE_TRANSFER = :machine_transfer

        # Shared Network Transaction (SHR).
        SHARED_NETWORK_TRANSACTION = :shared_network_transaction

        # Represented Check (RCK).
        REPRESENTED_CHECK = :represented_check

        # Back Office Conversion (BOC).
        BACK_OFFICE_CONVERSION = :back_office_conversion

        # Point of Purchase (POP).
        POINT_OF_PURCHASE = :point_of_purchase

        # Check Truncation (TRC).
        CHECK_TRUNCATION = :check_truncation

        # Destroyed Check (XCK).
        DESTROYED_CHECK = :destroyed_check

        # International ACH Transaction (IAT).
        INTERNATIONAL_ACH_TRANSACTION = :international_ach_transaction

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The status of the transfer.
      #
      # @see Increase::Models::InboundACHTransfer#status
      module Status
        extend Increase::Internal::Type::Enum

        # The Inbound ACH Transfer is awaiting action, will transition automatically if no action is taken.
        PENDING = :pending

        # The Inbound ACH Transfer has been declined.
        DECLINED = :declined

        # The Inbound ACH Transfer is accepted.
        ACCEPTED = :accepted

        # The Inbound ACH Transfer has been returned.
        RETURNED = :returned

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::InboundACHTransfer#transfer_return
      class TransferReturn < Increase::Internal::Type::BaseModel
        # @!attribute reason
        #   The reason for the transfer return.
        #
        #   @return [Symbol, Increase::Models::InboundACHTransfer::TransferReturn::Reason]
        required :reason, enum: -> { Increase::InboundACHTransfer::TransferReturn::Reason }

        # @!attribute returned_at
        #   The time at which the transfer was returned.
        #
        #   @return [Time]
        required :returned_at, Time

        # @!attribute transaction_id
        #   The id of the transaction for the returned transfer.
        #
        #   @return [String]
        required :transaction_id, String

        # @!method initialize(reason:, returned_at:, transaction_id:)
        #   If your transfer is returned, this will contain details of the return.
        #
        #   @param reason [Symbol, Increase::Models::InboundACHTransfer::TransferReturn::Reason] The reason for the transfer return.
        #
        #   @param returned_at [Time] The time at which the transfer was returned.
        #
        #   @param transaction_id [String] The id of the transaction for the returned transfer.

        # The reason for the transfer return.
        #
        # @see Increase::Models::InboundACHTransfer::TransferReturn#reason
        module Reason
          extend Increase::Internal::Type::Enum

          # The customer's account has insufficient funds. This reason is only allowed for debits. The Nacha return code is R01.
          INSUFFICIENT_FUNDS = :insufficient_funds

          # The originating financial institution asked for this transfer to be returned. The receiving bank is complying with the request. The Nacha return code is R06.
          RETURNED_PER_ODFI_REQUEST = :returned_per_odfi_request

          # The customer no longer authorizes this transaction. The Nacha return code is R07.
          AUTHORIZATION_REVOKED_BY_CUSTOMER = :authorization_revoked_by_customer

          # The customer asked for the payment to be stopped. This reason is only allowed for debits. The Nacha return code is R08.
          PAYMENT_STOPPED = :payment_stopped

          # The customer advises that the debit was unauthorized. The Nacha return code is R10.
          CUSTOMER_ADVISED_UNAUTHORIZED_IMPROPER_INELIGIBLE_OR_INCOMPLETE =
            :customer_advised_unauthorized_improper_ineligible_or_incomplete

          # The payee is deceased. The Nacha return code is R14.
          REPRESENTATIVE_PAYEE_DECEASED_OR_UNABLE_TO_CONTINUE_IN_THAT_CAPACITY =
            :representative_payee_deceased_or_unable_to_continue_in_that_capacity

          # The account holder is deceased. The Nacha return code is R15.
          BENEFICIARY_OR_ACCOUNT_HOLDER_DECEASED = :beneficiary_or_account_holder_deceased

          # The customer refused a credit entry. This reason is only allowed for credits. The Nacha return code is R23.
          CREDIT_ENTRY_REFUSED_BY_RECEIVER = :credit_entry_refused_by_receiver

          # The account holder identified this transaction as a duplicate. The Nacha return code is R24.
          DUPLICATE_ENTRY = :duplicate_entry

          # The corporate customer no longer authorizes this transaction. The Nacha return code is R29.
          CORPORATE_CUSTOMER_ADVISED_NOT_AUTHORIZED = :corporate_customer_advised_not_authorized

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_ach_transfer`.
      #
      # @see Increase::Models::InboundACHTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        INBOUND_ACH_TRANSFER = :inbound_ach_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
