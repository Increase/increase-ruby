# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class CardAuthentications
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::CardAuthenticationCreateParams} for more
        # details.
        #
        # Simulates a Card Authentication attempt on a [Card](#cards). The attempt always
        # results in a [Card Payment](#card_payments) being created, either with a status
        # that allows further action or a terminal failed status.
        #
        # @overload create(card_id:, category: nil, device_channel: nil, merchant_acceptor_id: nil, merchant_category_code: nil, merchant_country: nil, merchant_name: nil, purchase_amount: nil, request_options: {})
        #
        # @param card_id [String] The identifier of the Card to be authorized.
        #
        # @param category [Symbol, Increase::Models::Simulations::CardAuthenticationCreateParams::Category] The category of the card authentication attempt.
        #
        # @param device_channel [Symbol, Increase::Models::Simulations::CardAuthenticationCreateParams::DeviceChannel] The device channel of the card authentication attempt.
        #
        # @param merchant_acceptor_id [String] The merchant identifier (commonly abbreviated as MID) of the merchant the card i
        #
        # @param merchant_category_code [String] The Merchant Category Code (commonly abbreviated as MCC) of the merchant the car
        #
        # @param merchant_country [String] The country the merchant resides in.
        #
        # @param merchant_name [String] The name of the merchant
        #
        # @param purchase_amount [Integer] The purchase amount in cents.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::CardPayment]
        #
        # @see Increase::Models::Simulations::CardAuthenticationCreateParams
        def create(params)
          parsed, options = Increase::Simulations::CardAuthenticationCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/card_authentications",
            body: parsed,
            model: Increase::CardPayment,
            options: options
          )
        end

        # Simulates an attempt at a Card Authentication Challenge. This updates the
        # `card_authentications` object under the [Card Payment](#card_payments). You can
        # also attempt the challenge by navigating to
        # https://dashboard.increase.com/card_authentication_simulation/:card_payment_id.
        #
        # @overload challenge_attempts(card_payment_id, one_time_code:, request_options: {})
        #
        # @param card_payment_id [String] The identifier of the Card Payment to be challenged.
        #
        # @param one_time_code [String] The one-time code to be validated.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::CardPayment]
        #
        # @see Increase::Models::Simulations::CardAuthenticationChallengeAttemptsParams
        def challenge_attempts(card_payment_id, params)
          parsed, options = Increase::Simulations::CardAuthenticationChallengeAttemptsParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/card_authentications/%1$s/challenge_attempts", card_payment_id],
            body: parsed,
            model: Increase::CardPayment,
            options: options
          )
        end

        # Simulates starting a Card Authentication Challenge for an existing Card
        # Authentication. This updates the `card_authentications` object under the
        # [Card Payment](#card_payments). To attempt the challenge, use the
        # `/simulations/card_authentications/:card_payment_id/challenge_attempts` endpoint
        # or navigate to
        # https://dashboard.increase.com/card_authentication_simulation/:card_payment_id.
        #
        # @overload challenges(card_payment_id, request_options: {})
        #
        # @param card_payment_id [String] The identifier of the Card Payment to be challenged.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::CardPayment]
        #
        # @see Increase::Models::Simulations::CardAuthenticationChallengesParams
        def challenges(card_payment_id, params = {})
          @client.request(
            method: :post,
            path: ["simulations/card_authentications/%1$s/challenges", card_payment_id],
            model: Increase::CardPayment,
            options: params[:request_options]
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
end
