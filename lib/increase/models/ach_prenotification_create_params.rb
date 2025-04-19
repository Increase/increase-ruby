# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ACHPrenotifications#create
    class ACHPrenotificationCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The Increase identifier for the account that will send the transfer.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute account_number
      #   The account number for the destination account.
      #
      #   @return [String]
      required :account_number, String

      # @!attribute routing_number
      #   The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      #   destination account.
      #
      #   @return [String]
      required :routing_number, String

      # @!attribute addendum
      #   Additional information that will be sent to the recipient.
      #
      #   @return [String, nil]
      optional :addendum, String

      # @!attribute company_descriptive_date
      #   The description of the date of the transfer.
      #
      #   @return [String, nil]
      optional :company_descriptive_date, String

      # @!attribute company_discretionary_data
      #   The data you choose to associate with the transfer.
      #
      #   @return [String, nil]
      optional :company_discretionary_data, String

      # @!attribute company_entry_description
      #   The description of the transfer you wish to be shown to the recipient.
      #
      #   @return [String, nil]
      optional :company_entry_description, String

      # @!attribute company_name
      #   The name by which the recipient knows you.
      #
      #   @return [String, nil]
      optional :company_name, String

      # @!attribute credit_debit_indicator
      #   Whether the Prenotification is for a future debit or credit.
      #
      #   @return [Symbol, Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator, nil]
      optional :credit_debit_indicator,
               enum: -> { Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator }

      # @!attribute effective_date
      #   The transfer effective date in
      #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
      #
      #   @return [Date, nil]
      optional :effective_date, Date

      # @!attribute individual_id
      #   Your identifier for the transfer recipient.
      #
      #   @return [String, nil]
      optional :individual_id, String

      # @!attribute individual_name
      #   The name of the transfer recipient. This value is information and not verified
      #   by the recipient's bank.
      #
      #   @return [String, nil]
      optional :individual_name, String

      # @!attribute standard_entry_class_code
      #   The Standard Entry Class (SEC) code to use for the ACH Prenotification.
      #
      #   @return [Symbol, Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode, nil]
      optional :standard_entry_class_code,
               enum: -> { Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode }

      # @!method initialize(account_id:, account_number:, routing_number:, addendum: nil, company_descriptive_date: nil, company_discretionary_data: nil, company_entry_description: nil, company_name: nil, credit_debit_indicator: nil, effective_date: nil, individual_id: nil, individual_name: nil, standard_entry_class_code: nil, request_options: {})
      #   @param account_id [String]
      #   @param account_number [String]
      #   @param routing_number [String]
      #   @param addendum [String]
      #   @param company_descriptive_date [String]
      #   @param company_discretionary_data [String]
      #   @param company_entry_description [String]
      #   @param company_name [String]
      #   @param credit_debit_indicator [Symbol, Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator]
      #   @param effective_date [Date]
      #   @param individual_id [String]
      #   @param individual_name [String]
      #   @param standard_entry_class_code [Symbol, Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode]
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # Whether the Prenotification is for a future debit or credit.
      module CreditDebitIndicator
        extend Increase::Internal::Type::Enum

        # The Prenotification is for an anticipated credit.
        CREDIT = :credit

        # The Prenotification is for an anticipated debit.
        DEBIT = :debit

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The Standard Entry Class (SEC) code to use for the ACH Prenotification.
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

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
