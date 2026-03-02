# typed: strong

module Increase
  module Resources
    class Simulations
      class CardAuthentications
        # Simulates a Card Authentication attempt on a [Card](#cards). The attempt always
        # results in a [Card Payment](#card_payments) being created, either with a status
        # that allows further action or a terminal failed status.
        sig do
          params(
            card_id: String,
            category:
              Increase::Simulations::CardAuthenticationCreateParams::Category::OrSymbol,
            device_channel:
              Increase::Simulations::CardAuthenticationCreateParams::DeviceChannel::OrSymbol,
            merchant_acceptor_id: String,
            merchant_category_code: String,
            merchant_country: String,
            merchant_name: String,
            purchase_amount: Integer,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CardPayment)
        end
        def create(
          # The identifier of the Card to be authorized.
          card_id:,
          # The category of the card authentication attempt.
          category: nil,
          # The device channel of the card authentication attempt.
          device_channel: nil,
          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          merchant_acceptor_id: nil,
          # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
          # card is transacting with.
          merchant_category_code: nil,
          # The country the merchant resides in.
          merchant_country: nil,
          # The name of the merchant
          merchant_name: nil,
          # The purchase amount in cents.
          purchase_amount: nil,
          request_options: {}
        )
        end

        # Simulates an attempt at a Card Authentication Challenge. This updates the
        # `card_authentications` object under the [Card Payment](#card_payments). You can
        # also attempt the challenge by navigating to
        # https://dashboard.increase.com/card_authentication_simulation/:card_payment_id.
        sig do
          params(
            card_payment_id: String,
            one_time_code: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CardPayment)
        end
        def challenge_attempts(
          # The identifier of the Card Payment to be challenged.
          card_payment_id,
          # The one-time code to be validated.
          one_time_code:,
          request_options: {}
        )
        end

        # Simulates starting a Card Authentication Challenge for an existing Card
        # Authentication. This updates the `card_authentications` object under the
        # [Card Payment](#card_payments). To attempt the challenge, use the
        # `/simulations/card_authentications/:card_payment_id/challenge_attempts` endpoint
        # or navigate to
        # https://dashboard.increase.com/card_authentication_simulation/:card_payment_id.
        sig do
          params(
            card_payment_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CardPayment)
        end
        def challenges(
          # The identifier of the Card Payment to be challenged.
          card_payment_id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Increase::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
