# typed: strong

module Increase
  module Models
    module Simulations
      class CardAuthenticationCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CardAuthenticationCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Card to be authorized.
        sig { returns(String) }
        attr_accessor :card_id

        # The category of the card authentication attempt.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::CardAuthenticationCreateParams::Category::OrSymbol
            )
          )
        end
        attr_reader :category

        sig do
          params(
            category:
              Increase::Simulations::CardAuthenticationCreateParams::Category::OrSymbol
          ).void
        end
        attr_writer :category

        # The device channel of the card authentication attempt.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::CardAuthenticationCreateParams::DeviceChannel::OrSymbol
            )
          )
        end
        attr_reader :device_channel

        sig do
          params(
            device_channel:
              Increase::Simulations::CardAuthenticationCreateParams::DeviceChannel::OrSymbol
          ).void
        end
        attr_writer :device_channel

        # The merchant identifier (commonly abbreviated as MID) of the merchant the card
        # is transacting with.
        sig { returns(T.nilable(String)) }
        attr_reader :merchant_acceptor_id

        sig { params(merchant_acceptor_id: String).void }
        attr_writer :merchant_acceptor_id

        # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
        # card is transacting with.
        sig { returns(T.nilable(String)) }
        attr_reader :merchant_category_code

        sig { params(merchant_category_code: String).void }
        attr_writer :merchant_category_code

        # The country the merchant resides in.
        sig { returns(T.nilable(String)) }
        attr_reader :merchant_country

        sig { params(merchant_country: String).void }
        attr_writer :merchant_country

        # The name of the merchant
        sig { returns(T.nilable(String)) }
        attr_reader :merchant_name

        sig { params(merchant_name: String).void }
        attr_writer :merchant_name

        # The purchase amount in cents.
        sig { returns(T.nilable(Integer)) }
        attr_reader :purchase_amount

        sig { params(purchase_amount: Integer).void }
        attr_writer :purchase_amount

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
          ).returns(T.attached_class)
        end
        def self.new(
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

        sig do
          override.returns(
            {
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
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The category of the card authentication attempt.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::CardAuthenticationCreateParams::Category
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The authentication attempt is for a payment.
          PAYMENT_AUTHENTICATION =
            T.let(
              :payment_authentication,
              Increase::Simulations::CardAuthenticationCreateParams::Category::TaggedSymbol
            )

          # The authentication attempt is not for a payment.
          NON_PAYMENT_AUTHENTICATION =
            T.let(
              :non_payment_authentication,
              Increase::Simulations::CardAuthenticationCreateParams::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::CardAuthenticationCreateParams::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The device channel of the card authentication attempt.
        module DeviceChannel
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::CardAuthenticationCreateParams::DeviceChannel
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The authentication attempt was made from an app.
          APP =
            T.let(
              :app,
              Increase::Simulations::CardAuthenticationCreateParams::DeviceChannel::TaggedSymbol
            )

          # The authentication attempt was made from a browser.
          BROWSER =
            T.let(
              :browser,
              Increase::Simulations::CardAuthenticationCreateParams::DeviceChannel::TaggedSymbol
            )

          # The authentication attempt was initiated by the 3DS Requestor.
          THREE_DS_REQUESTOR_INITIATED =
            T.let(
              :three_ds_requestor_initiated,
              Increase::Simulations::CardAuthenticationCreateParams::DeviceChannel::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::CardAuthenticationCreateParams::DeviceChannel::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
