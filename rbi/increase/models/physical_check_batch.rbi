# typed: strong

module Increase
  module Models
    class PhysicalCheckBatch < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::PhysicalCheckBatch, Increase::Internal::AnyHash)
        end

      # The Physical Check Batch's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Physical Check Batch was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The mailing address of the parcel.
      sig { returns(Increase::PhysicalCheckBatch::MailingAddress) }
      attr_reader :mailing_address

      sig do
        params(
          mailing_address: Increase::PhysicalCheckBatch::MailingAddress::OrHash
        ).void
      end
      attr_writer :mailing_address

      # The return address of the parcel.
      sig { returns(Increase::PhysicalCheckBatch::ReturnAddress) }
      attr_reader :return_address

      sig do
        params(
          return_address: Increase::PhysicalCheckBatch::ReturnAddress::OrHash
        ).void
      end
      attr_writer :return_address

      # The shipping method for the parcel.
      sig do
        returns(Increase::PhysicalCheckBatch::ShippingMethod::TaggedSymbol)
      end
      attr_accessor :shipping_method

      # The lifecycle status of the Physical Check Batch.
      sig { returns(Increase::PhysicalCheckBatch::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `physical_check_batch`.
      sig { returns(Increase::PhysicalCheckBatch::Type::TaggedSymbol) }
      attr_accessor :type

      # Physical Check Batches are groups of checks that are mailed in the same parcel.
      # Tracking updates are propagated to every related Check Transfer.
      sig do
        params(
          id: String,
          created_at: Time,
          idempotency_key: T.nilable(String),
          mailing_address: Increase::PhysicalCheckBatch::MailingAddress::OrHash,
          return_address: Increase::PhysicalCheckBatch::ReturnAddress::OrHash,
          shipping_method:
            Increase::PhysicalCheckBatch::ShippingMethod::OrSymbol,
          status: Increase::PhysicalCheckBatch::Status::OrSymbol,
          type: Increase::PhysicalCheckBatch::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Physical Check Batch's identifier.
        id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Physical Check Batch was created.
        created_at:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The mailing address of the parcel.
        mailing_address:,
        # The return address of the parcel.
        return_address:,
        # The shipping method for the parcel.
        shipping_method:,
        # The lifecycle status of the Physical Check Batch.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `physical_check_batch`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            idempotency_key: T.nilable(String),
            mailing_address: Increase::PhysicalCheckBatch::MailingAddress,
            return_address: Increase::PhysicalCheckBatch::ReturnAddress,
            shipping_method:
              Increase::PhysicalCheckBatch::ShippingMethod::TaggedSymbol,
            status: Increase::PhysicalCheckBatch::Status::TaggedSymbol,
            type: Increase::PhysicalCheckBatch::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class MailingAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::PhysicalCheckBatch::MailingAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city of the address.
        sig { returns(String) }
        attr_accessor :city

        # The first line of the address.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of the address.
        sig { returns(T.nilable(String)) }
        attr_accessor :line2

        # The name component of the address.
        sig { returns(String) }
        attr_accessor :name

        # The phone number that is used for delivery issues.
        sig { returns(T.nilable(String)) }
        attr_accessor :phone

        # The postal code of the address.
        sig { returns(String) }
        attr_accessor :postal_code

        # The state of the address.
        sig { returns(String) }
        attr_accessor :state

        # The mailing address of the parcel.
        sig do
          params(
            city: String,
            line1: String,
            line2: T.nilable(String),
            name: String,
            phone: T.nilable(String),
            postal_code: String,
            state: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city of the address.
          city:,
          # The first line of the address.
          line1:,
          # The second line of the address.
          line2:,
          # The name component of the address.
          name:,
          # The phone number that is used for delivery issues.
          phone:,
          # The postal code of the address.
          postal_code:,
          # The state of the address.
          state:
        )
        end

        sig do
          override.returns(
            {
              city: String,
              line1: String,
              line2: T.nilable(String),
              name: String,
              phone: T.nilable(String),
              postal_code: String,
              state: String
            }
          )
        end
        def to_hash
        end
      end

      class ReturnAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::PhysicalCheckBatch::ReturnAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city of the return address.
        sig { returns(String) }
        attr_accessor :city

        # The first line of the return address.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of the return address.
        sig { returns(T.nilable(String)) }
        attr_accessor :line2

        # The name component of the return address.
        sig { returns(String) }
        attr_accessor :name

        # The phone number that is used for delivery issues.
        sig { returns(T.nilable(String)) }
        attr_accessor :phone

        # The postal code of the return address.
        sig { returns(String) }
        attr_accessor :postal_code

        # The state of the return address.
        sig { returns(String) }
        attr_accessor :state

        # The return address of the parcel.
        sig do
          params(
            city: String,
            line1: String,
            line2: T.nilable(String),
            name: String,
            phone: T.nilable(String),
            postal_code: String,
            state: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city of the return address.
          city:,
          # The first line of the return address.
          line1:,
          # The second line of the return address.
          line2:,
          # The name component of the return address.
          name:,
          # The phone number that is used for delivery issues.
          phone:,
          # The postal code of the return address.
          postal_code:,
          # The state of the return address.
          state:
        )
        end

        sig do
          override.returns(
            {
              city: String,
              line1: String,
              line2: T.nilable(String),
              name: String,
              phone: T.nilable(String),
              postal_code: String,
              state: String
            }
          )
        end
        def to_hash
        end
      end

      # The shipping method for the parcel.
      module ShippingMethod
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::PhysicalCheckBatch::ShippingMethod)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # USPS First Class
        USPS_FIRST_CLASS =
          T.let(
            :usps_first_class,
            Increase::PhysicalCheckBatch::ShippingMethod::TaggedSymbol
          )

        # FedEx Overnight
        FEDEX_OVERNIGHT =
          T.let(
            :fedex_overnight,
            Increase::PhysicalCheckBatch::ShippingMethod::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::PhysicalCheckBatch::ShippingMethod::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The lifecycle status of the Physical Check Batch.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::PhysicalCheckBatch::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The batch is pending completion and is open to accepting new checks.
        PENDING =
          T.let(:pending, Increase::PhysicalCheckBatch::Status::TaggedSymbol)

        # The batch has been completed.
        COMPLETED =
          T.let(:completed, Increase::PhysicalCheckBatch::Status::TaggedSymbol)

        # The batch and all checks related to it have been canceled.
        CANCELED =
          T.let(:canceled, Increase::PhysicalCheckBatch::Status::TaggedSymbol)

        # The batch requires attention from an Increase operator.
        REQUIRES_ATTENTION =
          T.let(
            :requires_attention,
            Increase::PhysicalCheckBatch::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::PhysicalCheckBatch::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `physical_check_batch`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::PhysicalCheckBatch::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PHYSICAL_CHECK_BATCH =
          T.let(
            :physical_check_batch,
            Increase::PhysicalCheckBatch::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::PhysicalCheckBatch::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
