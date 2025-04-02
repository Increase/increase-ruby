# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DigitalWalletTokens#retrieve
    class DigitalWalletToken < Increase::BaseModel
      # @!attribute id
      #   The Digital Wallet Token identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute card_id
      #   The identifier for the Card this Digital Wallet Token belongs to.
      #
      #   @return [String]
      required :card_id, String

      # @!attribute cardholder
      #   The cardholder information given when the Digital Wallet Token was created.
      #
      #   @return [Increase::Models::DigitalWalletToken::Cardholder]
      required :cardholder, -> { Increase::Models::DigitalWalletToken::Cardholder }

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the Digital Wallet Token was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute device
      #   The device that was used to create the Digital Wallet Token.
      #
      #   @return [Increase::Models::DigitalWalletToken::Device]
      required :device, -> { Increase::Models::DigitalWalletToken::Device }

      # @!attribute status
      #   This indicates if payments can be made with the Digital Wallet Token.
      #
      #   @return [Symbol, Increase::Models::DigitalWalletToken::Status]
      required :status, enum: -> { Increase::Models::DigitalWalletToken::Status }

      # @!attribute token_requestor
      #   The digital wallet app being used.
      #
      #   @return [Symbol, Increase::Models::DigitalWalletToken::TokenRequestor]
      required :token_requestor, enum: -> { Increase::Models::DigitalWalletToken::TokenRequestor }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `digital_wallet_token`.
      #
      #   @return [Symbol, Increase::Models::DigitalWalletToken::Type]
      required :type, enum: -> { Increase::Models::DigitalWalletToken::Type }

      # @!attribute updates
      #   Updates to the Digital Wallet Token.
      #
      #   @return [Array<Increase::Models::DigitalWalletToken::Update>]
      required :updates, -> { Increase::ArrayOf[Increase::Models::DigitalWalletToken::Update] }

      # @!parse
      #   # A Digital Wallet Token is created when a user adds a Card to their Apple Pay or
      #   #   Google Pay app. The Digital Wallet Token can be used for purchases just like a
      #   #   Card.
      #   #
      #   # @param id [String]
      #   # @param card_id [String]
      #   # @param cardholder [Increase::Models::DigitalWalletToken::Cardholder]
      #   # @param created_at [Time]
      #   # @param device [Increase::Models::DigitalWalletToken::Device]
      #   # @param status [Symbol, Increase::Models::DigitalWalletToken::Status]
      #   # @param token_requestor [Symbol, Increase::Models::DigitalWalletToken::TokenRequestor]
      #   # @param type [Symbol, Increase::Models::DigitalWalletToken::Type]
      #   # @param updates [Array<Increase::Models::DigitalWalletToken::Update>]
      #   #
      #   def initialize(id:, card_id:, cardholder:, created_at:, device:, status:, token_requestor:, type:, updates:, **) = super

      # def initialize: (Hash | Increase::BaseModel) -> void

      # @see Increase::Models::DigitalWalletToken#cardholder
      class Cardholder < Increase::BaseModel
        # @!attribute name
        #   Name of the cardholder, for example "John Smith".
        #
        #   @return [String, nil]
        required :name, String, nil?: true

        # @!parse
        #   # The cardholder information given when the Digital Wallet Token was created.
        #   #
        #   # @param name [String, nil]
        #   #
        #   def initialize(name:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void
      end

      # @see Increase::Models::DigitalWalletToken#device
      class Device < Increase::BaseModel
        # @!attribute device_type
        #   Device type.
        #
        #   @return [Symbol, Increase::Models::DigitalWalletToken::Device::DeviceType, nil]
        required :device_type, enum: -> { Increase::Models::DigitalWalletToken::Device::DeviceType }, nil?: true

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

        # @!parse
        #   # The device that was used to create the Digital Wallet Token.
        #   #
        #   # @param device_type [Symbol, Increase::Models::DigitalWalletToken::Device::DeviceType, nil]
        #   # @param identifier [String, nil]
        #   # @param ip_address [String, nil]
        #   # @param name [String, nil]
        #   #
        #   def initialize(device_type:, identifier:, ip_address:, name:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void

        # Device type.
        #
        # @see Increase::Models::DigitalWalletToken::Device#device_type
        module DeviceType
          extend Increase::Enum

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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      # This indicates if payments can be made with the Digital Wallet Token.
      #
      # @see Increase::Models::DigitalWalletToken#status
      module Status
        extend Increase::Enum

        # The digital wallet token is active.
        ACTIVE = :active

        # The digital wallet token has been created but not successfully activated via two-factor authentication yet.
        INACTIVE = :inactive

        # The digital wallet token has been temporarily paused.
        SUSPENDED = :suspended

        # The digital wallet token has been permanently canceled.
        DEACTIVATED = :deactivated

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # The digital wallet app being used.
      #
      # @see Increase::Models::DigitalWalletToken#token_requestor
      module TokenRequestor
        extend Increase::Enum

        # Apple Pay
        APPLE_PAY = :apple_pay

        # Google Pay
        GOOGLE_PAY = :google_pay

        # Samsung Pay
        SAMSUNG_PAY = :samsung_pay

        # Unknown
        UNKNOWN = :unknown

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `digital_wallet_token`.
      #
      # @see Increase::Models::DigitalWalletToken#type
      module Type
        extend Increase::Enum

        DIGITAL_WALLET_TOKEN = :digital_wallet_token

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      class Update < Increase::BaseModel
        # @!attribute status
        #   The status the update changed this Digital Wallet Token to.
        #
        #   @return [Symbol, Increase::Models::DigitalWalletToken::Update::Status]
        required :status, enum: -> { Increase::Models::DigitalWalletToken::Update::Status }

        # @!attribute timestamp
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #     the update happened.
        #
        #   @return [Time]
        required :timestamp, Time

        # @!parse
        #   # @param status [Symbol, Increase::Models::DigitalWalletToken::Update::Status]
        #   # @param timestamp [Time]
        #   #
        #   def initialize(status:, timestamp:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void

        # The status the update changed this Digital Wallet Token to.
        #
        # @see Increase::Models::DigitalWalletToken::Update#status
        module Status
          extend Increase::Enum

          # The digital wallet token is active.
          ACTIVE = :active

          # The digital wallet token has been created but not successfully activated via two-factor authentication yet.
          INACTIVE = :inactive

          # The digital wallet token has been temporarily paused.
          SUSPENDED = :suspended

          # The digital wallet token has been permanently canceled.
          DEACTIVATED = :deactivated

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
