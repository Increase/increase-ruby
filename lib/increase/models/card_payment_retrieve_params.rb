# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardPayments#retrieve
    class CardPaymentRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_payment_id
      #   The identifier of the Card Payment.
      #
      #   @return [String]
      required :card_payment_id, String

      # @!method initialize(card_payment_id:, request_options: {})
      #   @param card_payment_id [String] The identifier of the Card Payment.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
