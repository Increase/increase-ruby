# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ACHTransfers#create
    class ACHTransferCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The Increase identifier for the account that will send the transfer.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The transfer amount in USD cents. A positive amount originates a credit transfer
      #     pushing funds to the receiving account. A negative amount originates a debit
      #     transfer pulling funds from the receiving account.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute statement_descriptor
      #   A description you choose to give the transfer. This will be saved with the
      #     transfer details, displayed in the dashboard, and returned by the API. If
      #     `individual_name` and `company_name` are not explicitly set by this API, the
      #     `statement_descriptor` will be sent in those fields to the receiving bank to
      #     help the customer recognize the transfer. You are highly encouraged to pass
      #     `individual_name` and `company_name` instead of relying on this fallback.
      #
      #   @return [String]
      required :statement_descriptor, String

      # @!attribute [r] account_number
      #   The account number for the destination account.
      #
      #   @return [String, nil]
      optional :account_number, String

      # @!parse
      #   # @return [String]
      #   attr_writer :account_number

      # @!attribute [r] addenda
      #   Additional information that will be sent to the recipient. This is included in
      #     the transfer data sent to the receiving bank.
      #
      #   @return [Increase::Models::ACHTransferCreateParams::Addenda, nil]
      optional :addenda, -> { Increase::Models::ACHTransferCreateParams::Addenda }

      # @!parse
      #   # @return [Increase::Models::ACHTransferCreateParams::Addenda]
      #   attr_writer :addenda

      # @!attribute [r] company_descriptive_date
      #   The description of the date of the transfer, usually in the format `YYMMDD`.
      #     This is included in the transfer data sent to the receiving bank.
      #
      #   @return [String, nil]
      optional :company_descriptive_date, String

      # @!parse
      #   # @return [String]
      #   attr_writer :company_descriptive_date

      # @!attribute [r] company_discretionary_data
      #   The data you choose to associate with the transfer. This is included in the
      #     transfer data sent to the receiving bank.
      #
      #   @return [String, nil]
      optional :company_discretionary_data, String

      # @!parse
      #   # @return [String]
      #   attr_writer :company_discretionary_data

      # @!attribute [r] company_entry_description
      #   A description of the transfer. This is included in the transfer data sent to the
      #     receiving bank.
      #
      #   @return [String, nil]
      optional :company_entry_description, String

      # @!parse
      #   # @return [String]
      #   attr_writer :company_entry_description

      # @!attribute [r] company_name
      #   The name by which the recipient knows you. This is included in the transfer data
      #     sent to the receiving bank.
      #
      #   @return [String, nil]
      optional :company_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :company_name

      # @!attribute [r] destination_account_holder
      #   The type of entity that owns the account to which the ACH Transfer is being
      #     sent.
      #
      #   @return [Symbol, Increase::Models::ACHTransferCreateParams::DestinationAccountHolder, nil]
      optional :destination_account_holder,
               enum: -> { Increase::Models::ACHTransferCreateParams::DestinationAccountHolder }

      # @!parse
      #   # @return [Symbol, Increase::Models::ACHTransferCreateParams::DestinationAccountHolder]
      #   attr_writer :destination_account_holder

      # @!attribute [r] external_account_id
      #   The ID of an External Account to initiate a transfer to. If this parameter is
      #     provided, `account_number`, `routing_number`, and `funding` must be absent.
      #
      #   @return [String, nil]
      optional :external_account_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :external_account_id

      # @!attribute [r] funding
      #   The type of the account to which the transfer will be sent.
      #
      #   @return [Symbol, Increase::Models::ACHTransferCreateParams::Funding, nil]
      optional :funding, enum: -> { Increase::Models::ACHTransferCreateParams::Funding }

      # @!parse
      #   # @return [Symbol, Increase::Models::ACHTransferCreateParams::Funding]
      #   attr_writer :funding

      # @!attribute [r] individual_id
      #   Your identifier for the transfer recipient.
      #
      #   @return [String, nil]
      optional :individual_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :individual_id

      # @!attribute [r] individual_name
      #   The name of the transfer recipient. This value is informational and not verified
      #     by the recipient's bank.
      #
      #   @return [String, nil]
      optional :individual_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :individual_name

      # @!attribute [r] preferred_effective_date
      #   Configuration for how the effective date of the transfer will be set. This
      #     determines same-day vs future-dated settlement timing. If not set, defaults to a
      #     `settlement_schedule` of `same_day`. If set, exactly one of the child attributes
      #     must be set.
      #
      #   @return [Increase::Models::ACHTransferCreateParams::PreferredEffectiveDate, nil]
      optional :preferred_effective_date,
               -> { Increase::Models::ACHTransferCreateParams::PreferredEffectiveDate }

      # @!parse
      #   # @return [Increase::Models::ACHTransferCreateParams::PreferredEffectiveDate]
      #   attr_writer :preferred_effective_date

      # @!attribute [r] require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::BooleanModel

      # @!parse
      #   # @return [Boolean]
      #   attr_writer :require_approval

      # @!attribute [r] routing_number
      #   The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      #     destination account.
      #
      #   @return [String, nil]
      optional :routing_number, String

      # @!parse
      #   # @return [String]
      #   attr_writer :routing_number

      # @!attribute [r] standard_entry_class_code
      #   The Standard Entry Class (SEC) code to use for the transfer.
      #
      #   @return [Symbol, Increase::Models::ACHTransferCreateParams::StandardEntryClassCode, nil]
      optional :standard_entry_class_code,
               enum: -> { Increase::Models::ACHTransferCreateParams::StandardEntryClassCode }

      # @!parse
      #   # @return [Symbol, Increase::Models::ACHTransferCreateParams::StandardEntryClassCode]
      #   attr_writer :standard_entry_class_code

      # @!attribute [r] transaction_timing
      #   The timing of the transaction.
      #
      #   @return [Symbol, Increase::Models::ACHTransferCreateParams::TransactionTiming, nil]
      optional :transaction_timing, enum: -> { Increase::Models::ACHTransferCreateParams::TransactionTiming }

      # @!parse
      #   # @return [Symbol, Increase::Models::ACHTransferCreateParams::TransactionTiming]
      #   attr_writer :transaction_timing

      # @!parse
      #   # @param account_id [String]
      #   # @param amount [Integer]
      #   # @param statement_descriptor [String]
      #   # @param account_number [String]
      #   # @param addenda [Increase::Models::ACHTransferCreateParams::Addenda]
      #   # @param company_descriptive_date [String]
      #   # @param company_discretionary_data [String]
      #   # @param company_entry_description [String]
      #   # @param company_name [String]
      #   # @param destination_account_holder [Symbol, Increase::Models::ACHTransferCreateParams::DestinationAccountHolder]
      #   # @param external_account_id [String]
      #   # @param funding [Symbol, Increase::Models::ACHTransferCreateParams::Funding]
      #   # @param individual_id [String]
      #   # @param individual_name [String]
      #   # @param preferred_effective_date [Increase::Models::ACHTransferCreateParams::PreferredEffectiveDate]
      #   # @param require_approval [Boolean]
      #   # @param routing_number [String]
      #   # @param standard_entry_class_code [Symbol, Increase::Models::ACHTransferCreateParams::StandardEntryClassCode]
      #   # @param transaction_timing [Symbol, Increase::Models::ACHTransferCreateParams::TransactionTiming]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     account_id:,
      #     amount:,
      #     statement_descriptor:,
      #     account_number: nil,
      #     addenda: nil,
      #     company_descriptive_date: nil,
      #     company_discretionary_data: nil,
      #     company_entry_description: nil,
      #     company_name: nil,
      #     destination_account_holder: nil,
      #     external_account_id: nil,
      #     funding: nil,
      #     individual_id: nil,
      #     individual_name: nil,
      #     preferred_effective_date: nil,
      #     require_approval: nil,
      #     routing_number: nil,
      #     standard_entry_class_code: nil,
      #     transaction_timing: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class Addenda < Increase::Internal::Type::BaseModel
        # @!attribute category
        #   The type of addenda to pass with the transfer.
        #
        #   @return [Symbol, Increase::Models::ACHTransferCreateParams::Addenda::Category]
        required :category, enum: -> { Increase::Models::ACHTransferCreateParams::Addenda::Category }

        # @!attribute [r] freeform
        #   Unstructured `payment_related_information` passed through with the transfer.
        #
        #   @return [Increase::Models::ACHTransferCreateParams::Addenda::Freeform, nil]
        optional :freeform, -> { Increase::Models::ACHTransferCreateParams::Addenda::Freeform }

        # @!parse
        #   # @return [Increase::Models::ACHTransferCreateParams::Addenda::Freeform]
        #   attr_writer :freeform

        # @!attribute [r] payment_order_remittance_advice
        #   Structured ASC X12 820 remittance advice records. Please reach out to
        #     [support@increase.com](mailto:support@increase.com) for more information.
        #
        #   @return [Increase::Models::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice, nil]
        optional :payment_order_remittance_advice,
                 -> { Increase::Models::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice }

        # @!parse
        #   # @return [Increase::Models::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice]
        #   attr_writer :payment_order_remittance_advice

        # @!parse
        #   # Additional information that will be sent to the recipient. This is included in
        #   #   the transfer data sent to the receiving bank.
        #   #
        #   # @param category [Symbol, Increase::Models::ACHTransferCreateParams::Addenda::Category]
        #   # @param freeform [Increase::Models::ACHTransferCreateParams::Addenda::Freeform]
        #   # @param payment_order_remittance_advice [Increase::Models::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice]
        #   #
        #   def initialize(category:, freeform: nil, payment_order_remittance_advice: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # The type of addenda to pass with the transfer.
        #
        # @see Increase::Models::ACHTransferCreateParams::Addenda#category
        module Category
          extend Increase::Internal::Type::Enum

          # Unstructured `payment_related_information` passed through with the transfer.
          FREEFORM = :freeform

          # Structured ASC X12 820 remittance advice records. Please reach out to [support@increase.com](mailto:support@increase.com) for more information.
          PAYMENT_ORDER_REMITTANCE_ADVICE = :payment_order_remittance_advice

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end

        # @see Increase::Models::ACHTransferCreateParams::Addenda#freeform
        class Freeform < Increase::Internal::Type::BaseModel
          # @!attribute entries
          #   Each entry represents an addendum sent with the transfer. Please reach out to
          #     [support@increase.com](mailto:support@increase.com) to send more than one
          #     addendum.
          #
          #   @return [Array<Increase::Models::ACHTransferCreateParams::Addenda::Freeform::Entry>]
          required :entries,
                   -> { Increase::Internal::Type::ArrayOf[Increase::Models::ACHTransferCreateParams::Addenda::Freeform::Entry] }

          # @!parse
          #   # Unstructured `payment_related_information` passed through with the transfer.
          #   #
          #   # @param entries [Array<Increase::Models::ACHTransferCreateParams::Addenda::Freeform::Entry>]
          #   #
          #   def initialize(entries:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

          class Entry < Increase::Internal::Type::BaseModel
            # @!attribute payment_related_information
            #   The payment related information passed in the addendum.
            #
            #   @return [String]
            required :payment_related_information, String

            # @!parse
            #   # @param payment_related_information [String]
            #   #
            #   def initialize(payment_related_information:, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
          end
        end

        # @see Increase::Models::ACHTransferCreateParams::Addenda#payment_order_remittance_advice
        class PaymentOrderRemittanceAdvice < Increase::Internal::Type::BaseModel
          # @!attribute invoices
          #   ASC X12 RMR records for this specific transfer.
          #
          #   @return [Array<Increase::Models::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice::Invoice>]
          required :invoices,
                   -> { Increase::Internal::Type::ArrayOf[Increase::Models::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice::Invoice] }

          # @!parse
          #   # Structured ASC X12 820 remittance advice records. Please reach out to
          #   #   [support@increase.com](mailto:support@increase.com) for more information.
          #   #
          #   # @param invoices [Array<Increase::Models::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice::Invoice>]
          #   #
          #   def initialize(invoices:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

          class Invoice < Increase::Internal::Type::BaseModel
            # @!attribute invoice_number
            #   The invoice number for this reference, determined in advance with the receiver.
            #
            #   @return [String]
            required :invoice_number, String

            # @!attribute paid_amount
            #   The amount that was paid for this invoice in the minor unit of its currency. For
            #     dollars, for example, this is cents.
            #
            #   @return [Integer]
            required :paid_amount, Integer

            # @!parse
            #   # @param invoice_number [String]
            #   # @param paid_amount [Integer]
            #   #
            #   def initialize(invoice_number:, paid_amount:, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
          end
        end
      end

      # The type of entity that owns the account to which the ACH Transfer is being
      #   sent.
      module DestinationAccountHolder
        extend Increase::Internal::Type::Enum

        # The External Account is owned by a business.
        BUSINESS = :business

        # The External Account is owned by an individual.
        INDIVIDUAL = :individual

        # It's unknown what kind of entity owns the External Account.
        UNKNOWN = :unknown

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # The type of the account to which the transfer will be sent.
      module Funding
        extend Increase::Internal::Type::Enum

        # A checking account.
        CHECKING = :checking

        # A savings account.
        SAVINGS = :savings

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      class PreferredEffectiveDate < Increase::Internal::Type::BaseModel
        # @!attribute [r] date
        #   A specific date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format to
        #     use as the effective date when submitting this transfer.
        #
        #   @return [Date, nil]
        optional :date, Date

        # @!parse
        #   # @return [Date]
        #   attr_writer :date

        # @!attribute [r] settlement_schedule
        #   A schedule by which Increase will choose an effective date for the transfer.
        #
        #   @return [Symbol, Increase::Models::ACHTransferCreateParams::PreferredEffectiveDate::SettlementSchedule, nil]
        optional :settlement_schedule,
                 enum: -> { Increase::Models::ACHTransferCreateParams::PreferredEffectiveDate::SettlementSchedule }

        # @!parse
        #   # @return [Symbol, Increase::Models::ACHTransferCreateParams::PreferredEffectiveDate::SettlementSchedule]
        #   attr_writer :settlement_schedule

        # @!parse
        #   # Configuration for how the effective date of the transfer will be set. This
        #   #   determines same-day vs future-dated settlement timing. If not set, defaults to a
        #   #   `settlement_schedule` of `same_day`. If set, exactly one of the child attributes
        #   #   must be set.
        #   #
        #   # @param date [Date]
        #   # @param settlement_schedule [Symbol, Increase::Models::ACHTransferCreateParams::PreferredEffectiveDate::SettlementSchedule]
        #   #
        #   def initialize(date: nil, settlement_schedule: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # A schedule by which Increase will choose an effective date for the transfer.
        #
        # @see Increase::Models::ACHTransferCreateParams::PreferredEffectiveDate#settlement_schedule
        module SettlementSchedule
          extend Increase::Internal::Type::Enum

          # The chosen effective date will be the same as the ACH processing date on which the transfer is submitted. This is necessary, but not sufficient for the transfer to be settled same-day: it must also be submitted before the last same-day cutoff and be less than or equal to $1,000.000.00.
          SAME_DAY = :same_day

          # The chosen effective date will be the business day following the ACH processing date on which the transfer is submitted. The transfer will be settled on that future day.
          FUTURE_DATED = :future_dated

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      # The Standard Entry Class (SEC) code to use for the transfer.
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

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # The timing of the transaction.
      module TransactionTiming
        extend Increase::Internal::Type::Enum

        # A Transaction will be created immediately.
        SYNCHRONOUS = :synchronous

        # A Transaction will be created when the funds settle at the Federal Reserve.
        ASYNCHRONOUS = :asynchronous

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
