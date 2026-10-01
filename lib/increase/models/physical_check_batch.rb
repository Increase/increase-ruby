# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCheckBatches#create
    class PhysicalCheckBatch < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Physical Check Batch's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Physical Check Batch was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute mailing_address
      #   The mailing address of the parcel.
      #
      #   @return [Increase::Models::PhysicalCheckBatch::MailingAddress]
      required :mailing_address, -> { Increase::PhysicalCheckBatch::MailingAddress }

      # @!attribute return_address
      #   The return address of the parcel.
      #
      #   @return [Increase::Models::PhysicalCheckBatch::ReturnAddress]
      required :return_address, -> { Increase::PhysicalCheckBatch::ReturnAddress }

      # @!attribute shipping_method
      #   The shipping method for the parcel.
      #
      #   @return [Symbol, Increase::Models::PhysicalCheckBatch::ShippingMethod]
      required :shipping_method, enum: -> { Increase::PhysicalCheckBatch::ShippingMethod }

      # @!attribute status
      #   The lifecycle status of the Physical Check Batch.
      #
      #   @return [Symbol, Increase::Models::PhysicalCheckBatch::Status]
      required :status, enum: -> { Increase::PhysicalCheckBatch::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `physical_check_batch`.
      #
      #   @return [Symbol, Increase::Models::PhysicalCheckBatch::Type]
      required :type, enum: -> { Increase::PhysicalCheckBatch::Type }

      # @!method initialize(id:, created_at:, idempotency_key:, mailing_address:, return_address:, shipping_method:, status:, type:)
      #   Physical Check Batches are groups of checks that are mailed in the same parcel.
      #   Tracking updates are propagated to every related Check Transfer.
      #
      #   @param id [String] The Physical Check Batch's identifier.
      #
      #   @param created_at [Time]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the Physical Check Batch was created.
      #
      #   @param idempotency_key [String, nil]
      #     The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @param mailing_address [Increase::Models::PhysicalCheckBatch::MailingAddress]
      #     The mailing address of the parcel.
      #
      #   @param return_address [Increase::Models::PhysicalCheckBatch::ReturnAddress]
      #     The return address of the parcel.
      #
      #   @param shipping_method [Symbol, Increase::Models::PhysicalCheckBatch::ShippingMethod]
      #     The shipping method for the parcel.
      #
      #   @param status [Symbol, Increase::Models::PhysicalCheckBatch::Status]
      #     The lifecycle status of the Physical Check Batch.
      #
      #   @param type [Symbol, Increase::Models::PhysicalCheckBatch::Type]
      #     A constant representing the object's type. For this resource it will always be
      #     `physical_check_batch`.

      # @see Increase::Models::PhysicalCheckBatch#mailing_address
      class MailingAddress < Increase::Internal::Type::BaseModel
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
        #   @return [String, nil]
        required :line2, String, nil?: true

        # @!attribute name
        #   The name component of the address.
        #
        #   @return [String]
        required :name, String

        # @!attribute phone
        #   The phone number that is used for delivery issues.
        #
        #   @return [String, nil]
        required :phone, String, nil?: true

        # @!attribute postal_code
        #   The postal code of the address.
        #
        #   @return [String]
        required :postal_code, String

        # @!attribute state
        #   The state of the address.
        #
        #   @return [String]
        required :state, String

        # @!method initialize(city:, line1:, line2:, name:, phone:, postal_code:, state:)
        #   The mailing address of the parcel.
        #
        #   @param city [String] The city of the address.
        #
        #   @param line1 [String] The first line of the address.
        #
        #   @param line2 [String, nil] The second line of the address.
        #
        #   @param name [String] The name component of the address.
        #
        #   @param phone [String, nil] The phone number that is used for delivery issues.
        #
        #   @param postal_code [String] The postal code of the address.
        #
        #   @param state [String] The state of the address.
      end

      # @see Increase::Models::PhysicalCheckBatch#return_address
      class ReturnAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city of the return address.
        #
        #   @return [String]
        required :city, String

        # @!attribute line1
        #   The first line of the return address.
        #
        #   @return [String]
        required :line1, String

        # @!attribute line2
        #   The second line of the return address.
        #
        #   @return [String, nil]
        required :line2, String, nil?: true

        # @!attribute name
        #   The name component of the return address.
        #
        #   @return [String]
        required :name, String

        # @!attribute phone
        #   The phone number that is used for delivery issues.
        #
        #   @return [String, nil]
        required :phone, String, nil?: true

        # @!attribute postal_code
        #   The postal code of the return address.
        #
        #   @return [String]
        required :postal_code, String

        # @!attribute state
        #   The state of the return address.
        #
        #   @return [String]
        required :state, String

        # @!method initialize(city:, line1:, line2:, name:, phone:, postal_code:, state:)
        #   The return address of the parcel.
        #
        #   @param city [String] The city of the return address.
        #
        #   @param line1 [String] The first line of the return address.
        #
        #   @param line2 [String, nil] The second line of the return address.
        #
        #   @param name [String] The name component of the return address.
        #
        #   @param phone [String, nil] The phone number that is used for delivery issues.
        #
        #   @param postal_code [String] The postal code of the return address.
        #
        #   @param state [String] The state of the return address.
      end

      # The shipping method for the parcel.
      #
      # @see Increase::Models::PhysicalCheckBatch#shipping_method
      module ShippingMethod
        extend Increase::Internal::Type::Enum

        # USPS First Class
        USPS_FIRST_CLASS = :usps_first_class

        # FedEx Overnight
        FEDEX_OVERNIGHT = :fedex_overnight

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The lifecycle status of the Physical Check Batch.
      #
      # @see Increase::Models::PhysicalCheckBatch#status
      module Status
        extend Increase::Internal::Type::Enum

        # The batch is pending completion and is open to accepting new checks.
        PENDING = :pending

        # The batch has been completed.
        COMPLETED = :completed

        # The batch and all checks related to it have been canceled.
        CANCELED = :canceled

        # The batch requires attention from an Increase operator.
        REQUIRES_ATTENTION = :requires_attention

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `physical_check_batch`.
      #
      # @see Increase::Models::PhysicalCheckBatch#type
      module Type
        extend Increase::Internal::Type::Enum

        PHYSICAL_CHECK_BATCH = :physical_check_batch

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
