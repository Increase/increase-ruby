# typed: strong

module Increase
  module Models
    class CheckbookCheck < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::CheckbookCheck, Increase::Internal::AnyHash)
        end

      # The Checkbook Check's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The check number printed on the check.
      sig { returns(Integer) }
      attr_accessor :check_number

      # The identifier of the Checkbook the check belongs to.
      sig { returns(String) }
      attr_accessor :checkbook_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Checkbook Check was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The status of the Checkbook Check.
      sig { returns(Increase::CheckbookCheck::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `checkbook_check`.
      sig { returns(Increase::CheckbookCheck::Type::TaggedSymbol) }
      attr_accessor :type

      # A Checkbook Check is a single check within a Checkbook.
      sig do
        params(
          id: String,
          check_number: Integer,
          checkbook_id: String,
          created_at: Time,
          status: Increase::CheckbookCheck::Status::OrSymbol,
          type: Increase::CheckbookCheck::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Checkbook Check's identifier.
        id:,
        # The check number printed on the check.
        check_number:,
        # The identifier of the Checkbook the check belongs to.
        checkbook_id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Checkbook Check was created.
        created_at:,
        # The status of the Checkbook Check.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `checkbook_check`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            check_number: Integer,
            checkbook_id: String,
            created_at: Time,
            status: Increase::CheckbookCheck::Status::TaggedSymbol,
            type: Increase::CheckbookCheck::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The status of the Checkbook Check.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CheckbookCheck::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The check has not yet been deposited.
        PENDING_DEPOSIT =
          T.let(
            :pending_deposit,
            Increase::CheckbookCheck::Status::TaggedSymbol
          )

        # The check has been deposited.
        DEPOSITED =
          T.let(:deposited, Increase::CheckbookCheck::Status::TaggedSymbol)

        # The check has been stopped and can no longer be deposited.
        STOPPED =
          T.let(:stopped, Increase::CheckbookCheck::Status::TaggedSymbol)

        # The check requires attention from an Increase operator.
        REQUIRES_ATTENTION =
          T.let(
            :requires_attention,
            Increase::CheckbookCheck::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::CheckbookCheck::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `checkbook_check`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CheckbookCheck::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CHECKBOOK_CHECK =
          T.let(:checkbook_check, Increase::CheckbookCheck::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CheckbookCheck::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
