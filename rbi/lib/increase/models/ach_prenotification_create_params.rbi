# typed: strong

module Increase
  module Models
    class ACHPrenotificationCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The Increase identifier for the account that will send the transfer.
      sig { returns(String) }
      attr_accessor :account_id

      # The account number for the destination account.
      sig { returns(String) }
      attr_accessor :account_number

      # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      #   destination account.
      sig { returns(String) }
      attr_accessor :routing_number

      # Additional information that will be sent to the recipient.
      sig { returns(T.nilable(String)) }
      attr_reader :addendum

      sig { params(addendum: String).void }
      attr_writer :addendum

      # The description of the date of the transfer.
      sig { returns(T.nilable(String)) }
      attr_reader :company_descriptive_date

      sig { params(company_descriptive_date: String).void }
      attr_writer :company_descriptive_date

      # The data you choose to associate with the transfer.
      sig { returns(T.nilable(String)) }
      attr_reader :company_discretionary_data

      sig { params(company_discretionary_data: String).void }
      attr_writer :company_discretionary_data

      # The description of the transfer you wish to be shown to the recipient.
      sig { returns(T.nilable(String)) }
      attr_reader :company_entry_description

      sig { params(company_entry_description: String).void }
      attr_writer :company_entry_description

      # The name by which the recipient knows you.
      sig { returns(T.nilable(String)) }
      attr_reader :company_name

      sig { params(company_name: String).void }
      attr_writer :company_name

      # Whether the Prenotification is for a future debit or credit.
      sig { returns(T.nilable(Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator::OrSymbol)) }
      attr_reader :credit_debit_indicator

      sig do
        params(
          credit_debit_indicator: Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator::OrSymbol
        )
          .void
      end
      attr_writer :credit_debit_indicator

      # The transfer effective date in
      #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
      sig { returns(T.nilable(Date)) }
      attr_reader :effective_date

      sig { params(effective_date: Date).void }
      attr_writer :effective_date

      # Your identifier for the transfer recipient.
      sig { returns(T.nilable(String)) }
      attr_reader :individual_id

      sig { params(individual_id: String).void }
      attr_writer :individual_id

      # The name of the transfer recipient. This value is information and not verified
      #   by the recipient's bank.
      sig { returns(T.nilable(String)) }
      attr_reader :individual_name

      sig { params(individual_name: String).void }
      attr_writer :individual_name

      # The Standard Entry Class (SEC) code to use for the ACH Prenotification.
      sig { returns(T.nilable(Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode::OrSymbol)) }
      attr_reader :standard_entry_class_code

      sig do
        params(
          standard_entry_class_code: Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode::OrSymbol
        )
          .void
      end
      attr_writer :standard_entry_class_code

      sig do
        params(
          account_id: String,
          account_number: String,
          routing_number: String,
          addendum: String,
          company_descriptive_date: String,
          company_discretionary_data: String,
          company_entry_description: String,
          company_name: String,
          credit_debit_indicator: Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator::OrSymbol,
          effective_date: Date,
          individual_id: String,
          individual_name: String,
          standard_entry_class_code: Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode::OrSymbol,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        account_id:,
        account_number:,
        routing_number:,
        addendum: nil,
        company_descriptive_date: nil,
        company_discretionary_data: nil,
        company_entry_description: nil,
        company_name: nil,
        credit_debit_indicator: nil,
        effective_date: nil,
        individual_id: nil,
        individual_name: nil,
        standard_entry_class_code: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              account_id: String,
              account_number: String,
              routing_number: String,
              addendum: String,
              company_descriptive_date: String,
              company_discretionary_data: String,
              company_entry_description: String,
              company_name: String,
              credit_debit_indicator: Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator::OrSymbol,
              effective_date: Date,
              individual_id: String,
              individual_name: String,
              standard_entry_class_code: Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      # Whether the Prenotification is for a future debit or credit.
      module CreditDebitIndicator
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator) }
        OrSymbol =
          T.type_alias do
            T.any(
              Symbol,
              String,
              Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator::TaggedSymbol
            )
          end

        # The Prenotification is for an anticipated credit.
        CREDIT =
          T.let(:credit, Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator::TaggedSymbol)

        # The Prenotification is for an anticipated debit.
        DEBIT =
          T.let(:debit, Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator::TaggedSymbol)

        sig do
          override
            .returns(T::Array[Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator::TaggedSymbol])
        end
        def self.values
        end
      end

      # The Standard Entry Class (SEC) code to use for the ACH Prenotification.
      module StandardEntryClassCode
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode) }
        OrSymbol =
          T.type_alias do
            T.any(
              Symbol,
              String,
              Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode::TaggedSymbol
            )
          end

        # Corporate Credit and Debit (CCD).
        CORPORATE_CREDIT_OR_DEBIT =
          T.let(
            :corporate_credit_or_debit,
            Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode::TaggedSymbol
          )

        # Corporate Trade Exchange (CTX).
        CORPORATE_TRADE_EXCHANGE =
          T.let(
            :corporate_trade_exchange,
            Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode::TaggedSymbol
          )

        # Prearranged Payments and Deposits (PPD).
        PREARRANGED_PAYMENTS_AND_DEPOSIT =
          T.let(
            :prearranged_payments_and_deposit,
            Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode::TaggedSymbol
          )

        # Internet Initiated (WEB).
        INTERNET_INITIATED =
          T.let(
            :internet_initiated,
            Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode::TaggedSymbol
          )

        sig do
          override
            .returns(T::Array[Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
