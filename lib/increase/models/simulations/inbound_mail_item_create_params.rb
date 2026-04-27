# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::InboundMailItems#create
      class InboundMailItemCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute amount
        #   The amount of the check to be simulated, in cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute contents_file_id
        #   The file containing the PDF contents. If not present, a default check image file
        #   will be used.
        #
        #   @return [String, nil]
        optional :contents_file_id, String

        # @!attribute lockbox_address_id
        #   The identifier of the Lockbox Address to simulate inbound mail to.
        #
        #   @return [String, nil]
        optional :lockbox_address_id, String

        # @!attribute lockbox_recipient_id
        #   The identifier of the Lockbox Recipient to simulate inbound mail to.
        #
        #   @return [String, nil]
        optional :lockbox_recipient_id, String

        # @!method initialize(amount:, contents_file_id: nil, lockbox_address_id: nil, lockbox_recipient_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::InboundMailItemCreateParams} for more details.
        #
        #   @param amount [Integer] The amount of the check to be simulated, in cents.
        #
        #   @param contents_file_id [String] The file containing the PDF contents. If not present, a default check image file
        #
        #   @param lockbox_address_id [String] The identifier of the Lockbox Address to simulate inbound mail to.
        #
        #   @param lockbox_recipient_id [String] The identifier of the Lockbox Recipient to simulate inbound mail to.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
