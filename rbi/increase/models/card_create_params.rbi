# typed: strong

module Increase
  module Models
    class CardCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CardCreateParams, Increase::Internal::AnyHash)
        end

      # The Account the card should belong to.
      sig { returns(String) }
      attr_accessor :account_id

      # The card's billing address.
      sig { returns(T.nilable(Increase::CardCreateParams::BillingAddress)) }
      attr_reader :billing_address

      sig do
        params(
          billing_address: Increase::CardCreateParams::BillingAddress::OrHash
        ).void
      end
      attr_writer :billing_address

      # The description you choose to give the card.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The contact information used in the two-factor steps for digital wallet card
      # creation. To add the card to a digital wallet, you may supply an email or phone
      # number with this request. Otherwise, subscribe and then action a Real Time
      # Decision with the category `digital_wallet_token_requested` or
      # `digital_wallet_authentication_requested`.
      sig { returns(T.nilable(Increase::CardCreateParams::DigitalWallet)) }
      attr_reader :digital_wallet

      sig do
        params(
          digital_wallet: Increase::CardCreateParams::DigitalWallet::OrHash
        ).void
      end
      attr_writer :digital_wallet

      # The Entity the card belongs to. You only need to supply this in rare situations
      # when the card is not for the Account holder.
      sig { returns(T.nilable(String)) }
      attr_reader :entity_id

      sig { params(entity_id: String).void }
      attr_writer :entity_id

      sig do
        params(
          account_id: String,
          billing_address: Increase::CardCreateParams::BillingAddress::OrHash,
          description: String,
          digital_wallet: Increase::CardCreateParams::DigitalWallet::OrHash,
          entity_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account the card should belong to.
        account_id:,
        # The card's billing address.
        billing_address: nil,
        # The description you choose to give the card.
        description: nil,
        # The contact information used in the two-factor steps for digital wallet card
        # creation. To add the card to a digital wallet, you may supply an email or phone
        # number with this request. Otherwise, subscribe and then action a Real Time
        # Decision with the category `digital_wallet_token_requested` or
        # `digital_wallet_authentication_requested`.
        digital_wallet: nil,
        # The Entity the card belongs to. You only need to supply this in rare situations
        # when the card is not for the Account holder.
        entity_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            billing_address: Increase::CardCreateParams::BillingAddress,
            description: String,
            digital_wallet: Increase::CardCreateParams::DigitalWallet,
            entity_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class BillingAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardCreateParams::BillingAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city of the billing address.
        sig { returns(String) }
        attr_accessor :city

        # The first line of the billing address.
        sig { returns(String) }
        attr_accessor :line1

        # The postal code of the billing address.
        sig { returns(String) }
        attr_accessor :postal_code

        # The US state of the billing address.
        sig { returns(String) }
        attr_accessor :state

        # The second line of the billing address.
        sig { returns(T.nilable(String)) }
        attr_reader :line2

        sig { params(line2: String).void }
        attr_writer :line2

        # The card's billing address.
        sig do
          params(
            city: String,
            line1: String,
            postal_code: String,
            state: String,
            line2: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city of the billing address.
          city:,
          # The first line of the billing address.
          line1:,
          # The postal code of the billing address.
          postal_code:,
          # The US state of the billing address.
          state:,
          # The second line of the billing address.
          line2: nil
        )
        end

        sig do
          override.returns(
            {
              city: String,
              line1: String,
              postal_code: String,
              state: String,
              line2: String
            }
          )
        end
        def to_hash
        end
      end

      class DigitalWallet < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardCreateParams::DigitalWallet,
              Increase::Internal::AnyHash
            )
          end

        # The digital card profile assigned to this digital card.
        sig { returns(T.nilable(String)) }
        attr_reader :digital_card_profile_id

        sig { params(digital_card_profile_id: String).void }
        attr_writer :digital_card_profile_id

        # An email address that can be used to contact and verify the cardholder via
        # one-time passcode over email.
        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

        # A phone number that can be used to contact and verify the cardholder via
        # one-time passcode over SMS.
        sig { returns(T.nilable(String)) }
        attr_reader :phone

        sig { params(phone: String).void }
        attr_writer :phone

        # The contact information used in the two-factor steps for digital wallet card
        # creation. To add the card to a digital wallet, you may supply an email or phone
        # number with this request. Otherwise, subscribe and then action a Real Time
        # Decision with the category `digital_wallet_token_requested` or
        # `digital_wallet_authentication_requested`.
        sig do
          params(
            digital_card_profile_id: String,
            email: String,
            phone: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The digital card profile assigned to this digital card.
          digital_card_profile_id: nil,
          # An email address that can be used to contact and verify the cardholder via
          # one-time passcode over email.
          email: nil,
          # A phone number that can be used to contact and verify the cardholder via
          # one-time passcode over SMS.
          phone: nil
        )
        end

        sig do
          override.returns(
            { digital_card_profile_id: String, email: String, phone: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
