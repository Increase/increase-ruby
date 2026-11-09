# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Checkbooks#create
    class CheckbookCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_number_id
      #   The identifier of the Account Number that the checks will draw from. The Account
      #   Number must be active.
      #
      #   @return [String]
      required :account_number_id, String

      # @!attribute mailing_address
      #   The destination address that the Checkbook will be mailed to.
      #
      #   @return [Increase::Models::CheckbookCreateParams::MailingAddress]
      required :mailing_address, -> { Increase::CheckbookCreateParams::MailingAddress }

      # @!attribute payer
      #   The payer of the checks. This will be printed on the top-left corner of each
      #   check. This should be an array of up to 4 elements, each of which represents a
      #   line of the payer.
      #
      #   @return [Array<Increase::Models::CheckbookCreateParams::Payer>]
      required :payer, -> { Increase::Internal::Type::ArrayOf[Increase::CheckbookCreateParams::Payer] }

      # @!method initialize(account_number_id:, mailing_address:, payer:, request_options: {})
      #   @param account_number_id [String]
      #     The identifier of the Account Number that the checks will draw from. The Account
      #     Number must be active.
      #
      #   @param mailing_address [Increase::Models::CheckbookCreateParams::MailingAddress]
      #     The destination address that the Checkbook will be mailed to.
      #
      #   @param payer [Array<Increase::Models::CheckbookCreateParams::Payer>]
      #     The payer of the checks. This will be printed on the top-left corner of each
      #     check. This should be an array of up to 4 elements, each of which represents a
      #     line of the payer.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class MailingAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city of the destination address.
        #
        #   @return [String]
        required :city, String

        # @!attribute line1
        #   The first line of the destination address.
        #
        #   @return [String]
        required :line1, String

        # @!attribute name
        #   The recipient at the destination address.
        #
        #   @return [String]
        required :name, String

        # @!attribute postal_code
        #   The postal code of the destination address.
        #
        #   @return [String]
        required :postal_code, String

        # @!attribute state
        #   The US state of the destination address.
        #
        #   @return [String]
        required :state, String

        # @!attribute line2
        #   The second line of the destination address.
        #
        #   @return [String, nil]
        optional :line2, String

        # @!method initialize(city:, line1:, name:, postal_code:, state:, line2: nil)
        #   The destination address that the Checkbook will be mailed to.
        #
        #   @param city [String] The city of the destination address.
        #
        #   @param line1 [String] The first line of the destination address.
        #
        #   @param name [String] The recipient at the destination address.
        #
        #   @param postal_code [String] The postal code of the destination address.
        #
        #   @param state [String] The US state of the destination address.
        #
        #   @param line2 [String] The second line of the destination address.
      end

      class Payer < Increase::Internal::Type::BaseModel
        # @!attribute contents
        #   The contents of the line.
        #
        #   @return [String]
        required :contents, String

        # @!method initialize(contents:)
        #   @param contents [String] The contents of the line.
      end
    end
  end
end
