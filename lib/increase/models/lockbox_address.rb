# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::LockboxAddresses#create
    class LockboxAddress < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Lockbox Address identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute address
      #   The mailing address for the Lockbox Address. It will be present after Increase
      #   generates it.
      #
      #   @return [Increase::Models::LockboxAddress::Address, nil]
      required :address, -> { Increase::LockboxAddress::Address }, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Lockbox
      #   Address was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute description
      #   The description you choose for the Lockbox Address.
      #
      #   @return [String, nil]
      required :description, String, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute status
      #   The status of the Lockbox Address.
      #
      #   @return [Symbol, Increase::Models::LockboxAddress::Status]
      required :status, enum: -> { Increase::LockboxAddress::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `lockbox_address`.
      #
      #   @return [Symbol, Increase::Models::LockboxAddress::Type]
      required :type, enum: -> { Increase::LockboxAddress::Type }

      # @!method initialize(id:, address:, created_at:, description:, idempotency_key:, status:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::LockboxAddress} for more details.
      #
      #   Lockbox Addresses are physical locations that can receive mail containing paper
      #   checks.
      #
      #   @param id [String] The Lockbox Address identifier.
      #
      #   @param address [Increase::Models::LockboxAddress::Address, nil] The mailing address for the Lockbox Address. It will be present after Increase g
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Lockbox
      #
      #   @param description [String, nil] The description you choose for the Lockbox Address.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param status [Symbol, Increase::Models::LockboxAddress::Status] The status of the Lockbox Address.
      #
      #   @param type [Symbol, Increase::Models::LockboxAddress::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::LockboxAddress#address
      class Address < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city of the address.
        #
        #   @return [String]
        required :city, String

        # @!attribute line1
        #   The first line of the address.
        #
        #   @return [String]
        required :line1, String

        # @!attribute line2
        #   The second line of the address.
        #
        #   @return [String]
        required :line2, String

        # @!attribute postal_code
        #   The postal code of the address.
        #
        #   @return [String]
        required :postal_code, String

        # @!attribute state
        #   The two-letter United States Postal Service (USPS) abbreviation for the state of
        #   the address.
        #
        #   @return [String]
        required :state, String

        # @!method initialize(city:, line1:, line2:, postal_code:, state:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::LockboxAddress::Address} for more details.
        #
        #   The mailing address for the Lockbox Address. It will be present after Increase
        #   generates it.
        #
        #   @param city [String] The city of the address.
        #
        #   @param line1 [String] The first line of the address.
        #
        #   @param line2 [String] The second line of the address.
        #
        #   @param postal_code [String] The postal code of the address.
        #
        #   @param state [String] The two-letter United States Postal Service (USPS) abbreviation for the state of
      end

      # The status of the Lockbox Address.
      #
      # @see Increase::Models::LockboxAddress#status
      module Status
        extend Increase::Internal::Type::Enum

        # Increase is generating this Lockbox Address.
        PENDING = :pending

        # This Lockbox Address is active.
        ACTIVE = :active

        # This Lockbox Address is disabled.
        DISABLED = :disabled

        # This Lockbox Address is permanently disabled.
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `lockbox_address`.
      #
      # @see Increase::Models::LockboxAddress#type
      module Type
        extend Increase::Internal::Type::Enum

        LOCKBOX_ADDRESS = :lockbox_address

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
