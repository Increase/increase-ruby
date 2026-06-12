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
      #   The identifier of the File containing the physical card's back image. This will
      #   be missing until the image has been post-processed.
      #
      #   @return [String, nil]
      required :back_image_file_id, String, nil?: true

      # @!attribute carrier_image_file_id
      #   The identifier of the File containing the physical card's carrier image. This
      #   will be missing until the image has been post-processed.
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
      #   the Physical Card Profile was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute creator
      #   The creator of this Physical Card Profile.
      #
      #   @return [Symbol, Increase::Models::PhysicalCardProfile::Creator]
      required :creator, enum: -> { Increase::PhysicalCardProfile::Creator }

      # @!attribute description
      #   A description you can use to identify the Physical Card Profile.
      #
      #   @return [String]
      required :description, String

      # @!attribute front_image_file_id
      #   The identifier of the File containing the physical card's front image. This will
      #   be missing until the image has been post-processed.
      #
      #   @return [String, nil]
      required :front_image_file_id, String, nil?: true

      # @!attribute front_text
      #   Text printed on the front of the card. Reach out to
      #   [support@increase.com](mailto:support@increase.com) for more information.
      #
      #   @return [Increase::Models::PhysicalCardProfile::FrontText, nil]
      required :front_text, -> { Increase::PhysicalCardProfile::FrontText }, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute is_default
      #   Whether this Physical Card Profile is the default for all cards in its Increase
      #   group.
      #
      #   @return [Boolean]
      required :is_default, Increase::Internal::Type::Boolean

      # @!attribute program_id
      #   The identifier for the Program this Physical Card Profile belongs to.
      #
      #   @return [String]
      required :program_id, String

      # @!attribute status
      #   The status of the Physical Card Profile.
      #
      #   @return [Symbol, Increase::Models::PhysicalCardProfile::Status]
      required :status, enum: -> { Increase::PhysicalCardProfile::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `physical_card_profile`.
      #
      #   @return [Symbol, Increase::Models::PhysicalCardProfile::Type]
      required :type, enum: -> { Increase::PhysicalCardProfile::Type }

      # @!method initialize(id:, back_image_file_id:, carrier_image_file_id:, contact_phone:, created_at:, creator:, description:, front_image_file_id:, front_text:, idempotency_key:, is_default:, program_id:, status:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::PhysicalCardProfile} for more details.
      #
      #   This contains artwork and metadata relating to a Physical Card's appearance. For
      #   more information, see our guide on
      #   [physical card artwork](https://increase.com/documentation/card-art-physical-cards).
      #
      #   @param id [String] The Card Profile identifier.
      #
      #   @param back_image_file_id [String, nil] The identifier of the File containing the physical card's back image. This will
      #
      #   @param carrier_image_file_id [String, nil] The identifier of the File containing the physical card's carrier image. This wi
      #
      #   @param contact_phone [String, nil] A phone number the user can contact to receive support for their card.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param creator [Symbol, Increase::Models::PhysicalCardProfile::Creator] The creator of this Physical Card Profile.
      #
      #   @param description [String] A description you can use to identify the Physical Card Profile.
      #
      #   @param front_image_file_id [String, nil] The identifier of the File containing the physical card's front image. This will
      #
      #   @param front_text [Increase::Models::PhysicalCardProfile::FrontText, nil] Text printed on the front of the card. Reach out to [support@increase.com](mailt
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param is_default [Boolean] Whether this Physical Card Profile is the default for all cards in its Increase
      #
      #   @param program_id [String] The identifier for the Program this Physical Card Profile belongs to.
      #
      #   @param status [Symbol, Increase::Models::PhysicalCardProfile::Status] The status of the Physical Card Profile.
      #
      #   @param type [Symbol, Increase::Models::PhysicalCardProfile::Type] A constant representing the object's type. For this resource it will always be `

      # The creator of this Physical Card Profile.
      #
      # @see Increase::Models::PhysicalCardProfile#creator
      module Creator
        extend Increase::Internal::Type::Enum

        # This Physical Card Profile was created by Increase.
        INCREASE = :increase

        # This Physical Card Profile was created by you.
        USER = :user

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::PhysicalCardProfile#front_text
      class FrontText < Increase::Internal::Type::BaseModel
        # @!attribute line1
        #   The first line of text on the front of the card.
        #
        #   @return [String]
        required :line1, String

        # @!attribute line2
        #   The second line of text on the front of the card. Providing a second line moves
        #   the first line slightly higher and prints the second line in the spot where the
        #   first line would have otherwise been printed.
        #
        #   @return [String, nil]
        required :line2, String, nil?: true

        # @!method initialize(line1:, line2:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::PhysicalCardProfile::FrontText} for more details.
        #
        #   Text printed on the front of the card. Reach out to
        #   [support@increase.com](mailto:support@increase.com) for more information.
        #
        #   @param line1 [String] The first line of text on the front of the card.
        #
        #   @param line2 [String, nil] The second line of text on the front of the card. Providing a second line moves
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

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `physical_card_profile`.
      #
      # @see Increase::Models::PhysicalCardProfile#type
      module Type
        extend Increase::Internal::Type::Enum

        PHYSICAL_CARD_PROFILE = :physical_card_profile

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
