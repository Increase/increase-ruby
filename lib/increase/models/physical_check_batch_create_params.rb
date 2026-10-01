# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCheckBatches#create
    class PhysicalCheckBatchCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute mailing_address
      #   Details for where the parcel will be mailed.
      #
      #   @return [Increase::Models::PhysicalCheckBatchCreateParams::MailingAddress]
      required :mailing_address, -> { Increase::PhysicalCheckBatchCreateParams::MailingAddress }

      # @!attribute return_address
      #   Details for where the parcel should return if it is unable to be delivered.
      #
      #   @return [Increase::Models::PhysicalCheckBatchCreateParams::ReturnAddress]
      required :return_address, -> { Increase::PhysicalCheckBatchCreateParams::ReturnAddress }

      # @!attribute shipping_method
      #   How to ship the batch.
      #
      #   Defaults to `usps_first_class`.
      #
      #   @return [Symbol, Increase::Models::PhysicalCheckBatchCreateParams::ShippingMethod, nil]
      optional :shipping_method, enum: -> { Increase::PhysicalCheckBatchCreateParams::ShippingMethod }

      # @!method initialize(mailing_address:, return_address:, shipping_method: nil, request_options: {})
      #   @param mailing_address [Increase::Models::PhysicalCheckBatchCreateParams::MailingAddress]
      #     Details for where the parcel will be mailed.
      #
      #   @param return_address [Increase::Models::PhysicalCheckBatchCreateParams::ReturnAddress]
      #     Details for where the parcel should return if it is unable to be delivered.
      #
      #   @param shipping_method [Symbol, Increase::Models::PhysicalCheckBatchCreateParams::ShippingMethod]
      #     How to ship the batch.
      #
      #     Defaults to `usps_first_class`.
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

        # @!attribute phone
        #   The phone number used for delivery issues at the destination address. Only used
        #   when `shipping_method` is `fedex_overnight`.
        #
        #   @return [String, nil]
        optional :phone, String

        # @!method initialize(city:, line1:, name:, postal_code:, state:, line2: nil, phone: nil)
        #   Details for where the parcel will be mailed.
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
        #
        #   @param phone [String]
        #     The phone number used for delivery issues at the destination address. Only used
        #     when `shipping_method` is `fedex_overnight`.
      end

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
        #   The recipient at the return address.
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

        # @!attribute phone
        #   The phone number used for delivery issues at the return address. Only used when
        #   `shipping_method` is `fedex_overnight`.
        #
        #   @return [String, nil]
        optional :phone, String

        # @!method initialize(city:, line1:, name:, postal_code:, state:, line2: nil, phone: nil)
        #   Details for where the parcel should return if it is unable to be delivered.
        #
        #   @param city [String] The city of the return address.
        #
        #   @param line1 [String] The first line of the return address.
        #
        #   @param name [String] The recipient at the return address.
        #
        #   @param postal_code [String] The postal code of the return address.
        #
        #   @param state [String] The US state of the return address.
        #
        #   @param line2 [String] The second line of the return address.
        #
        #   @param phone [String]
        #     The phone number used for delivery issues at the return address. Only used when
        #     `shipping_method` is `fedex_overnight`.
      end

      # How to ship the batch.
      #
      # Defaults to `usps_first_class`.
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
  end
end
