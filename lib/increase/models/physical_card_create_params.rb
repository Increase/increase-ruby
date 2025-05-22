# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCards#create
    class PhysicalCardCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_id
      #   The underlying card representing this physical card.
      #
      #   @return [String]
      required :card_id, String

      # @!attribute cardholder
      #   Details about the cardholder, as it will appear on the physical card.
      #
      #   @return [Increase::Models::PhysicalCardCreateParams::Cardholder]
      required :cardholder, -> { Increase::PhysicalCardCreateParams::Cardholder }

      # @!attribute shipment
      #   The details used to ship this physical card.
      #
      #   @return [Increase::Models::PhysicalCardCreateParams::Shipment]
      required :shipment, -> { Increase::PhysicalCardCreateParams::Shipment }

      # @!attribute physical_card_profile_id
      #   The physical card profile to use for this physical card. The latest default
      #   physical card profile will be used if not provided.
      #
      #   @return [String, nil]
      optional :physical_card_profile_id, String

      # @!method initialize(card_id:, cardholder:, shipment:, physical_card_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::PhysicalCardCreateParams} for more details.
      #
      #   @param card_id [String] The underlying card representing this physical card.
      #
      #   @param cardholder [Increase::Models::PhysicalCardCreateParams::Cardholder] Details about the cardholder, as it will appear on the physical card.
      #
      #   @param shipment [Increase::Models::PhysicalCardCreateParams::Shipment] The details used to ship this physical card.
      #
      #   @param physical_card_profile_id [String] The physical card profile to use for this physical card. The latest default phys
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Cardholder < Increase::Internal::Type::BaseModel
        # @!attribute first_name
        #   The cardholder's first name.
        #
        #   @return [String]
        required :first_name, String

        # @!attribute last_name
        #   The cardholder's last name.
        #
        #   @return [String]
        required :last_name, String

        # @!method initialize(first_name:, last_name:)
        #   Details about the cardholder, as it will appear on the physical card.
        #
        #   @param first_name [String] The cardholder's first name.
        #
        #   @param last_name [String] The cardholder's last name.
      end

      class Shipment < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The address to where the card should be shipped.
        #
        #   @return [Increase::Models::PhysicalCardCreateParams::Shipment::Address]
        required :address, -> { Increase::PhysicalCardCreateParams::Shipment::Address }

        # @!attribute method_
        #   The shipping method to use.
        #
        #   @return [Symbol, Increase::Models::PhysicalCardCreateParams::Shipment::Method]
        required :method_,
                 enum: -> {
                   Increase::PhysicalCardCreateParams::Shipment::Method
                 },
                 api_name: :method

        # @!method initialize(address:, method_:)
        #   The details used to ship this physical card.
        #
        #   @param address [Increase::Models::PhysicalCardCreateParams::Shipment::Address] The address to where the card should be shipped.
        #
        #   @param method_ [Symbol, Increase::Models::PhysicalCardCreateParams::Shipment::Method] The shipping method to use.

        # @see Increase::Models::PhysicalCardCreateParams::Shipment#address
        class Address < Increase::Internal::Type::BaseModel
          # @!attribute city
          #   The city of the shipping address.
          #
          #   @return [String]
          required :city, String

          # @!attribute line1
          #   The first line of the shipping address.
          #
          #   @return [String]
          required :line1, String

          # @!attribute name
          #   The name of the recipient.
          #
          #   @return [String]
          required :name, String

          # @!attribute postal_code
          #   The postal code of the shipping address.
          #
          #   @return [String]
          required :postal_code, String

          # @!attribute state
          #   The US state of the shipping address.
          #
          #   @return [String]
          required :state, String

          # @!attribute line2
          #   The second line of the shipping address.
          #
          #   @return [String, nil]
          optional :line2, String

          # @!attribute line3
          #   The third line of the shipping address.
          #
          #   @return [String, nil]
          optional :line3, String

          # @!attribute phone_number
          #   The phone number of the recipient.
          #
          #   @return [String, nil]
          optional :phone_number, String

          # @!method initialize(city:, line1:, name:, postal_code:, state:, line2: nil, line3: nil, phone_number: nil)
          #   The address to where the card should be shipped.
          #
          #   @param city [String] The city of the shipping address.
          #
          #   @param line1 [String] The first line of the shipping address.
          #
          #   @param name [String] The name of the recipient.
          #
          #   @param postal_code [String] The postal code of the shipping address.
          #
          #   @param state [String] The US state of the shipping address.
          #
          #   @param line2 [String] The second line of the shipping address.
          #
          #   @param line3 [String] The third line of the shipping address.
          #
          #   @param phone_number [String] The phone number of the recipient.
        end

        # The shipping method to use.
        #
        # @see Increase::Models::PhysicalCardCreateParams::Shipment#method_
        module Method
          extend Increase::Internal::Type::Enum

          # USPS Post with tracking.
          USPS = :usps

          # FedEx Priority Overnight, no signature.
          FEDEX_PRIORITY_OVERNIGHT = :fedex_priority_overnight

          # FedEx 2-day.
          FEDEX_2_DAY = :fedex_2_day

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
