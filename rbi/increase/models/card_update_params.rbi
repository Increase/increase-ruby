# typed: strong

module Increase
  module Models
    class CardUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CardUpdateParams, Increase::Internal::AnyHash)
        end

      # The card's updated billing address.
      sig { returns(T.nilable(Increase::CardUpdateParams::BillingAddress)) }
      attr_reader :billing_address

      sig do
        params(
          billing_address: Increase::CardUpdateParams::BillingAddress::OrHash
        ).void
      end
      attr_writer :billing_address

      # The description you choose to give the card.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The contact information used in the two-factor steps for digital wallet card
      # creation. At least one field must be present to complete the digital wallet
      # steps.
      sig { returns(T.nilable(Increase::CardUpdateParams::DigitalWallet)) }
      attr_reader :digital_wallet

      sig do
        params(
          digital_wallet: Increase::CardUpdateParams::DigitalWallet::OrHash
        ).void
      end
      attr_writer :digital_wallet

      # The Entity the card belongs to. You only need to supply this in rare situations
      # when the card is not for the Account holder.
      sig { returns(T.nilable(String)) }
      attr_reader :entity_id

      sig { params(entity_id: String).void }
      attr_writer :entity_id

      # The 4-digit PIN for the card, for use with ATMs.
      sig { returns(T.nilable(String)) }
      attr_reader :pin

      sig { params(pin: String).void }
      attr_writer :pin

      # The status to update the Card with.
      sig { returns(T.nilable(Increase::CardUpdateParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: Increase::CardUpdateParams::Status::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          billing_address: Increase::CardUpdateParams::BillingAddress::OrHash,
          description: String,
          digital_wallet: Increase::CardUpdateParams::DigitalWallet::OrHash,
          entity_id: String,
          pin: String,
          status: Increase::CardUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The card's updated billing address.
        billing_address: nil,
        # The description you choose to give the card.
        description: nil,
        # The contact information used in the two-factor steps for digital wallet card
        # creation. At least one field must be present to complete the digital wallet
        # steps.
        digital_wallet: nil,
        # The Entity the card belongs to. You only need to supply this in rare situations
        # when the card is not for the Account holder.
        entity_id: nil,
        # The 4-digit PIN for the card, for use with ATMs.
        pin: nil,
        # The status to update the Card with.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            billing_address: Increase::CardUpdateParams::BillingAddress,
            description: String,
            digital_wallet: Increase::CardUpdateParams::DigitalWallet,
            entity_id: String,
            pin: String,
            status: Increase::CardUpdateParams::Status::OrSymbol,
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
              Increase::CardUpdateParams::BillingAddress,
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

        # The card's updated billing address.
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
              Increase::CardUpdateParams::DigitalWallet,
              Increase::Internal::AnyHash
            )
          end

        # The digital card profile assigned to this digital card.
        sig { returns(T.nilable(String)) }
        attr_reader :digital_card_profile_id

        sig { params(digital_card_profile_id: String).void }
        attr_writer :digital_card_profile_id

        # An email address that can be used to verify the cardholder via one-time passcode
        # over email.
        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

        # A phone number that can be used to verify the cardholder via one-time passcode
        # over SMS.
        sig { returns(T.nilable(String)) }
        attr_reader :phone

        sig { params(phone: String).void }
        attr_writer :phone

        # The contact information used in the two-factor steps for digital wallet card
        # creation. At least one field must be present to complete the digital wallet
        # steps.
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
          # An email address that can be used to verify the cardholder via one-time passcode
          # over email.
          email: nil,
          # A phone number that can be used to verify the cardholder via one-time passcode
          # over SMS.
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

      # The status to update the Card with.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardUpdateParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The card is active.
        ACTIVE =
          T.let(:active, Increase::CardUpdateParams::Status::TaggedSymbol)

        # The card is temporarily disabled.
        DISABLED =
          T.let(:disabled, Increase::CardUpdateParams::Status::TaggedSymbol)

        # The card is permanently canceled.
        CANCELED =
          T.let(:canceled, Increase::CardUpdateParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CardUpdateParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
