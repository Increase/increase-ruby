# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Cards#create
    class CardCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The Account the card should belong to.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute [r] billing_address
      #   The card's billing address.
      #
      #   @return [Increase::Models::CardCreateParams::BillingAddress, nil]
      optional :billing_address, -> { Increase::Models::CardCreateParams::BillingAddress }

      # @!parse
      #   # @return [Increase::Models::CardCreateParams::BillingAddress]
      #   attr_writer :billing_address

      # @!attribute [r] description
      #   The description you choose to give the card.
      #
      #   @return [String, nil]
      optional :description, String

      # @!parse
      #   # @return [String]
      #   attr_writer :description

      # @!attribute [r] digital_wallet
      #   The contact information used in the two-factor steps for digital wallet card
      #     creation. To add the card to a digital wallet, you may supply an email or phone
      #     number with this request. Otherwise, subscribe and then action a Real Time
      #     Decision with the category `digital_wallet_token_requested` or
      #     `digital_wallet_authentication_requested`.
      #
      #   @return [Increase::Models::CardCreateParams::DigitalWallet, nil]
      optional :digital_wallet, -> { Increase::Models::CardCreateParams::DigitalWallet }

      # @!parse
      #   # @return [Increase::Models::CardCreateParams::DigitalWallet]
      #   attr_writer :digital_wallet

      # @!attribute [r] entity_id
      #   The Entity the card belongs to. You only need to supply this in rare situations
      #     when the card is not for the Account holder.
      #
      #   @return [String, nil]
      optional :entity_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :entity_id

      # @!parse
      #   # @param account_id [String]
      #   # @param billing_address [Increase::Models::CardCreateParams::BillingAddress]
      #   # @param description [String]
      #   # @param digital_wallet [Increase::Models::CardCreateParams::DigitalWallet]
      #   # @param entity_id [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     account_id:,
      #     billing_address: nil,
      #     description: nil,
      #     digital_wallet: nil,
      #     entity_id: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class BillingAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city of the billing address.
        #
        #   @return [String]
        required :city, String

        # @!attribute line1
        #   The first line of the billing address.
        #
        #   @return [String]
        required :line1, String

        # @!attribute postal_code
        #   The postal code of the billing address.
        #
        #   @return [String]
        required :postal_code, String

        # @!attribute state
        #   The US state of the billing address.
        #
        #   @return [String]
        required :state, String

        # @!attribute [r] line2
        #   The second line of the billing address.
        #
        #   @return [String, nil]
        optional :line2, String

        # @!parse
        #   # @return [String]
        #   attr_writer :line2

        # @!parse
        #   # The card's billing address.
        #   #
        #   # @param city [String]
        #   # @param line1 [String]
        #   # @param postal_code [String]
        #   # @param state [String]
        #   # @param line2 [String]
        #   #
        #   def initialize(city:, line1:, postal_code:, state:, line2: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      class DigitalWallet < Increase::Internal::Type::BaseModel
        # @!attribute [r] digital_card_profile_id
        #   The digital card profile assigned to this digital card.
        #
        #   @return [String, nil]
        optional :digital_card_profile_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :digital_card_profile_id

        # @!attribute [r] email
        #   An email address that can be used to contact and verify the cardholder via
        #     one-time passcode over email.
        #
        #   @return [String, nil]
        optional :email, String

        # @!parse
        #   # @return [String]
        #   attr_writer :email

        # @!attribute [r] phone
        #   A phone number that can be used to contact and verify the cardholder via
        #     one-time passcode over SMS.
        #
        #   @return [String, nil]
        optional :phone, String

        # @!parse
        #   # @return [String]
        #   attr_writer :phone

        # @!parse
        #   # The contact information used in the two-factor steps for digital wallet card
        #   #   creation. To add the card to a digital wallet, you may supply an email or phone
        #   #   number with this request. Otherwise, subscribe and then action a Real Time
        #   #   Decision with the category `digital_wallet_token_requested` or
        #   #   `digital_wallet_authentication_requested`.
        #   #
        #   # @param digital_card_profile_id [String]
        #   # @param email [String]
        #   # @param phone [String]
        #   #
        #   def initialize(digital_card_profile_id: nil, email: nil, phone: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end
    end
  end
end
