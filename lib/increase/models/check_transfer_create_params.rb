# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckTransfers#create
    class CheckTransferCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier for the account that will send the transfer.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The transfer amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute fulfillment_method
      #   Whether Increase will print and mail the check or if you will do it yourself.
      #
      #   @return [Symbol, Increase::Models::CheckTransferCreateParams::FulfillmentMethod]
      required :fulfillment_method, enum: -> { Increase::Models::CheckTransferCreateParams::FulfillmentMethod }

      # @!attribute source_account_number_id
      #   The identifier of the Account Number from which to send the transfer and print
      #     on the check.
      #
      #   @return [String]
      required :source_account_number_id, String

      # @!attribute [r] physical_check
      #   Details relating to the physical check that Increase will print and mail. This
      #     is required if `fulfillment_method` is equal to `physical_check`. It must not be
      #     included if any other `fulfillment_method` is provided.
      #
      #   @return [Increase::Models::CheckTransferCreateParams::PhysicalCheck, nil]
      optional :physical_check, -> { Increase::Models::CheckTransferCreateParams::PhysicalCheck }

      # @!parse
      #   # @return [Increase::Models::CheckTransferCreateParams::PhysicalCheck]
      #   attr_writer :physical_check

      # @!attribute [r] require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::BooleanModel

      # @!parse
      #   # @return [Boolean]
      #   attr_writer :require_approval

      # @!attribute [r] third_party
      #   Details relating to the custom fulfillment you will perform. This is required if
      #     `fulfillment_method` is equal to `third_party`. It must not be included if any
      #     other `fulfillment_method` is provided.
      #
      #   @return [Increase::Models::CheckTransferCreateParams::ThirdParty, nil]
      optional :third_party, -> { Increase::Models::CheckTransferCreateParams::ThirdParty }

      # @!parse
      #   # @return [Increase::Models::CheckTransferCreateParams::ThirdParty]
      #   attr_writer :third_party

      # @!parse
      #   # @param account_id [String]
      #   # @param amount [Integer]
      #   # @param fulfillment_method [Symbol, Increase::Models::CheckTransferCreateParams::FulfillmentMethod]
      #   # @param source_account_number_id [String]
      #   # @param physical_check [Increase::Models::CheckTransferCreateParams::PhysicalCheck]
      #   # @param require_approval [Boolean]
      #   # @param third_party [Increase::Models::CheckTransferCreateParams::ThirdParty]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     account_id:,
      #     amount:,
      #     fulfillment_method:,
      #     source_account_number_id:,
      #     physical_check: nil,
      #     require_approval: nil,
      #     third_party: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # Whether Increase will print and mail the check or if you will do it yourself.
      module FulfillmentMethod
        extend Increase::Internal::Type::Enum

        # Increase will print and mail a physical check.
        PHYSICAL_CHECK = :physical_check

        # Increase will not print a check; you are responsible for printing and mailing a check with the provided account number, routing number, check number, and amount.
        THIRD_PARTY = :third_party

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      class PhysicalCheck < Increase::Internal::Type::BaseModel
        # @!attribute mailing_address
        #   Details for where Increase will mail the check.
        #
        #   @return [Increase::Models::CheckTransferCreateParams::PhysicalCheck::MailingAddress]
        required :mailing_address,
                 -> { Increase::Models::CheckTransferCreateParams::PhysicalCheck::MailingAddress }

        # @!attribute memo
        #   The descriptor that will be printed on the memo field on the check.
        #
        #   @return [String]
        required :memo, String

        # @!attribute recipient_name
        #   The name that will be printed on the check in the 'To:' field.
        #
        #   @return [String]
        required :recipient_name, String

        # @!attribute [r] check_number
        #   The check number Increase should print on the check. This should not contain
        #     leading zeroes and must be unique across the `source_account_number`. If this is
        #     omitted, Increase will generate a check number for you.
        #
        #   @return [String, nil]
        optional :check_number, String

        # @!parse
        #   # @return [String]
        #   attr_writer :check_number

        # @!attribute [r] note
        #   The descriptor that will be printed on the letter included with the check.
        #
        #   @return [String, nil]
        optional :note, String

        # @!parse
        #   # @return [String]
        #   attr_writer :note

        # @!attribute [r] return_address
        #   The return address to be printed on the check. If omitted this will default to
        #     an Increase-owned address that will mark checks as delivery failed and shred
        #     them.
        #
        #   @return [Increase::Models::CheckTransferCreateParams::PhysicalCheck::ReturnAddress, nil]
        optional :return_address, -> { Increase::Models::CheckTransferCreateParams::PhysicalCheck::ReturnAddress }

        # @!parse
        #   # @return [Increase::Models::CheckTransferCreateParams::PhysicalCheck::ReturnAddress]
        #   attr_writer :return_address

        # @!attribute [r] signature_text
        #   The text that will appear as the signature on the check in cursive font. If not
        #     provided, the check will be printed with 'No signature required'.
        #
        #   @return [String, nil]
        optional :signature_text, String

        # @!parse
        #   # @return [String]
        #   attr_writer :signature_text

        # @!parse
        #   # Details relating to the physical check that Increase will print and mail. This
        #   #   is required if `fulfillment_method` is equal to `physical_check`. It must not be
        #   #   included if any other `fulfillment_method` is provided.
        #   #
        #   # @param mailing_address [Increase::Models::CheckTransferCreateParams::PhysicalCheck::MailingAddress]
        #   # @param memo [String]
        #   # @param recipient_name [String]
        #   # @param check_number [String]
        #   # @param note [String]
        #   # @param return_address [Increase::Models::CheckTransferCreateParams::PhysicalCheck::ReturnAddress]
        #   # @param signature_text [String]
        #   #
        #   def initialize(
        #     mailing_address:,
        #     memo:,
        #     recipient_name:,
        #     check_number: nil,
        #     note: nil,
        #     return_address: nil,
        #     signature_text: nil,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # @see Increase::Models::CheckTransferCreateParams::PhysicalCheck#mailing_address
        class MailingAddress < Increase::Internal::Type::BaseModel
          # @!attribute city
          #   The city component of the check's destination address.
          #
          #   @return [String]
          required :city, String

          # @!attribute line1
          #   The first line of the address component of the check's destination address.
          #
          #   @return [String]
          required :line1, String

          # @!attribute postal_code
          #   The postal code component of the check's destination address.
          #
          #   @return [String]
          required :postal_code, String

          # @!attribute state
          #   The US state component of the check's destination address.
          #
          #   @return [String]
          required :state, String

          # @!attribute [r] line2
          #   The second line of the address component of the check's destination address.
          #
          #   @return [String, nil]
          optional :line2, String

          # @!parse
          #   # @return [String]
          #   attr_writer :line2

          # @!parse
          #   # Details for where Increase will mail the check.
          #   #
          #   # @param city [String]
          #   # @param line1 [String]
          #   # @param postal_code [String]
          #   # @param state [String]
          #   # @param line2 [String]
          #   #
          #   def initialize(city:, line1:, postal_code:, state:, line2: nil, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end

        # @see Increase::Models::CheckTransferCreateParams::PhysicalCheck#return_address
        class ReturnAddress < Increase::Internal::Type::BaseModel
          # @!attribute city
          #   The city of the return address.
          #
          #   @return [String]
          required :city, String

          # @!attribute line1
          #   The first line of the return address.
          #
          #   @return [String]
          required :line1, String

          # @!attribute name
          #   The name of the return address.
          #
          #   @return [String]
          required :name, String

          # @!attribute postal_code
          #   The postal code of the return address.
          #
          #   @return [String]
          required :postal_code, String

          # @!attribute state
          #   The US state of the return address.
          #
          #   @return [String]
          required :state, String

          # @!attribute [r] line2
          #   The second line of the return address.
          #
          #   @return [String, nil]
          optional :line2, String

          # @!parse
          #   # @return [String]
          #   attr_writer :line2

          # @!parse
          #   # The return address to be printed on the check. If omitted this will default to
          #   #   an Increase-owned address that will mark checks as delivery failed and shred
          #   #   them.
          #   #
          #   # @param city [String]
          #   # @param line1 [String]
          #   # @param name [String]
          #   # @param postal_code [String]
          #   # @param state [String]
          #   # @param line2 [String]
          #   #
          #   def initialize(city:, line1:, name:, postal_code:, state:, line2: nil, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end
      end

      class ThirdParty < Increase::Internal::Type::BaseModel
        # @!attribute [r] check_number
        #   The check number you will print on the check. This should not contain leading
        #     zeroes. If this is omitted, Increase will generate a check number for you; you
        #     should inspect the response and use that check number.
        #
        #   @return [String, nil]
        optional :check_number, String

        # @!parse
        #   # @return [String]
        #   attr_writer :check_number

        # @!attribute [r] recipient_name
        #   The pay-to name you will print on the check. If provided, this is used for
        #     [Positive Pay](/documentation/positive-pay). If this is omitted, Increase will
        #     be unable to validate the payee name when the check is deposited.
        #
        #   @return [String, nil]
        optional :recipient_name, String

        # @!parse
        #   # @return [String]
        #   attr_writer :recipient_name

        # @!parse
        #   # Details relating to the custom fulfillment you will perform. This is required if
        #   #   `fulfillment_method` is equal to `third_party`. It must not be included if any
        #   #   other `fulfillment_method` is provided.
        #   #
        #   # @param check_number [String]
        #   # @param recipient_name [String]
        #   #
        #   def initialize(check_number: nil, recipient_name: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end
    end
  end
end
