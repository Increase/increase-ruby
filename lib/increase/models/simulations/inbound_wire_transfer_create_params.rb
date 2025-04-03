# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::InboundWireTransfers#create
      class InboundWireTransferCreateParams < Increase::Internal::Type::BaseModel
        # @!parse
        #   extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute account_number_id
        #   The identifier of the Account Number the inbound Wire Transfer is for.
        #
        #   @return [String]
        required :account_number_id, String

        # @!attribute amount
        #   The transfer amount in cents. Must be positive.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute [r] beneficiary_address_line1
        #   The sending bank will set beneficiary_address_line1 in production. You can
        #     simulate any value here.
        #
        #   @return [String, nil]
        optional :beneficiary_address_line1, String

        # @!parse
        #   # @return [String]
        #   attr_writer :beneficiary_address_line1

        # @!attribute [r] beneficiary_address_line2
        #   The sending bank will set beneficiary_address_line2 in production. You can
        #     simulate any value here.
        #
        #   @return [String, nil]
        optional :beneficiary_address_line2, String

        # @!parse
        #   # @return [String]
        #   attr_writer :beneficiary_address_line2

        # @!attribute [r] beneficiary_address_line3
        #   The sending bank will set beneficiary_address_line3 in production. You can
        #     simulate any value here.
        #
        #   @return [String, nil]
        optional :beneficiary_address_line3, String

        # @!parse
        #   # @return [String]
        #   attr_writer :beneficiary_address_line3

        # @!attribute [r] beneficiary_name
        #   The sending bank will set beneficiary_name in production. You can simulate any
        #     value here.
        #
        #   @return [String, nil]
        optional :beneficiary_name, String

        # @!parse
        #   # @return [String]
        #   attr_writer :beneficiary_name

        # @!attribute [r] beneficiary_reference
        #   The sending bank will set beneficiary_reference in production. You can simulate
        #     any value here.
        #
        #   @return [String, nil]
        optional :beneficiary_reference, String

        # @!parse
        #   # @return [String]
        #   attr_writer :beneficiary_reference

        # @!attribute [r] originator_address_line1
        #   The sending bank will set originator_address_line1 in production. You can
        #     simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_address_line1, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_address_line1

        # @!attribute [r] originator_address_line2
        #   The sending bank will set originator_address_line2 in production. You can
        #     simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_address_line2, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_address_line2

        # @!attribute [r] originator_address_line3
        #   The sending bank will set originator_address_line3 in production. You can
        #     simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_address_line3, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_address_line3

        # @!attribute [r] originator_name
        #   The sending bank will set originator_name in production. You can simulate any
        #     value here.
        #
        #   @return [String, nil]
        optional :originator_name, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_name

        # @!attribute [r] originator_routing_number
        #   The sending bank will set originator_routing_number in production. You can
        #     simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_routing_number, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_routing_number

        # @!attribute [r] originator_to_beneficiary_information_line1
        #   The sending bank will set originator_to_beneficiary_information_line1 in
        #     production. You can simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line1, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_to_beneficiary_information_line1

        # @!attribute [r] originator_to_beneficiary_information_line2
        #   The sending bank will set originator_to_beneficiary_information_line2 in
        #     production. You can simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line2, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_to_beneficiary_information_line2

        # @!attribute [r] originator_to_beneficiary_information_line3
        #   The sending bank will set originator_to_beneficiary_information_line3 in
        #     production. You can simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line3, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_to_beneficiary_information_line3

        # @!attribute [r] originator_to_beneficiary_information_line4
        #   The sending bank will set originator_to_beneficiary_information_line4 in
        #     production. You can simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line4, String

        # @!parse
        #   # @return [String]
        #   attr_writer :originator_to_beneficiary_information_line4

        # @!attribute [r] sender_reference
        #   The sending bank will set sender_reference in production. You can simulate any
        #     value here.
        #
        #   @return [String, nil]
        optional :sender_reference, String

        # @!parse
        #   # @return [String]
        #   attr_writer :sender_reference

        # @!parse
        #   # @param account_number_id [String]
        #   # @param amount [Integer]
        #   # @param beneficiary_address_line1 [String]
        #   # @param beneficiary_address_line2 [String]
        #   # @param beneficiary_address_line3 [String]
        #   # @param beneficiary_name [String]
        #   # @param beneficiary_reference [String]
        #   # @param originator_address_line1 [String]
        #   # @param originator_address_line2 [String]
        #   # @param originator_address_line3 [String]
        #   # @param originator_name [String]
        #   # @param originator_routing_number [String]
        #   # @param originator_to_beneficiary_information_line1 [String]
        #   # @param originator_to_beneficiary_information_line2 [String]
        #   # @param originator_to_beneficiary_information_line3 [String]
        #   # @param originator_to_beneficiary_information_line4 [String]
        #   # @param sender_reference [String]
        #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(
        #     account_number_id:,
        #     amount:,
        #     beneficiary_address_line1: nil,
        #     beneficiary_address_line2: nil,
        #     beneficiary_address_line3: nil,
        #     beneficiary_name: nil,
        #     beneficiary_reference: nil,
        #     originator_address_line1: nil,
        #     originator_address_line2: nil,
        #     originator_address_line3: nil,
        #     originator_name: nil,
        #     originator_routing_number: nil,
        #     originator_to_beneficiary_information_line1: nil,
        #     originator_to_beneficiary_information_line2: nil,
        #     originator_to_beneficiary_information_line3: nil,
        #     originator_to_beneficiary_information_line4: nil,
        #     sender_reference: nil,
        #     request_options: {},
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end
    end
  end
end
