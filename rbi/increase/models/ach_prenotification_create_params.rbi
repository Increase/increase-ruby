# typed: strong

module Increase
  module Models
    class ACHPrenotificationCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::ACHPrenotificationCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The Increase identifier for the account that will send the ACH Prenotification.
      sig { returns(String) }
      attr_accessor :account_id

      # The account number for the destination account.
      sig { returns(String) }
      attr_accessor :account_number

      # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      # destination account.
      sig { returns(String) }
      attr_accessor :routing_number

      # Additional information that will be sent to the recipient.
      sig { returns(T.nilable(String)) }
      attr_reader :addendum

      sig { params(addendum: String).void }
      attr_writer :addendum

      # The description of the date of the ACH Prenotification.
      sig { returns(T.nilable(String)) }
      attr_reader :company_descriptive_date

      sig { params(company_descriptive_date: String).void }
      attr_writer :company_descriptive_date

      # The data you choose to associate with the ACH Prenotification.
      sig { returns(T.nilable(String)) }
      attr_reader :company_discretionary_data

      sig { params(company_discretionary_data: String).void }
      attr_writer :company_discretionary_data

      # The description you wish to be shown to the recipient.
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
      sig do
        returns(
          T.nilable(
            Increase::ACHPrenotificationCreateParams::CreditDebitIndicator::OrSymbol
          )
        )
      end
      attr_reader :credit_debit_indicator

      sig do
        params(
          credit_debit_indicator:
            Increase::ACHPrenotificationCreateParams::CreditDebitIndicator::OrSymbol
        ).void
      end
      attr_writer :credit_debit_indicator

      # The ACH Prenotification effective date in
      # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
      sig { returns(T.nilable(Date)) }
      attr_reader :effective_date

      sig { params(effective_date: Date).void }
      attr_writer :effective_date

      # Your identifier for the recipient.
      sig { returns(T.nilable(String)) }
      attr_reader :individual_id

      sig { params(individual_id: String).void }
      attr_writer :individual_id

      # The name of therecipient. This value is informational and not verified by the
      # recipient's bank.
      sig { returns(T.nilable(String)) }
      attr_reader :individual_name

      sig { params(individual_name: String).void }
      attr_writer :individual_name

      # The
      # [Standard Entry Class (SEC) code](/documentation/ach-standard-entry-class-codes)
      # to use for the ACH Prenotification.
      sig do
        returns(
          T.nilable(
            Increase::ACHPrenotificationCreateParams::StandardEntryClassCode::OrSymbol
          )
        )
      end
      attr_reader :standard_entry_class_code

      sig do
        params(
          standard_entry_class_code:
            Increase::ACHPrenotificationCreateParams::StandardEntryClassCode::OrSymbol
        ).void
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
          credit_debit_indicator:
            Increase::ACHPrenotificationCreateParams::CreditDebitIndicator::OrSymbol,
          effective_date: Date,
          individual_id: String,
          individual_name: String,
          standard_entry_class_code:
            Increase::ACHPrenotificationCreateParams::StandardEntryClassCode::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Increase identifier for the account that will send the ACH Prenotification.
        account_id:,
        # The account number for the destination account.
        account_number:,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
        # destination account.
        routing_number:,
        # Additional information that will be sent to the recipient.
        addendum: nil,
        # The description of the date of the ACH Prenotification.
        company_descriptive_date: nil,
        # The data you choose to associate with the ACH Prenotification.
        company_discretionary_data: nil,
        # The description you wish to be shown to the recipient.
        company_entry_description: nil,
        # The name by which the recipient knows you.
        company_name: nil,
        # Whether the Prenotification is for a future debit or credit.
        credit_debit_indicator: nil,
        # The ACH Prenotification effective date in
        # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        effective_date: nil,
        # Your identifier for the recipient.
        individual_id: nil,
        # The name of therecipient. This value is informational and not verified by the
        # recipient's bank.
        individual_name: nil,
        # The
        # [Standard Entry Class (SEC) code](/documentation/ach-standard-entry-class-codes)
        # to use for the ACH Prenotification.
        standard_entry_class_code: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            account_number: String,
            routing_number: String,
            addendum: String,
            company_descriptive_date: String,
            company_discretionary_data: String,
            company_entry_description: String,
            company_name: String,
            credit_debit_indicator:
              Increase::ACHPrenotificationCreateParams::CreditDebitIndicator::OrSymbol,
            effective_date: Date,
            individual_id: String,
            individual_name: String,
            standard_entry_class_code:
              Increase::ACHPrenotificationCreateParams::StandardEntryClassCode::OrSymbol,
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
          T.type_alias do
            T.all(
              Symbol,
              Increase::ACHPrenotificationCreateParams::CreditDebitIndicator
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The Prenotification is for an anticipated credit.
        CREDIT =
          T.let(
            :credit,
            Increase::ACHPrenotificationCreateParams::CreditDebitIndicator::TaggedSymbol
          )

        # The Prenotification is for an anticipated debit.
        DEBIT =
          T.let(
            :debit,
            Increase::ACHPrenotificationCreateParams::CreditDebitIndicator::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::ACHPrenotificationCreateParams::CreditDebitIndicator::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # The
      # [Standard Entry Class (SEC) code](/documentation/ach-standard-entry-class-codes)
      # to use for the ACH Prenotification.
      module StandardEntryClassCode
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::ACHPrenotificationCreateParams::StandardEntryClassCode
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Corporate Credit and Debit (CCD) is used for business-to-business payments.
        CORPORATE_CREDIT_OR_DEBIT =
          T.let(
            :corporate_credit_or_debit,
            Increase::ACHPrenotificationCreateParams::StandardEntryClassCode::TaggedSymbol
          )

        # Corporate Trade Exchange (CTX) allows for including extensive remittance information with business-to-business payments.
        CORPORATE_TRADE_EXCHANGE =
          T.let(
            :corporate_trade_exchange,
            Increase::ACHPrenotificationCreateParams::StandardEntryClassCode::TaggedSymbol
          )

        # Prearranged Payments and Deposits (PPD) is used for credits or debits originated by an organization to a consumer, such as payroll direct deposits.
        PREARRANGED_PAYMENTS_AND_DEPOSIT =
          T.let(
            :prearranged_payments_and_deposit,
            Increase::ACHPrenotificationCreateParams::StandardEntryClassCode::TaggedSymbol
          )

        # Internet Initiated (WEB) is used for consumer payments initiated or authorized via the Internet. Debits can only be initiated by non-consumers to debit a consumer’s account. Credits can only be used for consumer to consumer transactions.
        INTERNET_INITIATED =
          T.let(
            :internet_initiated,
            Increase::ACHPrenotificationCreateParams::StandardEntryClassCode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::ACHPrenotificationCreateParams::StandardEntryClassCode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
