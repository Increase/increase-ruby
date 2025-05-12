# typed: strong

module Increase
  module Models
    class Group < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::Group, Increase::Internal::AnyHash) }

      # The Group identifier.
      sig { returns(String) }
      attr_accessor :id

      # If the Group is allowed to create ACH debits.
      sig { returns(Increase::Group::ACHDebitStatus::TaggedSymbol) }
      attr_accessor :ach_debit_status

      # If the Group is activated or not.
      sig { returns(Increase::Group::ActivationStatus::TaggedSymbol) }
      attr_accessor :activation_status

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Group
      # was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # A constant representing the object's type. For this resource it will always be
      # `group`.
      sig { returns(Increase::Group::Type::TaggedSymbol) }
      attr_accessor :type

      # Groups represent organizations using Increase. You can retrieve information
      # about your own organization via the API. More commonly, OAuth platforms can
      # retrieve information about the organizations that have granted them access.
      # Learn more about OAuth [here](https://increase.com/documentation/oauth).
      sig do
        params(
          id: String,
          ach_debit_status: Increase::Group::ACHDebitStatus::OrSymbol,
          activation_status: Increase::Group::ActivationStatus::OrSymbol,
          created_at: Time,
          type: Increase::Group::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Group identifier.
        id:,
        # If the Group is allowed to create ACH debits.
        ach_debit_status:,
        # If the Group is activated or not.
        activation_status:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Group
        # was created.
        created_at:,
        # A constant representing the object's type. For this resource it will always be
        # `group`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            ach_debit_status: Increase::Group::ACHDebitStatus::TaggedSymbol,
            activation_status: Increase::Group::ActivationStatus::TaggedSymbol,
            created_at: Time,
            type: Increase::Group::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # If the Group is allowed to create ACH debits.
      module ACHDebitStatus
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Group::ACHDebitStatus) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The Group cannot make ACH debits.
        DISABLED =
          T.let(:disabled, Increase::Group::ACHDebitStatus::TaggedSymbol)

        # The Group can make ACH debits.
        ENABLED = T.let(:enabled, Increase::Group::ACHDebitStatus::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::Group::ACHDebitStatus::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # If the Group is activated or not.
      module ActivationStatus
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Group::ActivationStatus) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The Group is not activated.
        UNACTIVATED =
          T.let(:unactivated, Increase::Group::ActivationStatus::TaggedSymbol)

        # The Group is activated.
        ACTIVATED =
          T.let(:activated, Increase::Group::ActivationStatus::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::Group::ActivationStatus::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `group`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Group::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GROUP = T.let(:group, Increase::Group::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Group::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
