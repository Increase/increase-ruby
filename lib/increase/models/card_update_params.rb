# frozen_string_literal: true

module Increase
  module Models
    class CardUpdateParams < Increase::BaseModel
      # @!attribute billing_address
      #   The card's updated billing address.
      #
      #   @return [Increase::Models::CardUpdateParams::BillingAddress]
      optional :billing_address, -> { Increase::Models::CardUpdateParams::BillingAddress }

      # @!attribute description
      #   The description you choose to give the card.
      #
      #   @return [String]
      optional :description, String

      # @!attribute digital_wallet
      #   The contact information used in the two-factor steps for digital wallet card creation. At least one field must be present to complete the digital wallet steps.
      #
      #   @return [Increase::Models::CardUpdateParams::DigitalWallet]
      optional :digital_wallet, -> { Increase::Models::CardUpdateParams::DigitalWallet }

      # @!attribute entity_id
      #   The Entity the card belongs to. You only need to supply this in rare situations when the card is not for the Account holder.
      #
      #   @return [String]
      optional :entity_id, String

      # @!attribute status
      #   The status to update the Card with.
      #
      #   @return [Symbol, Increase::Models::CardUpdateParams::Status]
      optional :status, enum: -> { Increase::Models::CardUpdateParams::Status }

      # @!parse
      #   # @param billing_address [Increase::Models::CardUpdateParams::BillingAddress] The card's updated billing address.
      #   #
      #   # @param description [String] The description you choose to give the card.
      #   #
      #   # @param digital_wallet [Increase::Models::CardUpdateParams::DigitalWallet] The contact information used in the two-factor steps for digital wallet card
      #   #   creation. At least one field must be present to complete the digital wallet
      #   #   steps.
      #   #
      #   # @param entity_id [String] The Entity the card belongs to. You only need to supply this in rare situations
      #   #   when the card is not for the Account holder.
      #   #
      #   # @param status [String] The status to update the Card with.
      #   #
      #   def initialize(billing_address: nil, description: nil, digital_wallet: nil, entity_id: nil, status: nil, **) = super

      # def initialize: (Hash | Increase::BaseModel) -> void

      # @example
      #
      # ```ruby
      # billing_address => {
      #   city: String,
      #   line1: String,
      #   postal_code: String,
      #   state: String,
      #   line2: String
      # }
      # ```
      class BillingAddress < Increase::BaseModel
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
        #   @return [String]
        optional :line2, String

        # @!parse
        #   # The card's updated billing address.
        #   #
        #   # @param city [String] The city of the billing address.
        #   #
        #   # @param line1 [String] The first line of the billing address.
        #   #
        #   # @param postal_code [String] The postal code of the billing address.
        #   #
        #   # @param state [String] The US state of the billing address.
        #   #
        #   # @param line2 [String] The second line of the billing address.
        #   #
        #   def initialize(city:, line1:, postal_code:, state:, line2: nil, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void
      end

      # @example
      #
      # ```ruby
      # digital_wallet => {
      #   digital_card_profile_id: String,
      #   email: String,
      #   phone: String
      # }
      # ```
      class DigitalWallet < Increase::BaseModel
        # @!attribute digital_card_profile_id
        #   The digital card profile assigned to this digital card.
        #
        #   @return [String]
        optional :digital_card_profile_id, String

        # @!attribute email
        #   An email address that can be used to verify the cardholder via one-time passcode over email.
        #
        #   @return [String]
        optional :email, String

        # @!attribute phone
        #   A phone number that can be used to verify the cardholder via one-time passcode over SMS.
        #
        #   @return [String]
        optional :phone, String

        # @!parse
        #   # The contact information used in the two-factor steps for digital wallet card
        #   #   creation. At least one field must be present to complete the digital wallet
        #   #   steps.
        #   #
        #   # @param digital_card_profile_id [String] The digital card profile assigned to this digital card.
        #   #
        #   # @param email [String] An email address that can be used to verify the cardholder via one-time passcode
        #   #   over email.
        #   #
        #   # @param phone [String] A phone number that can be used to verify the cardholder via one-time passcode
        #   #   over SMS.
        #   #
        #   def initialize(digital_card_profile_id: nil, email: nil, phone: nil, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void
      end

      # The status to update the Card with.
      #
      # @example
      #
      # ```ruby
      # case status
      # in :active
      #   # ...
      # in :disabled
      #   # ...
      # in :canceled
      #   # ...
      # end
      # ```
      class Status < Increase::Enum
        # The card is active.
        ACTIVE = :active

        # The card is temporarily disabled.
        DISABLED = :disabled

        # The card is permanently canceled.
        CANCELED = :canceled

        finalize!
      end
    end
  end
end
