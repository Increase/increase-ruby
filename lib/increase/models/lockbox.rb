# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Lockboxes#create
    class Lockbox < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Lockbox identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The identifier for the Account checks sent to this lockbox will be deposited
      #   into.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute address
      #   The mailing address for the Lockbox.
      #
      #   @return [Increase::Lockbox::Address]
      required :address, -> { Increase::Lockbox::Address }

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Lockbox
      #   was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute description
      #   The description you choose for the Lockbox.
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

      # @!attribute recipient_name
      #   The recipient name you choose for the Lockbox.
      #
      #   @return [String, nil]
      required :recipient_name, String, nil?: true

      # @!attribute status
      #   This indicates if mail can be sent to this address.
      #
      #   @return [Symbol, Increase::Lockbox::Status]
      required :status, enum: -> { Increase::Lockbox::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `lockbox`.
      #
      #   @return [Symbol, Increase::Lockbox::Type]
      required :type, enum: -> { Increase::Lockbox::Type }

      # @!method initialize(id:, account_id:, address:, created_at:, description:, idempotency_key:, recipient_name:, status:, type:)
      #   Some parameter documentations has been truncated, see {Increase::Lockbox} for
      #   more details.
      #
      #   Lockboxes are physical locations that can receive mail containing paper checks.
      #   Increase will automatically create a Check Deposit for checks received this way.
      #
      #   @param id [String] The Lockbox identifier.
      #
      #   @param account_id [String] The identifier for the Account checks sent to this lockbox will be deposited int
      #
      #   @param address [Increase::Lockbox::Address] The mailing address for the Lockbox.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Lockbox
      #
      #   @param description [String, nil] The description you choose for the Lockbox.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param recipient_name [String, nil] The recipient name you choose for the Lockbox.
      #
      #   @param status [Symbol, Increase::Lockbox::Status] This indicates if mail can be sent to this address.
      #
      #   @param type [Symbol, Increase::Lockbox::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Lockbox#address
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

        # @!attribute recipient
        #   The recipient line of the address. This will include the recipient name you
        #   provide when creating the address, as well as an ATTN suffix to help route the
        #   mail to your lockbox. Mail senders must include this ATTN line to receive mail
        #   at this Lockbox.
        #
        #   @return [String, nil]
        required :recipient, String, nil?: true

        # @!attribute state
        #   The two-letter United States Postal Service (USPS) abbreviation for the state of
        #   the address.
        #
        #   @return [String]
        required :state, String

        # @!method initialize(city:, line1:, line2:, postal_code:, recipient:, state:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Lockbox::Address} for more details.
        #
        #   The mailing address for the Lockbox.
        #
        #   @param city [String] The city of the address.
        #
        #   @param line1 [String] The first line of the address.
        #
        #   @param line2 [String] The second line of the address.
        #
        #   @param postal_code [String] The postal code of the address.
        #
        #   @param recipient [String, nil] The recipient line of the address. This will include the recipient name you prov
        #
        #   @param state [String] The two-letter United States Postal Service (USPS) abbreviation for the state of
      end

      # This indicates if mail can be sent to this address.
      #
      # @see Increase::Lockbox#status
      module Status
        extend Increase::Internal::Type::Enum

        # This Lockbox is active. Checks mailed to it will be deposited automatically.
        ACTIVE = :active

        # This Lockbox is inactive. Checks mailed to it will not be deposited.
        INACTIVE = :inactive

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `lockbox`.
      #
      # @see Increase::Lockbox#type
      module Type
        extend Increase::Internal::Type::Enum

        LOCKBOX = :lockbox

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
