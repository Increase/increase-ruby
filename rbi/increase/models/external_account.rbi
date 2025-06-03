# typed: strong

module Increase
  module Models
    class ExternalAccount < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::ExternalAccount, Increase::Internal::AnyHash)
        end

      # The External Account's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The type of entity that owns the External Account.
      sig { returns(Increase::ExternalAccount::AccountHolder::TaggedSymbol) }
      attr_accessor :account_holder

      # The destination account number.
      sig { returns(String) }
      attr_accessor :account_number

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the External Account was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The External Account's description for display purposes.
      sig { returns(String) }
      attr_accessor :description

      # The type of the account to which the transfer will be sent.
      sig { returns(Increase::ExternalAccount::Funding::TaggedSymbol) }
      attr_accessor :funding

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The American Bankers' Association (ABA) Routing Transit Number (RTN).
      sig { returns(String) }
      attr_accessor :routing_number

      # The External Account's status.
      sig { returns(Increase::ExternalAccount::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `external_account`.
      sig { returns(Increase::ExternalAccount::Type::TaggedSymbol) }
      attr_accessor :type

      # External Accounts represent accounts at financial institutions other than
      # Increase. You can use this API to store their details for reuse.
      sig do
        params(
          id: String,
          account_holder: Increase::ExternalAccount::AccountHolder::OrSymbol,
          account_number: String,
          created_at: Time,
          description: String,
          funding: Increase::ExternalAccount::Funding::OrSymbol,
          idempotency_key: T.nilable(String),
          routing_number: String,
          status: Increase::ExternalAccount::Status::OrSymbol,
          type: Increase::ExternalAccount::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The External Account's identifier.
        id:,
        # The type of entity that owns the External Account.
        account_holder:,
        # The destination account number.
        account_number:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the External Account was created.
        created_at:,
        # The External Account's description for display purposes.
        description:,
        # The type of the account to which the transfer will be sent.
        funding:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN).
        routing_number:,
        # The External Account's status.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `external_account`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_holder:
              Increase::ExternalAccount::AccountHolder::TaggedSymbol,
            account_number: String,
            created_at: Time,
            description: String,
            funding: Increase::ExternalAccount::Funding::TaggedSymbol,
            idempotency_key: T.nilable(String),
            routing_number: String,
            status: Increase::ExternalAccount::Status::TaggedSymbol,
            type: Increase::ExternalAccount::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The type of entity that owns the External Account.
      module AccountHolder
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::ExternalAccount::AccountHolder)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The External Account is owned by a business.
        BUSINESS =
          T.let(
            :business,
            Increase::ExternalAccount::AccountHolder::TaggedSymbol
          )

        # The External Account is owned by an individual.
        INDIVIDUAL =
          T.let(
            :individual,
            Increase::ExternalAccount::AccountHolder::TaggedSymbol
          )

        # It's unknown what kind of entity owns the External Account.
        UNKNOWN =
          T.let(
            :unknown,
            Increase::ExternalAccount::AccountHolder::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::ExternalAccount::AccountHolder::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The type of the account to which the transfer will be sent.
      module Funding
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::ExternalAccount::Funding) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # A checking account.
        CHECKING =
          T.let(:checking, Increase::ExternalAccount::Funding::TaggedSymbol)

        # A savings account.
        SAVINGS =
          T.let(:savings, Increase::ExternalAccount::Funding::TaggedSymbol)

        # A different type of account.
        OTHER = T.let(:other, Increase::ExternalAccount::Funding::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::ExternalAccount::Funding::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The External Account's status.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::ExternalAccount::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The External Account is active.
        ACTIVE = T.let(:active, Increase::ExternalAccount::Status::TaggedSymbol)

        # The External Account is archived and won't appear in the dashboard.
        ARCHIVED =
          T.let(:archived, Increase::ExternalAccount::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::ExternalAccount::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `external_account`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::ExternalAccount::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EXTERNAL_ACCOUNT =
          T.let(
            :external_account,
            Increase::ExternalAccount::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::ExternalAccount::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
