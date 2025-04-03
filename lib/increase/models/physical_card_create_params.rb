# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCards#create
    class PhysicalCardCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
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
      required :cardholder, -> { Increase::Models::PhysicalCardCreateParams::Cardholder }

      # @!attribute shipment
      #   The details used to ship this physical card.
      #
      #   @return [Increase::Models::PhysicalCardCreateParams::Shipment]
      required :shipment, -> { Increase::Models::PhysicalCardCreateParams::Shipment }

      # @!attribute [r] physical_card_profile_id
      #   The physical card profile to use for this physical card. The latest default
      #     physical card profile will be used if not provided.
      #
      #   @return [String, nil]
      optional :physical_card_profile_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :physical_card_profile_id

      # @!parse
      #   # @param card_id [String]
      #   # @param cardholder [Increase::Models::PhysicalCardCreateParams::Cardholder]
      #   # @param shipment [Increase::Models::PhysicalCardCreateParams::Shipment]
      #   # @param physical_card_profile_id [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(card_id:, cardholder:, shipment:, physical_card_profile_id: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

        # @!parse
        #   # Details about the cardholder, as it will appear on the physical card.
        #   #
        #   # @param first_name [String]
        #   # @param last_name [String]
        #   #
        #   def initialize(first_name:, last_name:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      class Shipment < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   The address to where the card should be shipped.
        #
        #   @return [Increase::Models::PhysicalCardCreateParams::Shipment::Address]
        required :address, -> { Increase::Models::PhysicalCardCreateParams::Shipment::Address }

        # @!attribute method_
        #   The shipping method to use.
        #
        #   @return [Symbol, Increase::Models::PhysicalCardCreateParams::Shipment::Method]
        required :method_,
                 enum: -> { Increase::Models::PhysicalCardCreateParams::Shipment::Method },
                 api_name: :method

        # @!parse
        #   # The details used to ship this physical card.
        #   #
        #   # @param address [Increase::Models::PhysicalCardCreateParams::Shipment::Address]
        #   # @param method_ [Symbol, Increase::Models::PhysicalCardCreateParams::Shipment::Method]
        #   #
        #   def initialize(address:, method_:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

          # @!attribute [r] line2
          #   The second line of the shipping address.
          #
          #   @return [String, nil]
          optional :line2, String

          # @!parse
          #   # @return [String]
          #   attr_writer :line2

          # @!attribute [r] line3
          #   The third line of the shipping address.
          #
          #   @return [String, nil]
          optional :line3, String

          # @!parse
          #   # @return [String]
          #   attr_writer :line3

          # @!attribute [r] phone_number
          #   The phone number of the recipient.
          #
          #   @return [String, nil]
          optional :phone_number, String

          # @!parse
          #   # @return [String]
          #   attr_writer :phone_number

          # @!parse
          #   # The address to where the card should be shipped.
          #   #
          #   # @param city [String]
          #   # @param line1 [String]
          #   # @param name [String]
          #   # @param postal_code [String]
          #   # @param state [String]
          #   # @param line2 [String]
          #   # @param line3 [String]
          #   # @param phone_number [String]
          #   #
          #   def initialize(city:, line1:, name:, postal_code:, state:, line2: nil, line3: nil, phone_number: nil, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
