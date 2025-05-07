# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::InboundWireTransfers#create
      class InboundWireTransferCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
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

        # @!attribute beneficiary_address_line1
        #   The sending bank will set beneficiary_address_line1 in production. You can
        #   simulate any value here.
        #
        #   @return [String, nil]
        optional :beneficiary_address_line1, String

        # @!attribute beneficiary_address_line2
        #   The sending bank will set beneficiary_address_line2 in production. You can
        #   simulate any value here.
        #
        #   @return [String, nil]
        optional :beneficiary_address_line2, String

        # @!attribute beneficiary_address_line3
        #   The sending bank will set beneficiary_address_line3 in production. You can
        #   simulate any value here.
        #
        #   @return [String, nil]
        optional :beneficiary_address_line3, String

        # @!attribute beneficiary_name
        #   The sending bank will set beneficiary_name in production. You can simulate any
        #   value here.
        #
        #   @return [String, nil]
        optional :beneficiary_name, String

        # @!attribute beneficiary_reference
        #   The sending bank will set beneficiary_reference in production. You can simulate
        #   any value here.
        #
        #   @return [String, nil]
        optional :beneficiary_reference, String

        # @!attribute originator_address_line1
        #   The sending bank will set originator_address_line1 in production. You can
        #   simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_address_line1, String

        # @!attribute originator_address_line2
        #   The sending bank will set originator_address_line2 in production. You can
        #   simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_address_line2, String

        # @!attribute originator_address_line3
        #   The sending bank will set originator_address_line3 in production. You can
        #   simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_address_line3, String

        # @!attribute originator_name
        #   The sending bank will set originator_name in production. You can simulate any
        #   value here.
        #
        #   @return [String, nil]
        optional :originator_name, String

        # @!attribute originator_routing_number
        #   The sending bank will set originator_routing_number in production. You can
        #   simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_routing_number, String

        # @!attribute originator_to_beneficiary_information_line1
        #   The sending bank will set originator_to_beneficiary_information_line1 in
        #   production. You can simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line1, String

        # @!attribute originator_to_beneficiary_information_line2
        #   The sending bank will set originator_to_beneficiary_information_line2 in
        #   production. You can simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line2, String

        # @!attribute originator_to_beneficiary_information_line3
        #   The sending bank will set originator_to_beneficiary_information_line3 in
        #   production. You can simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line3, String

        # @!attribute originator_to_beneficiary_information_line4
        #   The sending bank will set originator_to_beneficiary_information_line4 in
        #   production. You can simulate any value here.
        #
        #   @return [String, nil]
        optional :originator_to_beneficiary_information_line4, String

        # @!attribute sender_reference
        #   The sending bank will set sender_reference in production. You can simulate any
        #   value here.
        #
        #   @return [String, nil]
        optional :sender_reference, String

        # @!method initialize(account_number_id:, amount:, beneficiary_address_line1: nil, beneficiary_address_line2: nil, beneficiary_address_line3: nil, beneficiary_name: nil, beneficiary_reference: nil, originator_address_line1: nil, originator_address_line2: nil, originator_address_line3: nil, originator_name: nil, originator_routing_number: nil, originator_to_beneficiary_information_line1: nil, originator_to_beneficiary_information_line2: nil, originator_to_beneficiary_information_line3: nil, originator_to_beneficiary_information_line4: nil, sender_reference: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::InboundWireTransferCreateParams} for more
        #   details.
        #
        #   @param account_number_id [String] The identifier of the Account Number the inbound Wire Transfer is for.
        #
        #   @param amount [Integer] The transfer amount in cents. Must be positive.
        #
        #   @param beneficiary_address_line1 [String] The sending bank will set beneficiary_address_line1 in production. You can simul
        #
        #   @param beneficiary_address_line2 [String] The sending bank will set beneficiary_address_line2 in production. You can simul
        #
        #   @param beneficiary_address_line3 [String] The sending bank will set beneficiary_address_line3 in production. You can simul
        #
        #   @param beneficiary_name [String] The sending bank will set beneficiary_name in production. You can simulate any v
        #
        #   @param beneficiary_reference [String] The sending bank will set beneficiary_reference in production. You can simulate
        #
        #   @param originator_address_line1 [String] The sending bank will set originator_address_line1 in production. You can simula
        #
        #   @param originator_address_line2 [String] The sending bank will set originator_address_line2 in production. You can simula
        #
        #   @param originator_address_line3 [String] The sending bank will set originator_address_line3 in production. You can simula
        #
        #   @param originator_name [String] The sending bank will set originator_name in production. You can simulate any va
        #
        #   @param originator_routing_number [String] The sending bank will set originator_routing_number in production. You can simul
        #
        #   @param originator_to_beneficiary_information_line1 [String] The sending bank will set originator_to_beneficiary_information_line1 in product
        #
        #   @param originator_to_beneficiary_information_line2 [String] The sending bank will set originator_to_beneficiary_information_line2 in product
        #
        #   @param originator_to_beneficiary_information_line3 [String] The sending bank will set originator_to_beneficiary_information_line3 in product
        #
        #   @param originator_to_beneficiary_information_line4 [String] The sending bank will set originator_to_beneficiary_information_line4 in product
        #
        #   @param sender_reference [String] The sending bank will set sender_reference in production. You can simulate any v
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
