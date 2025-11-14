# typed: strong

module Increase
  module Models
    class PhysicalCardProfile < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::PhysicalCardProfile, Increase::Internal::AnyHash)
        end

      # The Card Profile identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier of the File containing the physical card's back image. This will
      # be missing until the image has been post-processed.
      sig { returns(T.nilable(String)) }
      attr_accessor :back_image_file_id

      # The identifier of the File containing the physical card's carrier image. This
      # will be missing until the image has been post-processed.
      sig { returns(T.nilable(String)) }
      attr_accessor :carrier_image_file_id

      # A phone number the user can contact to receive support for their card.
      sig { returns(T.nilable(String)) }
      attr_accessor :contact_phone

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Card Dispute was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The creator of this Physical Card Profile.
      sig { returns(Increase::PhysicalCardProfile::Creator::TaggedSymbol) }
      attr_accessor :creator

      # A description you can use to identify the Physical Card Profile.
      sig { returns(String) }
      attr_accessor :description

      # The identifier of the File containing the physical card's front image. This will
      # be missing until the image has been post-processed.
      sig { returns(T.nilable(String)) }
      attr_accessor :front_image_file_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # Whether this Physical Card Profile is the default for all cards in its Increase
      # group.
      sig { returns(T::Boolean) }
      attr_accessor :is_default

      # The identifier for the Program this Physical Card Profile belongs to.
      sig { returns(String) }
      attr_accessor :program_id

      # The status of the Physical Card Profile.
      sig { returns(Increase::PhysicalCardProfile::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `physical_card_profile`.
      sig { returns(Increase::PhysicalCardProfile::Type::TaggedSymbol) }
      attr_accessor :type

      # This contains artwork and metadata relating to a Physical Card's appearance. For
      # more information, see our guide on
      # [physical card artwork](https://increase.com/documentation/card-art-physical-cards).
      sig do
        params(
          id: String,
          back_image_file_id: T.nilable(String),
          carrier_image_file_id: T.nilable(String),
          contact_phone: T.nilable(String),
          created_at: Time,
          creator: Increase::PhysicalCardProfile::Creator::OrSymbol,
          description: String,
          front_image_file_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          is_default: T::Boolean,
          program_id: String,
          status: Increase::PhysicalCardProfile::Status::OrSymbol,
          type: Increase::PhysicalCardProfile::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Card Profile identifier.
        id:,
        # The identifier of the File containing the physical card's back image. This will
        # be missing until the image has been post-processed.
        back_image_file_id:,
        # The identifier of the File containing the physical card's carrier image. This
        # will be missing until the image has been post-processed.
        carrier_image_file_id:,
        # A phone number the user can contact to receive support for their card.
        contact_phone:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Card Dispute was created.
        created_at:,
        # The creator of this Physical Card Profile.
        creator:,
        # A description you can use to identify the Physical Card Profile.
        description:,
        # The identifier of the File containing the physical card's front image. This will
        # be missing until the image has been post-processed.
        front_image_file_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # Whether this Physical Card Profile is the default for all cards in its Increase
        # group.
        is_default:,
        # The identifier for the Program this Physical Card Profile belongs to.
        program_id:,
        # The status of the Physical Card Profile.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `physical_card_profile`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            back_image_file_id: T.nilable(String),
            carrier_image_file_id: T.nilable(String),
            contact_phone: T.nilable(String),
            created_at: Time,
            creator: Increase::PhysicalCardProfile::Creator::TaggedSymbol,
            description: String,
            front_image_file_id: T.nilable(String),
            idempotency_key: T.nilable(String),
            is_default: T::Boolean,
            program_id: String,
            status: Increase::PhysicalCardProfile::Status::TaggedSymbol,
            type: Increase::PhysicalCardProfile::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The creator of this Physical Card Profile.
      module Creator
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::PhysicalCardProfile::Creator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # This Physical Card Profile was created by Increase.
        INCREASE =
          T.let(:increase, Increase::PhysicalCardProfile::Creator::TaggedSymbol)

        # This Physical Card Profile was created by you.
        USER =
          T.let(:user, Increase::PhysicalCardProfile::Creator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::PhysicalCardProfile::Creator::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The status of the Physical Card Profile.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::PhysicalCardProfile::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The Card Profile has not yet been processed by Increase.
        PENDING_CREATING =
          T.let(
            :pending_creating,
            Increase::PhysicalCardProfile::Status::TaggedSymbol
          )

        # The card profile is awaiting review by Increase.
        PENDING_REVIEWING =
          T.let(
            :pending_reviewing,
            Increase::PhysicalCardProfile::Status::TaggedSymbol
          )

        # There is an issue with the Physical Card Profile preventing it from use.
        REJECTED =
          T.let(:rejected, Increase::PhysicalCardProfile::Status::TaggedSymbol)

        # The card profile is awaiting submission to the fulfillment provider.
        PENDING_SUBMITTING =
          T.let(
            :pending_submitting,
            Increase::PhysicalCardProfile::Status::TaggedSymbol
          )

        # The Physical Card Profile has been submitted to the fulfillment provider and is ready to use.
        ACTIVE =
          T.let(:active, Increase::PhysicalCardProfile::Status::TaggedSymbol)

        # The Physical Card Profile has been archived.
        ARCHIVED =
          T.let(:archived, Increase::PhysicalCardProfile::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::PhysicalCardProfile::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `physical_card_profile`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::PhysicalCardProfile::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PHYSICAL_CARD_PROFILE =
          T.let(
            :physical_card_profile,
            Increase::PhysicalCardProfile::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::PhysicalCardProfile::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
