# typed: strong

module Increase
  module Models
    class PhysicalCardProfile < Increase::Internal::Type::BaseModel
      # The Card Profile identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier of the File containing the physical card's back image.
      sig { returns(T.nilable(String)) }
      attr_accessor :back_image_file_id

      # The identifier of the File containing the physical card's carrier image.
      sig { returns(T.nilable(String)) }
      attr_accessor :carrier_image_file_id

      # A phone number the user can contact to receive support for their card.
      sig { returns(T.nilable(String)) }
      attr_accessor :contact_phone

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Card Dispute was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The creator of this Physical Card Profile.
      sig { returns(Increase::Models::PhysicalCardProfile::Creator::TaggedSymbol) }
      attr_accessor :creator

      # A description you can use to identify the Physical Card Profile.
      sig { returns(String) }
      attr_accessor :description

      # The identifier of the File containing the physical card's front image.
      sig { returns(T.nilable(String)) }
      attr_accessor :front_image_file_id

      # The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # Whether this Physical Card Profile is the default for all cards in its Increase
      #   group.
      sig { returns(T::Boolean) }
      attr_accessor :is_default

      # The status of the Physical Card Profile.
      sig { returns(Increase::Models::PhysicalCardProfile::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      #   `physical_card_profile`.
      sig { returns(Increase::Models::PhysicalCardProfile::Type::TaggedSymbol) }
      attr_accessor :type

      # This contains artwork and metadata relating to a Physical Card's appearance. For
      #   more information, see our guide on
      #   [physical card artwork](https://increase.com/documentation/card-art-physical-cards).
      sig do
        params(
          id: String,
          back_image_file_id: T.nilable(String),
          carrier_image_file_id: T.nilable(String),
          contact_phone: T.nilable(String),
          created_at: Time,
          creator: Increase::Models::PhysicalCardProfile::Creator::OrSymbol,
          description: String,
          front_image_file_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          is_default: T::Boolean,
          status: Increase::Models::PhysicalCardProfile::Status::OrSymbol,
          type: Increase::Models::PhysicalCardProfile::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        back_image_file_id:,
        carrier_image_file_id:,
        contact_phone:,
        created_at:,
        creator:,
        description:,
        front_image_file_id:,
        idempotency_key:,
        is_default:,
        status:,
        type:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              back_image_file_id: T.nilable(String),
              carrier_image_file_id: T.nilable(String),
              contact_phone: T.nilable(String),
              created_at: Time,
              creator: Increase::Models::PhysicalCardProfile::Creator::TaggedSymbol,
              description: String,
              front_image_file_id: T.nilable(String),
              idempotency_key: T.nilable(String),
              is_default: T::Boolean,
              status: Increase::Models::PhysicalCardProfile::Status::TaggedSymbol,
              type: Increase::Models::PhysicalCardProfile::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      # The creator of this Physical Card Profile.
      module Creator
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::PhysicalCardProfile::Creator) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::PhysicalCardProfile::Creator::TaggedSymbol) }

        # This Physical Card Profile was created by Increase.
        INCREASE = T.let(:increase, Increase::Models::PhysicalCardProfile::Creator::TaggedSymbol)

        # This Physical Card Profile was created by you.
        USER = T.let(:user, Increase::Models::PhysicalCardProfile::Creator::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::PhysicalCardProfile::Creator::TaggedSymbol]) }
        def self.values
        end
      end

      # The status of the Physical Card Profile.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::PhysicalCardProfile::Status) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::PhysicalCardProfile::Status::TaggedSymbol) }

        # The Card Profile has not yet been processed by Increase.
        PENDING_CREATING = T.let(:pending_creating, Increase::Models::PhysicalCardProfile::Status::TaggedSymbol)

        # The card profile is awaiting review by Increase.
        PENDING_REVIEWING =
          T.let(:pending_reviewing, Increase::Models::PhysicalCardProfile::Status::TaggedSymbol)

        # There is an issue with the Physical Card Profile preventing it from use.
        REJECTED = T.let(:rejected, Increase::Models::PhysicalCardProfile::Status::TaggedSymbol)

        # The card profile is awaiting submission to the fulfillment provider.
        PENDING_SUBMITTING =
          T.let(:pending_submitting, Increase::Models::PhysicalCardProfile::Status::TaggedSymbol)

        # The Physical Card Profile has been submitted to the fulfillment provider and is ready to use.
        ACTIVE = T.let(:active, Increase::Models::PhysicalCardProfile::Status::TaggedSymbol)

        # The Physical Card Profile has been archived.
        ARCHIVED = T.let(:archived, Increase::Models::PhysicalCardProfile::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::PhysicalCardProfile::Status::TaggedSymbol]) }
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `physical_card_profile`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::PhysicalCardProfile::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::PhysicalCardProfile::Type::TaggedSymbol) }

        PHYSICAL_CARD_PROFILE =
          T.let(:physical_card_profile, Increase::Models::PhysicalCardProfile::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::PhysicalCardProfile::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
