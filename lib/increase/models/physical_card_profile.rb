# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCardProfiles#create
    class PhysicalCardProfile < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Card Profile identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute back_image_file_id
      #   The identifier of the File containing the physical card's back image.
      #
      #   @return [String, nil]
      required :back_image_file_id, String, nil?: true

      # @!attribute carrier_image_file_id
      #   The identifier of the File containing the physical card's carrier image.
      #
      #   @return [String, nil]
      required :carrier_image_file_id, String, nil?: true

      # @!attribute contact_phone
      #   A phone number the user can contact to receive support for their card.
      #
      #   @return [String, nil]
      required :contact_phone, String, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the Card Dispute was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute creator
      #   The creator of this Physical Card Profile.
      #
      #   @return [Symbol, Increase::Models::PhysicalCardProfile::Creator]
      required :creator, enum: -> { Increase::Models::PhysicalCardProfile::Creator }

      # @!attribute description
      #   A description you can use to identify the Physical Card Profile.
      #
      #   @return [String]
      required :description, String

      # @!attribute front_image_file_id
      #   The identifier of the File containing the physical card's front image.
      #
      #   @return [String, nil]
      required :front_image_file_id, String, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute is_default
      #   Whether this Physical Card Profile is the default for all cards in its Increase
      #     group.
      #
      #   @return [Boolean]
      required :is_default, Increase::Internal::Type::Boolean

      # @!attribute status
      #   The status of the Physical Card Profile.
      #
      #   @return [Symbol, Increase::Models::PhysicalCardProfile::Status]
      required :status, enum: -> { Increase::Models::PhysicalCardProfile::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `physical_card_profile`.
      #
      #   @return [Symbol, Increase::Models::PhysicalCardProfile::Type]
      required :type, enum: -> { Increase::Models::PhysicalCardProfile::Type }

      # @!parse
      #   # This contains artwork and metadata relating to a Physical Card's appearance. For
      #   #   more information, see our guide on
      #   #   [physical card artwork](https://increase.com/documentation/card-art-physical-cards).
      #   #
      #   # @param id [String]
      #   # @param back_image_file_id [String, nil]
      #   # @param carrier_image_file_id [String, nil]
      #   # @param contact_phone [String, nil]
      #   # @param created_at [Time]
      #   # @param creator [Symbol, Increase::Models::PhysicalCardProfile::Creator]
      #   # @param description [String]
      #   # @param front_image_file_id [String, nil]
      #   # @param idempotency_key [String, nil]
      #   # @param is_default [Boolean]
      #   # @param status [Symbol, Increase::Models::PhysicalCardProfile::Status]
      #   # @param type [Symbol, Increase::Models::PhysicalCardProfile::Type]
      #   #
      #   def initialize(
      #     id:,
      #     back_image_file_id:,
      #     carrier_image_file_id:,
      #     contact_phone:,
      #     created_at:,
      #     creator:,
      #     description:,
      #     front_image_file_id:,
      #     idempotency_key:,
      #     is_default:,
      #     status:,
      #     type:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # The creator of this Physical Card Profile.
      #
      # @see Increase::Models::PhysicalCardProfile#creator
      module Creator
        extend Increase::Internal::Type::Enum

        # This Physical Card Profile was created by Increase.
        INCREASE = :increase

        # This Physical Card Profile was created by you.
        USER = :user

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # The status of the Physical Card Profile.
      #
      # @see Increase::Models::PhysicalCardProfile#status
      module Status
        extend Increase::Internal::Type::Enum

        # The Card Profile has not yet been processed by Increase.
        PENDING_CREATING = :pending_creating

        # The card profile is awaiting review by Increase.
        PENDING_REVIEWING = :pending_reviewing

        # There is an issue with the Physical Card Profile preventing it from use.
        REJECTED = :rejected

        # The card profile is awaiting submission to the fulfillment provider.
        PENDING_SUBMITTING = :pending_submitting

        # The Physical Card Profile has been submitted to the fulfillment provider and is ready to use.
        ACTIVE = :active

        # The Physical Card Profile has been archived.
        ARCHIVED = :archived

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `physical_card_profile`.
      #
      # @see Increase::Models::PhysicalCardProfile#type
      module Type
        extend Increase::Internal::Type::Enum

        PHYSICAL_CARD_PROFILE = :physical_card_profile

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
