# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Cards#create
    class CardCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The Account the card should belong to.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute billing_address
      #   The card's billing address.
      #
      #   @return [Increase::Models::CardCreateParams::BillingAddress, nil]
      optional :billing_address, -> { Increase::CardCreateParams::BillingAddress }

      # @!attribute description
      #   The description you choose to give the card.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute digital_wallet
      #   The contact information used in the two-factor steps for digital wallet card
      #   creation. To add the card to a digital wallet, you may supply an email or phone
      #   number with this request. Otherwise, subscribe and then action a Real Time
      #   Decision with the category `digital_wallet_token_requested` or
      #   `digital_wallet_authentication_requested`.
      #
      #   @return [Increase::Models::CardCreateParams::DigitalWallet, nil]
      optional :digital_wallet, -> { Increase::CardCreateParams::DigitalWallet }

      # @!attribute entity_id
      #   The Entity the card belongs to. You only need to supply this in rare situations
      #   when the card is not for the Account holder.
      #
      #   @return [String, nil]
      optional :entity_id, String

      # @!method initialize(account_id:, billing_address: nil, description: nil, digital_wallet: nil, entity_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardCreateParams} for more details.
      #
      #   @param account_id [String] The Account the card should belong to.
      #
      #   @param billing_address [Increase::Models::CardCreateParams::BillingAddress] The card's billing address.
      #
      #   @param description [String] The description you choose to give the card.
      #
      #   @param digital_wallet [Increase::Models::CardCreateParams::DigitalWallet] The contact information used in the two-factor steps for digital wallet card cre
      #
      #   @param entity_id [String] The Entity the card belongs to. You only need to supply this in rare situations
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

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

        # @!attribute line2
        #   The second line of the billing address.
        #
        #   @return [String, nil]
        optional :line2, String

        # @!method initialize(city:, line1:, postal_code:, state:, line2: nil)
        #   The card's billing address.
        #
        #   @param city [String] The city of the billing address.
        #
        #   @param line1 [String] The first line of the billing address.
        #
        #   @param postal_code [String] The postal code of the billing address.
        #
        #   @param state [String] The US state of the billing address.
        #
        #   @param line2 [String] The second line of the billing address.
      end

      class DigitalWallet < Increase::Internal::Type::BaseModel
        # @!attribute digital_card_profile_id
        #   The digital card profile assigned to this digital card.
        #
        #   @return [String, nil]
        optional :digital_card_profile_id, String

        # @!attribute email
        #   An email address that can be used to contact and verify the cardholder via
        #   one-time passcode over email.
        #
        #   @return [String, nil]
        optional :email, String

        # @!attribute phone
        #   A phone number that can be used to contact and verify the cardholder via
        #   one-time passcode over SMS.
        #
        #   @return [String, nil]
        optional :phone, String

        # @!method initialize(digital_card_profile_id: nil, email: nil, phone: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardCreateParams::DigitalWallet} for more details.
        #
        #   The contact information used in the two-factor steps for digital wallet card
        #   creation. To add the card to a digital wallet, you may supply an email or phone
        #   number with this request. Otherwise, subscribe and then action a Real Time
        #   Decision with the category `digital_wallet_token_requested` or
        #   `digital_wallet_authentication_requested`.
        #
        #   @param digital_card_profile_id [String] The digital card profile assigned to this digital card.
        #
        #   @param email [String] An email address that can be used to contact and verify the cardholder via one-t
        #
        #   @param phone [String] A phone number that can be used to contact and verify the cardholder via one-tim
      end
    end
  end
end
