# typed: strong

module Increase
  module Models
    class IntrafiExclusion < Increase::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The identifier of this exclusion request.
      sig { returns(String) }
      attr_accessor :id

      # The name of the excluded institution.
      sig { returns(String) }
      attr_accessor :bank_name

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the exclusion was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The entity for which this institution is excluded.
      sig { returns(String) }
      attr_accessor :entity_id

      # When this was exclusion was confirmed by IntraFi.
      sig { returns(T.nilable(Time)) }
      attr_accessor :excluded_at

      # The Federal Deposit Insurance Corporation's certificate number for the
      # institution.
      sig { returns(T.nilable(String)) }
      attr_accessor :fdic_certificate_number

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The status of the exclusion request.
      sig { returns(Increase::IntrafiExclusion::Status::TaggedSymbol) }
      attr_accessor :status

      # When this was exclusion was submitted to IntraFi by Increase.
      sig { returns(T.nilable(Time)) }
      attr_accessor :submitted_at

      # A constant representing the object's type. For this resource it will always be
      # `intrafi_exclusion`.
      sig { returns(Increase::IntrafiExclusion::Type::TaggedSymbol) }
      attr_accessor :type

      # Certain institutions may be excluded per Entity when sweeping funds into the
      # IntraFi network. This is useful when an Entity already has deposits at a
      # particular bank, and does not want to sweep additional funds to it. It may take
      # 5 business days for an exclusion to be processed.
      sig do
        params(
          id: String,
          bank_name: String,
          created_at: Time,
          entity_id: String,
          excluded_at: T.nilable(Time),
          fdic_certificate_number: T.nilable(String),
          idempotency_key: T.nilable(String),
          status: Increase::IntrafiExclusion::Status::OrSymbol,
          submitted_at: T.nilable(Time),
          type: Increase::IntrafiExclusion::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of this exclusion request.
        id:,
        # The name of the excluded institution.
        bank_name:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the exclusion was created.
        created_at:,
        # The entity for which this institution is excluded.
        entity_id:,
        # When this was exclusion was confirmed by IntraFi.
        excluded_at:,
        # The Federal Deposit Insurance Corporation's certificate number for the
        # institution.
        fdic_certificate_number:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The status of the exclusion request.
        status:,
        # When this was exclusion was submitted to IntraFi by Increase.
        submitted_at:,
        # A constant representing the object's type. For this resource it will always be
        # `intrafi_exclusion`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            bank_name: String,
            created_at: Time,
            entity_id: String,
            excluded_at: T.nilable(Time),
            fdic_certificate_number: T.nilable(String),
            idempotency_key: T.nilable(String),
            status: Increase::IntrafiExclusion::Status::TaggedSymbol,
            submitted_at: T.nilable(Time),
            type: Increase::IntrafiExclusion::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The status of the exclusion request.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::IntrafiExclusion::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The exclusion is being added to the IntraFi network.
        PENDING =
          T.let(:pending, Increase::IntrafiExclusion::Status::TaggedSymbol)

        # The exclusion has been added to the IntraFi network.
        COMPLETED =
          T.let(:completed, Increase::IntrafiExclusion::Status::TaggedSymbol)

        # The exclusion has been removed from the IntraFi network.
        ARCHIVED =
          T.let(:archived, Increase::IntrafiExclusion::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::IntrafiExclusion::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `intrafi_exclusion`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::IntrafiExclusion::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INTRAFI_EXCLUSION =
          T.let(
            :intrafi_exclusion,
            Increase::IntrafiExclusion::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::IntrafiExclusion::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
