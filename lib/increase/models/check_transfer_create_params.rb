# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckTransfers#create
    class CheckTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
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
      required :fulfillment_method, enum: -> { Increase::CheckTransferCreateParams::FulfillmentMethod }

      # @!attribute source_account_number_id
      #   The identifier of the Account Number from which to send the transfer and print
      #   on the check.
      #
      #   @return [String]
      required :source_account_number_id, String

      # @!attribute check_number
      #   The check number Increase should use for the check. This should not contain
      #   leading zeroes and must be unique across the `source_account_number`. If this is
      #   omitted, Increase will generate a check number for you.
      #
      #   @return [String, nil]
      optional :check_number, String

      # @!attribute physical_check
      #   Details relating to the physical check that Increase will print and mail. This
      #   is required if `fulfillment_method` is equal to `physical_check`. It must not be
      #   included if any other `fulfillment_method` is provided.
      #
      #   @return [Increase::Models::CheckTransferCreateParams::PhysicalCheck, nil]
      optional :physical_check, -> { Increase::CheckTransferCreateParams::PhysicalCheck }

      # @!attribute require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::Boolean

      # @!attribute third_party
      #   Details relating to the custom fulfillment you will perform. This is required if
      #   `fulfillment_method` is equal to `third_party`. It must not be included if any
      #   other `fulfillment_method` is provided.
      #
      #   @return [Increase::Models::CheckTransferCreateParams::ThirdParty, nil]
      optional :third_party, -> { Increase::CheckTransferCreateParams::ThirdParty }

      # @!method initialize(account_id:, amount:, fulfillment_method:, source_account_number_id:, check_number: nil, physical_check: nil, require_approval: nil, third_party: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CheckTransferCreateParams} for more details.
      #
      #   @param account_id [String] The identifier for the account that will send the transfer.
      #
      #   @param amount [Integer] The transfer amount in USD cents.
      #
      #   @param fulfillment_method [Symbol, Increase::Models::CheckTransferCreateParams::FulfillmentMethod] Whether Increase will print and mail the check or if you will do it yourself.
      #
      #   @param source_account_number_id [String] The identifier of the Account Number from which to send the transfer and print o
      #
      #   @param check_number [String] The check number Increase should use for the check. This should not contain lead
      #
      #   @param physical_check [Increase::Models::CheckTransferCreateParams::PhysicalCheck] Details relating to the physical check that Increase will print and mail. This i
      #
      #   @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @param third_party [Increase::Models::CheckTransferCreateParams::ThirdParty] Details relating to the custom fulfillment you will perform. This is required if
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # Whether Increase will print and mail the check or if you will do it yourself.
      module FulfillmentMethod
        extend Increase::Internal::Type::Enum

        # Increase will print and mail a physical check.
        PHYSICAL_CHECK = :physical_check

        # Increase will not print a check; you are responsible for printing and mailing a check with the provided account number, routing number, check number, and amount.
        THIRD_PARTY = :third_party

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class PhysicalCheck < Increase::Internal::Type::BaseModel
        # @!attribute mailing_address
        #   Details for where Increase will mail the check.
        #
        #   @return [Increase::Models::CheckTransferCreateParams::PhysicalCheck::MailingAddress]
        required :mailing_address, -> { Increase::CheckTransferCreateParams::PhysicalCheck::MailingAddress }

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

        # @!attribute attachment_file_id
        #   The ID of a File to be attached to the check. This must have
        #   `purpose: check_attachment`. For details on pricing and restrictions, see
        #   https://increase.com/documentation/originating-checks#printing-checks .
        #
        #   @return [String, nil]
        optional :attachment_file_id, String

        # @!attribute note
        #   The descriptor that will be printed on the letter included with the check.
        #
        #   @return [String, nil]
        optional :note, String

        # @!attribute payee
        #   The payee of the check. This will be printed on the top-left portion of the
        #   check and defaults to the return address if unspecified.
        #
        #   @return [Array<Increase::Models::CheckTransferCreateParams::PhysicalCheck::Payee>, nil]
        optional :payee,
                 -> {
                   Increase::Internal::Type::ArrayOf[Increase::CheckTransferCreateParams::PhysicalCheck::Payee]
                 }

        # @!attribute return_address
        #   The return address to be printed on the check. If omitted this will default to
        #   an Increase-owned address that will mark checks as delivery failed and shred
        #   them.
        #
        #   @return [Increase::Models::CheckTransferCreateParams::PhysicalCheck::ReturnAddress, nil]
        optional :return_address, -> { Increase::CheckTransferCreateParams::PhysicalCheck::ReturnAddress }

        # @!attribute shipping_method
        #   How to ship the check. For details on pricing, timing, and restrictions, see
        #   https://increase.com/documentation/originating-checks#printing-checks .
        #
        #   @return [Symbol, Increase::Models::CheckTransferCreateParams::PhysicalCheck::ShippingMethod, nil]
        optional :shipping_method,
                 enum: -> {
                   Increase::CheckTransferCreateParams::PhysicalCheck::ShippingMethod
                 }

        # @!attribute signature_text
        #   The text that will appear as the signature on the check in cursive font. If not
        #   provided, the check will be printed with 'No signature required'.
        #
        #   @return [String, nil]
        optional :signature_text, String

        # @!method initialize(mailing_address:, memo:, recipient_name:, attachment_file_id: nil, note: nil, payee: nil, return_address: nil, shipping_method: nil, signature_text: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CheckTransferCreateParams::PhysicalCheck} for more details.
        #
        #   Details relating to the physical check that Increase will print and mail. This
        #   is required if `fulfillment_method` is equal to `physical_check`. It must not be
        #   included if any other `fulfillment_method` is provided.
        #
        #   @param mailing_address [Increase::Models::CheckTransferCreateParams::PhysicalCheck::MailingAddress] Details for where Increase will mail the check.
        #
        #   @param memo [String] The descriptor that will be printed on the memo field on the check.
        #
        #   @param recipient_name [String] The name that will be printed on the check in the 'To:' field.
        #
        #   @param attachment_file_id [String] The ID of a File to be attached to the check. This must have `purpose: check_att
        #
        #   @param note [String] The descriptor that will be printed on the letter included with the check.
        #
        #   @param payee [Array<Increase::Models::CheckTransferCreateParams::PhysicalCheck::Payee>] The payee of the check. This will be printed on the top-left portion of the chec
        #
        #   @param return_address [Increase::Models::CheckTransferCreateParams::PhysicalCheck::ReturnAddress] The return address to be printed on the check. If omitted this will default to a
        #
        #   @param shipping_method [Symbol, Increase::Models::CheckTransferCreateParams::PhysicalCheck::ShippingMethod] How to ship the check. For details on pricing, timing, and restrictions, see htt
        #
        #   @param signature_text [String] The text that will appear as the signature on the check in cursive font. If not

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

          # @!attribute line2
          #   The second line of the address component of the check's destination address.
          #
          #   @return [String, nil]
          optional :line2, String

          # @!method initialize(city:, line1:, postal_code:, state:, line2: nil)
          #   Details for where Increase will mail the check.
          #
          #   @param city [String] The city component of the check's destination address.
          #
          #   @param line1 [String] The first line of the address component of the check's destination address.
          #
          #   @param postal_code [String] The postal code component of the check's destination address.
          #
          #   @param state [String] The US state component of the check's destination address.
          #
          #   @param line2 [String] The second line of the address component of the check's destination address.
        end

        class Payee < Increase::Internal::Type::BaseModel
          # @!attribute contents
          #   The contents of the line.
          #
          #   @return [String]
          required :contents, String

          # @!method initialize(contents:)
          #   @param contents [String] The contents of the line.
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

          # @!attribute line2
          #   The second line of the return address.
          #
          #   @return [String, nil]
          optional :line2, String

          # @!method initialize(city:, line1:, name:, postal_code:, state:, line2: nil)
          #   The return address to be printed on the check. If omitted this will default to
          #   an Increase-owned address that will mark checks as delivery failed and shred
          #   them.
          #
          #   @param city [String] The city of the return address.
          #
          #   @param line1 [String] The first line of the return address.
          #
          #   @param name [String] The name of the return address.
          #
          #   @param postal_code [String] The postal code of the return address.
          #
          #   @param state [String] The US state of the return address.
          #
          #   @param line2 [String] The second line of the return address.
        end

        # How to ship the check. For details on pricing, timing, and restrictions, see
        # https://increase.com/documentation/originating-checks#printing-checks .
        #
        # @see Increase::Models::CheckTransferCreateParams::PhysicalCheck#shipping_method
        module ShippingMethod
          extend Increase::Internal::Type::Enum

          # USPS First Class
          USPS_FIRST_CLASS = :usps_first_class

          # FedEx Overnight
          FEDEX_OVERNIGHT = :fedex_overnight

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class ThirdParty < Increase::Internal::Type::BaseModel
        # @!attribute recipient_name
        #   The pay-to name you will print on the check. If provided, this is used for
        #   [Positive Pay](/documentation/positive-pay). If this is omitted, Increase will
        #   be unable to validate the payee name when the check is deposited.
        #
        #   @return [String, nil]
        optional :recipient_name, String

        # @!method initialize(recipient_name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CheckTransferCreateParams::ThirdParty} for more details.
        #
        #   Details relating to the custom fulfillment you will perform. This is required if
        #   `fulfillment_method` is equal to `third_party`. It must not be included if any
        #   other `fulfillment_method` is provided.
        #
        #   @param recipient_name [String] The pay-to name you will print on the check. If provided, this is used for [Posi
      end
    end
  end
end
