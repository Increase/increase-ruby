# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DigitalWalletTokenRequests#retrieve
    class DigitalWalletTokenRequest < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Digital Wallet Token Request identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute card_id
      #   The identifier of the Card the tokenization was requested for.
      #
      #   @return [String]
      required :card_id, String

      # @!attribute cardholder
      #   The cardholder adding the card to the digital wallet.
      #
      #   @return [Increase::Models::DigitalWalletTokenRequest::Cardholder]
      required :cardholder, -> { Increase::DigitalWalletTokenRequest::Cardholder }

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Digital Wallet Token Request was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute declined
      #   Details of the decline. Present if and only if `outcome` is `declined`.
      #
      #   @return [Increase::Models::DigitalWalletTokenRequest::Declined, nil]
      required :declined, -> { Increase::DigitalWalletTokenRequest::Declined }, nil?: true

      # @!attribute device
      #   The device that requested the tokenization.
      #
      #   @return [Increase::Models::DigitalWalletTokenRequest::Device]
      required :device, -> { Increase::DigitalWalletTokenRequest::Device }

      # @!attribute network
      #   The card network the token is being provisioned on.
      #
      #   @return [Symbol, Increase::Models::DigitalWalletTokenRequest::Network]
      required :network, enum: -> { Increase::DigitalWalletTokenRequest::Network }

      # @!attribute outcome
      #   The outcome of the tokenization request.
      #
      #   @return [Symbol, Increase::Models::DigitalWalletTokenRequest::Outcome]
      required :outcome, enum: -> { Increase::DigitalWalletTokenRequest::Outcome }

      # @!attribute primary_account_number_source
      #   How the card number was provided to the digital wallet.
      #
      #   @return [Symbol, Increase::Models::DigitalWalletTokenRequest::PrimaryAccountNumberSource, nil]
      required :primary_account_number_source,
               enum: -> { Increase::DigitalWalletTokenRequest::PrimaryAccountNumberSource },
               nil?: true

      # @!attribute provisioned
      #   Details of the provisioned Digital Wallet Token. Present if and only if
      #   `outcome` is `provisioned`.
      #
      #   @return [Increase::Models::DigitalWalletTokenRequest::Provisioned, nil]
      required :provisioned, -> { Increase::DigitalWalletTokenRequest::Provisioned }, nil?: true

      # @!attribute token_reference_identifier
      #   The reference identifier assigned by the card network to the token.
      #
      #   @return [String]
      required :token_reference_identifier, String

      # @!attribute token_requestor
      #   The digital wallet app being used.
      #
      #   @return [Symbol, Increase::Models::DigitalWalletTokenRequest::TokenRequestor]
      required :token_requestor, enum: -> { Increase::DigitalWalletTokenRequest::TokenRequestor }

      # @!attribute token_requestor_details
      #   The digital wallet or merchant that requested the token.
      #
      #   @return [Increase::Models::DigitalWalletTokenRequest::TokenRequestorDetails]
      required :token_requestor_details, -> { Increase::DigitalWalletTokenRequest::TokenRequestorDetails }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `digital_wallet_token_request`.
      #
      #   @return [Symbol, Increase::Models::DigitalWalletTokenRequest::Type]
      required :type, enum: -> { Increase::DigitalWalletTokenRequest::Type }

      # @!attribute verification
      #   Fields related to verification of cardholder-provided values.
      #
      #   @return [Increase::Models::DigitalWalletTokenRequest::Verification]
      required :verification, -> { Increase::DigitalWalletTokenRequest::Verification }

      # @!attribute visa
      #   Risk scores provided by Visa for the provisioning request. This field will be
      #   present in the JSON response if and only if `network` is equal to `visa`.
      #
      #   @return [Increase::Models::DigitalWalletTokenRequest::Visa, nil]
      required :visa, -> { Increase::DigitalWalletTokenRequest::Visa }, nil?: true

      # @!attribute wallet
      #   Details about the digital wallet.
      #
      #   @return [Increase::Models::DigitalWalletTokenRequest::Wallet]
      required :wallet, -> { Increase::DigitalWalletTokenRequest::Wallet }

      # @!method initialize(id:, card_id:, cardholder:, created_at:, declined:, device:, network:, outcome:, primary_account_number_source:, provisioned:, token_reference_identifier:, token_requestor:, token_requestor_details:, type:, verification:, visa:, wallet:)
      #   A Digital Wallet Token Request is created each time a digital wallet app, such
      #   as Apple Pay or Google Pay, requests to tokenize a Card.
      #
      #   @param id [String] The Digital Wallet Token Request identifier.
      #
      #   @param card_id [String] The identifier of the Card the tokenization was requested for.
      #
      #   @param cardholder [Increase::Models::DigitalWalletTokenRequest::Cardholder]
      #     The cardholder adding the card to the digital wallet.
      #
      #   @param created_at [Time]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the Digital Wallet Token Request was created.
      #
      #   @param declined [Increase::Models::DigitalWalletTokenRequest::Declined, nil]
      #     Details of the decline. Present if and only if `outcome` is `declined`.
      #
      #   @param device [Increase::Models::DigitalWalletTokenRequest::Device]
      #     The device that requested the tokenization.
      #
      #   @param network [Symbol, Increase::Models::DigitalWalletTokenRequest::Network]
      #     The card network the token is being provisioned on.
      #
      #   @param outcome [Symbol, Increase::Models::DigitalWalletTokenRequest::Outcome]
      #     The outcome of the tokenization request.
      #
      #   @param primary_account_number_source [Symbol, Increase::Models::DigitalWalletTokenRequest::PrimaryAccountNumberSource, nil]
      #     How the card number was provided to the digital wallet.
      #
      #   @param provisioned [Increase::Models::DigitalWalletTokenRequest::Provisioned, nil]
      #     Details of the provisioned Digital Wallet Token. Present if and only if
      #     `outcome` is `provisioned`.
      #
      #   @param token_reference_identifier [String]
      #     The reference identifier assigned by the card network to the token.
      #
      #   @param token_requestor [Symbol, Increase::Models::DigitalWalletTokenRequest::TokenRequestor]
      #     The digital wallet app being used.
      #
      #   @param token_requestor_details [Increase::Models::DigitalWalletTokenRequest::TokenRequestorDetails]
      #     The digital wallet or merchant that requested the token.
      #
      #   @param type [Symbol, Increase::Models::DigitalWalletTokenRequest::Type]
      #     A constant representing the object's type. For this resource it will always be
      #     `digital_wallet_token_request`.
      #
      #   @param verification [Increase::Models::DigitalWalletTokenRequest::Verification]
      #     Fields related to verification of cardholder-provided values.
      #
      #   @param visa [Increase::Models::DigitalWalletTokenRequest::Visa, nil]
      #     Risk scores provided by Visa for the provisioning request. This field will be
      #     present in the JSON response if and only if `network` is equal to `visa`.
      #
      #   @param wallet [Increase::Models::DigitalWalletTokenRequest::Wallet] Details about the digital wallet.

      # @see Increase::Models::DigitalWalletTokenRequest#cardholder
      class Cardholder < Increase::Internal::Type::BaseModel
        # @!attribute name
        #   The cardholder's name, as entered in the digital wallet.
        #
        #   @return [String, nil]
        required :name, String, nil?: true

        # @!method initialize(name:)
        #   The cardholder adding the card to the digital wallet.
        #
        #   @param name [String, nil] The cardholder's name, as entered in the digital wallet.
      end

      # @see Increase::Models::DigitalWalletTokenRequest#declined
      class Declined < Increase::Internal::Type::BaseModel
        # @!attribute reason
        #   The reason the tokenization was declined.
        #
        #   @return [Symbol, Increase::Models::DigitalWalletTokenRequest::Declined::Reason]
        required :reason, enum: -> { Increase::DigitalWalletTokenRequest::Declined::Reason }

        # @!method initialize(reason:)
        #   Details of the decline. Present if and only if `outcome` is `declined`.
        #
        #   @param reason [Symbol, Increase::Models::DigitalWalletTokenRequest::Declined::Reason]
        #     The reason the tokenization was declined.

        # The reason the tokenization was declined.
        #
        # @see Increase::Models::DigitalWalletTokenRequest::Declined#reason
        module Reason
          extend Increase::Internal::Type::Enum

          # The card is not active.
          CARD_NOT_ACTIVE = :card_not_active

          # The card does not have a two-factor authentication method.
          NO_VERIFICATION_METHOD = :no_verification_method

          # Your webhook timed out when evaluating the token provisioning attempt.
          WEBHOOK_TIMED_OUT = :webhook_timed_out

          # Your webhook declined the token provisioning attempt.
          WEBHOOK_DECLINED = :webhook_declined

          # The tokenization attempt failed because the Card Verification Code (CVC) was incorrect.
          INCORRECT_CARD_VERIFICATION_CODE = :incorrect_card_verification_code

          # The tokenization attempt was declined by the token requestor.
          DECLINED_BY_TOKEN_REQUESTOR = :declined_by_token_requestor

          # The group was locked.
          GROUP_LOCKED = :group_locked

          # The account has been closed.
          ACCOUNT_CLOSED = :account_closed

          # The account's entity was not active.
          ENTITY_NOT_ACTIVE = :entity_not_active

          # The given expiration date did not match the card's value.
          CARD_EXPIRATION_MISMATCH = :card_expiration_mismatch

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::DigitalWalletTokenRequest#device
      class Device < Increase::Internal::Type::BaseModel
        # @!attribute device_type
        #   Device type.
        #
        #   @return [Symbol, Increase::Models::DigitalWalletTokenRequest::Device::DeviceType, nil]
        required :device_type,
                 enum: -> {
                   Increase::DigitalWalletTokenRequest::Device::DeviceType
                 },
                 nil?: true

        # @!attribute identifier
        #   ID assigned to the device by the digital wallet provider.
        #
        #   @return [String, nil]
        required :identifier, String, nil?: true

        # @!attribute ip_address
        #   IP address of the device.
        #
        #   @return [String, nil]
        required :ip_address, String, nil?: true

        # @!attribute name
        #   Name of the device, for example "My Work Phone".
        #
        #   @return [String, nil]
        required :name, String, nil?: true

        # @!method initialize(device_type:, identifier:, ip_address:, name:)
        #   The device that requested the tokenization.
        #
        #   @param device_type [Symbol, Increase::Models::DigitalWalletTokenRequest::Device::DeviceType, nil]
        #     Device type.
        #
        #   @param identifier [String, nil] ID assigned to the device by the digital wallet provider.
        #
        #   @param ip_address [String, nil] IP address of the device.
        #
        #   @param name [String, nil] Name of the device, for example "My Work Phone".

        # Device type.
        #
        # @see Increase::Models::DigitalWalletTokenRequest::Device#device_type
        module DeviceType
          extend Increase::Internal::Type::Enum

          # Unknown
          UNKNOWN = :unknown

          # Mobile Phone
          MOBILE_PHONE = :mobile_phone

          # Tablet
          TABLET = :tablet

          # Watch
          WATCH = :watch

          # Mobile Phone or Tablet
          MOBILEPHONE_OR_TABLET = :mobilephone_or_tablet

          # PC
          PC = :pc

          # Household Device
          HOUSEHOLD_DEVICE = :household_device

          # Wearable Device
          WEARABLE_DEVICE = :wearable_device

          # Automobile Device
          AUTOMOBILE_DEVICE = :automobile_device

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The card network the token is being provisioned on.
      #
      # @see Increase::Models::DigitalWalletTokenRequest#network
      module Network
        extend Increase::Internal::Type::Enum

        # Visa
        VISA = :visa

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The outcome of the tokenization request.
      #
      # @see Increase::Models::DigitalWalletTokenRequest#outcome
      module Outcome
        extend Increase::Internal::Type::Enum

        # The tokenization request was approved and a Digital Wallet Token was provisioned.
        PROVISIONED = :provisioned

        # The tokenization request was declined.
        DECLINED = :declined

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # How the card number was provided to the digital wallet.
      #
      # @see Increase::Models::DigitalWalletTokenRequest#primary_account_number_source
      module PrimaryAccountNumberSource
        extend Increase::Internal::Type::Enum

        # The cardholder entered the card number manually.
        KEY_ENTERED = :key_entered

        # The card number was already on file with the token requestor.
        ON_FILE = :on_file

        # The card was added from your mobile app using push provisioning.
        MOBILE_APP = :mobile_app

        # The card number was sourced from an existing token.
        TOKEN = :token

        # The card number was read from the chip of the physical card.
        CHIP_DIP = :chip_dip

        # The card number was read by tapping the physical card on the device.
        CONTACTLESS_TAP = :contactless_tap

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::DigitalWalletTokenRequest#provisioned
      class Provisioned < Increase::Internal::Type::BaseModel
        # @!attribute digital_wallet_token_id
        #   The identifier of the Digital Wallet Token that was provisioned.
        #
        #   @return [String]
        required :digital_wallet_token_id, String

        # @!method initialize(digital_wallet_token_id:)
        #   Details of the provisioned Digital Wallet Token. Present if and only if
        #   `outcome` is `provisioned`.
        #
        #   @param digital_wallet_token_id [String] The identifier of the Digital Wallet Token that was provisioned.
      end

      # The digital wallet app being used.
      #
      # @see Increase::Models::DigitalWalletTokenRequest#token_requestor
      module TokenRequestor
        extend Increase::Internal::Type::Enum

        # Apple Pay
        APPLE_PAY = :apple_pay

        # Google Pay
        GOOGLE_PAY = :google_pay

        # Samsung Pay
        SAMSUNG_PAY = :samsung_pay

        # Garmin Pay
        GARMIN_PAY = :garmin_pay

        # Unknown
        UNKNOWN = :unknown

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::DigitalWalletTokenRequest#token_requestor_details
      class TokenRequestorDetails < Increase::Internal::Type::BaseModel
        # @!attribute identifier
        #   The identifier assigned to the token requestor by the card network.
        #
        #   @return [String]
        required :identifier, String

        # @!attribute name
        #   The name of the token requestor, for example "Apple Inc.".
        #
        #   @return [String, nil]
        required :name, String, nil?: true

        # @!method initialize(identifier:, name:)
        #   The digital wallet or merchant that requested the token.
        #
        #   @param identifier [String] The identifier assigned to the token requestor by the card network.
        #
        #   @param name [String, nil] The name of the token requestor, for example "Apple Inc.".
      end

      # A constant representing the object's type. For this resource it will always be
      # `digital_wallet_token_request`.
      #
      # @see Increase::Models::DigitalWalletTokenRequest#type
      module Type
        extend Increase::Internal::Type::Enum

        DIGITAL_WALLET_TOKEN_REQUEST = :digital_wallet_token_request

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::DigitalWalletTokenRequest#verification
      class Verification < Increase::Internal::Type::BaseModel
        # @!attribute cardholder_address
        #   Cardholder address provided in the provisioning request and the address on file
        #   we verified it against.
        #
        #   @return [Increase::Models::DigitalWalletTokenRequest::Verification::CardholderAddress]
        required :cardholder_address, -> { Increase::DigitalWalletTokenRequest::Verification::CardholderAddress }

        # @!method initialize(cardholder_address:)
        #   Fields related to verification of cardholder-provided values.
        #
        #   @param cardholder_address [Increase::Models::DigitalWalletTokenRequest::Verification::CardholderAddress]
        #     Cardholder address provided in the provisioning request and the address on file
        #     we verified it against.

        # @see Increase::Models::DigitalWalletTokenRequest::Verification#cardholder_address
        class CardholderAddress < Increase::Internal::Type::BaseModel
          # @!attribute actual_line1
          #   Line 1 of the address on file for the cardholder.
          #
          #   @return [String, nil]
          required :actual_line1, String, nil?: true

          # @!attribute actual_postal_code
          #   The postal code of the address on file for the cardholder.
          #
          #   @return [String, nil]
          required :actual_postal_code, String, nil?: true

          # @!attribute provided_line1
          #   The cardholder address line 1 provided for verification in the provisioning
          #   request.
          #
          #   @return [String, nil]
          required :provided_line1, String, nil?: true

          # @!attribute provided_postal_code
          #   The postal code provided for verification in the provisioning request.
          #
          #   @return [String, nil]
          required :provided_postal_code, String, nil?: true

          # @!attribute result
          #   The address verification result.
          #
          #   @return [Symbol, Increase::Models::DigitalWalletTokenRequest::Verification::CardholderAddress::Result]
          required :result,
                   enum: -> { Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::Result }

          # @!method initialize(actual_line1:, actual_postal_code:, provided_line1:, provided_postal_code:, result:)
          #   Cardholder address provided in the provisioning request and the address on file
          #   we verified it against.
          #
          #   @param actual_line1 [String, nil] Line 1 of the address on file for the cardholder.
          #
          #   @param actual_postal_code [String, nil] The postal code of the address on file for the cardholder.
          #
          #   @param provided_line1 [String, nil]
          #     The cardholder address line 1 provided for verification in the provisioning
          #     request.
          #
          #   @param provided_postal_code [String, nil]
          #     The postal code provided for verification in the provisioning request.
          #
          #   @param result [Symbol, Increase::Models::DigitalWalletTokenRequest::Verification::CardholderAddress::Result]
          #     The address verification result.

          # The address verification result.
          #
          # @see Increase::Models::DigitalWalletTokenRequest::Verification::CardholderAddress#result
          module Result
            extend Increase::Internal::Type::Enum

            # No address information was provided in the authorization request.
            NOT_CHECKED = :not_checked

            # Postal code matches, but the street address does not match or was not provided.
            POSTAL_CODE_MATCH_ADDRESS_NO_MATCH = :postal_code_match_address_no_match

            # Postal code does not match, but the street address matches or was not provided.
            POSTAL_CODE_NO_MATCH_ADDRESS_MATCH = :postal_code_no_match_address_match

            # Postal code and street address match.
            MATCH = :match

            # Postal code and street address do not match.
            NO_MATCH = :no_match

            # Postal code matches, but the street address was not verified. (deprecated)
            POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED = :postal_code_match_address_not_checked

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # @see Increase::Models::DigitalWalletTokenRequest#visa
      class Visa < Increase::Internal::Type::BaseModel
        # @!attribute network_risk_score
        #   Visa's risk score for the card, based on its transaction history, from 0 to 99.
        #   A higher score indicates a higher risk.
        #
        #   @return [Integer, nil]
        required :network_risk_score, Integer, nil?: true

        # @!attribute provisioning_risk_score
        #   Visa's risk score for the provisioning request, from 1 to 99. A higher score
        #   indicates a higher risk.
        #
        #   @return [Integer, nil]
        required :provisioning_risk_score, Integer, nil?: true

        # @!method initialize(network_risk_score:, provisioning_risk_score:)
        #   Risk scores provided by Visa for the provisioning request. This field will be
        #   present in the JSON response if and only if `network` is equal to `visa`.
        #
        #   @param network_risk_score [Integer, nil]
        #     Visa's risk score for the card, based on its transaction history, from 0 to 99.
        #     A higher score indicates a higher risk.
        #
        #   @param provisioning_risk_score [Integer, nil]
        #     Visa's risk score for the provisioning request, from 1 to 99. A higher score
        #     indicates a higher risk.
      end

      # @see Increase::Models::DigitalWalletTokenRequest#wallet
      class Wallet < Increase::Internal::Type::BaseModel
        # @!attribute account_email_age_days
        #   The number of days since the email address was added to the cardholder's digital
        #   wallet account, up to 999.
        #
        #   @return [Integer, nil]
        required :account_email_age_days, Integer, nil?: true

        # @!attribute account_identifier
        #   An identifier for the cardholder's account with the digital wallet.
        #
        #   @return [String, nil]
        required :account_identifier, String, nil?: true

        # @!attribute account_score
        #   How much the digital wallet trusts the cardholder's account, from 1 to 5. A
        #   higher score indicates more trust.
        #
        #   @return [Integer, nil]
        required :account_score, Integer, nil?: true

        # @!attribute device_score
        #   How much the digital wallet trusts the device the card is being added to, from 1
        #   to 5. A higher score indicates more trust.
        #
        #   @return [Integer, nil]
        required :device_score, Integer, nil?: true

        # @!attribute email_hash
        #   A hash of the email address on the cardholder's digital wallet account.
        #
        #   @return [String, nil]
        required :email_hash, String, nil?: true

        # @!method initialize(account_email_age_days:, account_identifier:, account_score:, device_score:, email_hash:)
        #   Details about the digital wallet.
        #
        #   @param account_email_age_days [Integer, nil]
        #     The number of days since the email address was added to the cardholder's digital
        #     wallet account, up to 999.
        #
        #   @param account_identifier [String, nil]
        #     An identifier for the cardholder's account with the digital wallet.
        #
        #   @param account_score [Integer, nil]
        #     How much the digital wallet trusts the cardholder's account, from 1 to 5. A
        #     higher score indicates more trust.
        #
        #   @param device_score [Integer, nil]
        #     How much the digital wallet trusts the device the card is being added to, from 1
        #     to 5. A higher score indicates more trust.
        #
        #   @param email_hash [String, nil] A hash of the email address on the cardholder's digital wallet account.
      end
    end
  end
end
