# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundMailItems#retrieve
    class InboundMailItemRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute inbound_mail_item_id
      #   The identifier of the Inbound Mail Item to retrieve.
      #
      #   @return [String]
      required :inbound_mail_item_id, String

      # @!method initialize(inbound_mail_item_id:, request_options: {})
      #   @param inbound_mail_item_id [String] The identifier of the Inbound Mail Item to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
