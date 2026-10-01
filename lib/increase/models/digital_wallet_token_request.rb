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

      # @!attribute outcome
      #   The outcome of the tokenization request.
      #
      #   @return [Symbol, Increase::Models::DigitalWalletTokenRequest::Outcome]
      required :outcome, enum: -> { Increase::DigitalWalletTokenRequest::Outcome }

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

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `digital_wallet_token_request`.
      #
      #   @return [Symbol, Increase::Models::DigitalWalletTokenRequest::Type]
      required :type, enum: -> { Increase::DigitalWalletTokenRequest::Type }

      # @!method initialize(id:, card_id:, created_at:, declined:, device:, outcome:, provisioned:, token_reference_identifier:, token_requestor:, type:)
      #   A Digital Wallet Token Request is created each time a digital wallet app, such
      #   as Apple Pay or Google Pay, requests to tokenize a Card.
      #
      #   @param id [String] The Digital Wallet Token Request identifier.
      #
      #   @param card_id [String] The identifier of the Card the tokenization was requested for.
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
      #   @param outcome [Symbol, Increase::Models::DigitalWalletTokenRequest::Outcome]
      #     The outcome of the tokenization request.
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
      #   @param type [Symbol, Increase::Models::DigitalWalletTokenRequest::Type]
      #     A constant representing the object's type. For this resource it will always be
      #     `digital_wallet_token_request`.

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
    end
  end
end
