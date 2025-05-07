# frozen_string_literal: true

module Increase
  module Resources
    class CardPayments
      # Retrieve a Card Payment
      #
      # @overload retrieve(card_payment_id, request_options: {})
      #
      # @param card_payment_id [String] The identifier of the Card Payment.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::CardPayment]
      #
      # @see Increase::Models::CardPaymentRetrieveParams
      def retrieve(card_payment_id, params = {})
        @client.request(
          method: :get,
          path: ["card_payments/%1$s", card_payment_id],
          model: Increase::CardPayment,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::CardPaymentListParams} for more details.
      #
      # List Card Payments
      #
      # @overload list(account_id: nil, card_id: nil, created_at: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param account_id [String] Filter Card Payments to ones belonging to the specified Account.
      #
      # @param card_id [String] Filter Card Payments to ones belonging to the specified Card.
      #
      # @param created_at [Increase::CardPaymentListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::CardPayment>]
      #
      # @see Increase::Models::CardPaymentListParams
      def list(params = {})
        parsed, options = Increase::CardPaymentListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "card_payments",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::CardPayment,
          options: options
        )
      end

      # @api private
      #
      # @param client [Increase::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
