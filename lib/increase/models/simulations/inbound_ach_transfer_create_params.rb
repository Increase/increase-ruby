# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::InboundACHTransfers#create
      class InboundACHTransferCreateParams < Increase::Internal::Type::BaseModel
        # @!parse
        #   extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute account_number_id
        #   The identifier of the Account Number the inbound ACH Transfer is for.
        #
        #   @return [String]
        required :account_number_id, String

        # @!attribute amount
        #   The transfer amount in cents. A positive amount originates a credit transfer
        #     pushing funds to the receiving account. A negative amount originates a debit
        #     transfer pulling funds from the receiving account.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute [r] company_descriptive_date
        #   The description of the date of the transfer.
        #
        #   @return [String, nil]
        optional :company_descriptive_date, String

        # @!parse
        #   # @return [String]
        #   attr_writer :company_descriptive_date

        # @!attribute [r] company_discretionary_data
        #   Data associated with the transfer set by the sender.
        #
        #   @return [String, nil]
        optional :company_discretionary_data, String

        # @!parse
        #   # @return [String]
        #   attr_writer :company_discretionary_data

        # @!attribute [r] company_entry_description
        #   The description of the transfer set by the sender.
        #
        #   @return [String, nil]
        optional :company_entry_description, String

        # @!parse
        #   # @return [String]
        #   attr_writer :company_entry_description

        # @!attribute [r] company_id
        #   The sender's company ID.
        #
        #   @return [String, nil]
        optional :company_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :company_id

        # @!attribute [r] company_name
        #   The name of the sender.
        #
        #   @return [String, nil]
        optional :company_name, String

        # @!parse
        #   # @return [String]
        #   attr_writer :company_name

        # @!attribute [r] receiver_id_number
        #   The ID of the receiver of the transfer.
        #
        #   @return [String, nil]
        optional :receiver_id_number, String

        # @!parse
        #   # @return [String]
        #   attr_writer :receiver_id_number

        # @!attribute [r] receiver_name
        #   The name of the receiver of the transfer.
        #
        #   @return [String, nil]
        optional :receiver_name, String

        # @!parse
        #   # @return [String]
        #   attr_writer :receiver_name

        # @!attribute [r] resolve_at
        #   The time at which the transfer should be resolved. If not provided will resolve
        #     immediately.
        #
        #   @return [Time, nil]
        optional :resolve_at, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :resolve_at

        # @!attribute [r] standard_entry_class_code
        #   The standard entry class code for the transfer.
        #
        #   @return [Symbol, Increase::Models::Simulations::InboundACHTransferCreateParams::StandardEntryClassCode, nil]
        optional :standard_entry_class_code,
                 enum: -> { Increase::Models::Simulations::InboundACHTransferCreateParams::StandardEntryClassCode }

        # @!parse
        #   # @return [Symbol, Increase::Models::Simulations::InboundACHTransferCreateParams::StandardEntryClassCode]
        #   attr_writer :standard_entry_class_code

        # @!parse
        #   # @param account_number_id [String]
        #   # @param amount [Integer]
        #   # @param company_descriptive_date [String]
        #   # @param company_discretionary_data [String]
        #   # @param company_entry_description [String]
        #   # @param company_id [String]
        #   # @param company_name [String]
        #   # @param receiver_id_number [String]
        #   # @param receiver_name [String]
        #   # @param resolve_at [Time]
        #   # @param standard_entry_class_code [Symbol, Increase::Models::Simulations::InboundACHTransferCreateParams::StandardEntryClassCode]
        #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(
        #     account_number_id:,
        #     amount:,
        #     company_descriptive_date: nil,
        #     company_discretionary_data: nil,
        #     company_entry_description: nil,
        #     company_id: nil,
        #     company_name: nil,
        #     receiver_id_number: nil,
        #     receiver_name: nil,
        #     resolve_at: nil,
        #     standard_entry_class_code: nil,
        #     request_options: {},
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # The standard entry class code for the transfer.
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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
