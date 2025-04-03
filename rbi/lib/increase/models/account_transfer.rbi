# typed: strong

module Increase
  module Models
    class AccountTransfer < Increase::Internal::Type::BaseModel
      # The account transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account to which the transfer belongs.
      sig { returns(String) }
      attr_accessor :account_id

      # The transfer amount in the minor unit of the destination account currency. For
      #   dollars, for example, this is cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # If your account requires approvals for transfers and the transfer was approved,
      #   this will contain details of the approval.
      sig { returns(T.nilable(Increase::Models::AccountTransfer::Approval)) }
      attr_reader :approval

      sig do
        params(
          approval: T.nilable(T.any(Increase::Models::AccountTransfer::Approval, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :approval

      # If your account requires approvals for transfers and the transfer was not
      #   approved, this will contain details of the cancellation.
      sig { returns(T.nilable(Increase::Models::AccountTransfer::Cancellation)) }
      attr_reader :cancellation

      sig do
        params(
          cancellation: T.nilable(T.any(Increase::Models::AccountTransfer::Cancellation, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :cancellation

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # What object created the transfer, either via the API or the dashboard.
      sig { returns(T.nilable(Increase::Models::AccountTransfer::CreatedBy)) }
      attr_reader :created_by

      sig do
        params(
          created_by: T.nilable(T.any(Increase::Models::AccountTransfer::CreatedBy, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :created_by

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
      #   account currency.
      sig { returns(Increase::Models::AccountTransfer::Currency::TaggedSymbol) }
      attr_accessor :currency

      # The description that will show on the transactions.
      sig { returns(String) }
      attr_accessor :description

      # The destination account's identifier.
      sig { returns(String) }
      attr_accessor :destination_account_id

      # The ID for the transaction receiving the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :destination_transaction_id

      # The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The transfer's network.
      sig { returns(Increase::Models::AccountTransfer::Network::TaggedSymbol) }
      attr_accessor :network

      # The ID for the pending transaction representing the transfer. A pending
      #   transaction is created when the transfer
      #   [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      #   by someone else in your organization.
      sig { returns(T.nilable(String)) }
      attr_accessor :pending_transaction_id

      # The lifecycle status of the transfer.
      sig { returns(Increase::Models::AccountTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # The ID for the transaction funding the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      #   `account_transfer`.
      sig { returns(Increase::Models::AccountTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # Account transfers move funds between your own accounts at Increase.
      sig do
        params(
          id: String,
          account_id: String,
          amount: Integer,
          approval: T.nilable(T.any(Increase::Models::AccountTransfer::Approval, Increase::Internal::AnyHash)),
          cancellation: T.nilable(T.any(Increase::Models::AccountTransfer::Cancellation, Increase::Internal::AnyHash)),
          created_at: Time,
          created_by: T.nilable(T.any(Increase::Models::AccountTransfer::CreatedBy, Increase::Internal::AnyHash)),
          currency: Increase::Models::AccountTransfer::Currency::OrSymbol,
          description: String,
          destination_account_id: String,
          destination_transaction_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          network: Increase::Models::AccountTransfer::Network::OrSymbol,
          pending_transaction_id: T.nilable(String),
          status: Increase::Models::AccountTransfer::Status::OrSymbol,
          transaction_id: T.nilable(String),
          type: Increase::Models::AccountTransfer::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        account_id:,
        amount:,
        approval:,
        cancellation:,
        created_at:,
        created_by:,
        currency:,
        description:,
        destination_account_id:,
        destination_transaction_id:,
        idempotency_key:,
        network:,
        pending_transaction_id:,
        status:,
        transaction_id:,
        type:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              account_id: String,
              amount: Integer,
              approval: T.nilable(Increase::Models::AccountTransfer::Approval),
              cancellation: T.nilable(Increase::Models::AccountTransfer::Cancellation),
              created_at: Time,
              created_by: T.nilable(Increase::Models::AccountTransfer::CreatedBy),
              currency: Increase::Models::AccountTransfer::Currency::TaggedSymbol,
              description: String,
              destination_account_id: String,
              destination_transaction_id: T.nilable(String),
              idempotency_key: T.nilable(String),
              network: Increase::Models::AccountTransfer::Network::TaggedSymbol,
              pending_transaction_id: T.nilable(String),
              status: Increase::Models::AccountTransfer::Status::TaggedSymbol,
              transaction_id: T.nilable(String),
              type: Increase::Models::AccountTransfer::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      class Approval < Increase::Internal::Type::BaseModel
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the transfer was approved.
        sig { returns(Time) }
        attr_accessor :approved_at

        # If the Transfer was approved by a user in the dashboard, the email address of
        #   that user.
        sig { returns(T.nilable(String)) }
        attr_accessor :approved_by

        # If your account requires approvals for transfers and the transfer was approved,
        #   this will contain details of the approval.
        sig { params(approved_at: Time, approved_by: T.nilable(String)).returns(T.attached_class) }
        def self.new(approved_at:, approved_by:)
        end

        sig { override.returns({approved_at: Time, approved_by: T.nilable(String)}) }
        def to_hash
        end
      end

      class Cancellation < Increase::Internal::Type::BaseModel
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the Transfer was canceled.
        sig { returns(Time) }
        attr_accessor :canceled_at

        # If the Transfer was canceled by a user in the dashboard, the email address of
        #   that user.
        sig { returns(T.nilable(String)) }
        attr_accessor :canceled_by

        # If your account requires approvals for transfers and the transfer was not
        #   approved, this will contain details of the cancellation.
        sig { params(canceled_at: Time, canceled_by: T.nilable(String)).returns(T.attached_class) }
        def self.new(canceled_at:, canceled_by:)
        end

        sig { override.returns({canceled_at: Time, canceled_by: T.nilable(String)}) }
        def to_hash
        end
      end

      class CreatedBy < Increase::Internal::Type::BaseModel
        # If present, details about the API key that created the transfer.
        sig { returns(T.nilable(Increase::Models::AccountTransfer::CreatedBy::APIKey)) }
        attr_reader :api_key

        sig do
          params(
            api_key: T.nilable(T.any(Increase::Models::AccountTransfer::CreatedBy::APIKey, Increase::Internal::AnyHash))
          )
            .void
        end
        attr_writer :api_key

        # The type of object that created this transfer.
        sig { returns(Increase::Models::AccountTransfer::CreatedBy::Category::TaggedSymbol) }
        attr_accessor :category

        # If present, details about the OAuth Application that created the transfer.
        sig { returns(T.nilable(Increase::Models::AccountTransfer::CreatedBy::OAuthApplication)) }
        attr_reader :oauth_application

        sig do
          params(
            oauth_application: T.nilable(
              T.any(Increase::Models::AccountTransfer::CreatedBy::OAuthApplication, Increase::Internal::AnyHash)
            )
          )
            .void
        end
        attr_writer :oauth_application

        # If present, details about the User that created the transfer.
        sig { returns(T.nilable(Increase::Models::AccountTransfer::CreatedBy::User)) }
        attr_reader :user

        sig do
          params(
            user: T.nilable(T.any(Increase::Models::AccountTransfer::CreatedBy::User, Increase::Internal::AnyHash))
          )
            .void
        end
        attr_writer :user

        # What object created the transfer, either via the API or the dashboard.
        sig do
          params(
            api_key: T.nilable(T.any(Increase::Models::AccountTransfer::CreatedBy::APIKey, Increase::Internal::AnyHash)),
            category: Increase::Models::AccountTransfer::CreatedBy::Category::OrSymbol,
            oauth_application: T.nilable(
              T.any(Increase::Models::AccountTransfer::CreatedBy::OAuthApplication, Increase::Internal::AnyHash)
            ),
            user: T.nilable(T.any(Increase::Models::AccountTransfer::CreatedBy::User, Increase::Internal::AnyHash))
          )
            .returns(T.attached_class)
        end
        def self.new(api_key:, category:, oauth_application:, user:)
        end

        sig do
          override
            .returns(
              {
                api_key: T.nilable(Increase::Models::AccountTransfer::CreatedBy::APIKey),
                category: Increase::Models::AccountTransfer::CreatedBy::Category::TaggedSymbol,
                oauth_application: T.nilable(Increase::Models::AccountTransfer::CreatedBy::OAuthApplication),
                user: T.nilable(Increase::Models::AccountTransfer::CreatedBy::User)
              }
            )
        end
        def to_hash
        end

        class APIKey < Increase::Internal::Type::BaseModel
          # The description set for the API key when it was created.
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # If present, details about the API key that created the transfer.
          sig { params(description: T.nilable(String)).returns(T.attached_class) }
          def self.new(description:)
          end

          sig { override.returns({description: T.nilable(String)}) }
          def to_hash
          end
        end

        # The type of object that created this transfer.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::AccountTransfer::CreatedBy::Category) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::AccountTransfer::CreatedBy::Category::TaggedSymbol) }

          # An API key. Details will be under the `api_key` object.
          API_KEY = T.let(:api_key, Increase::Models::AccountTransfer::CreatedBy::Category::TaggedSymbol)

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION =
            T.let(:oauth_application, Increase::Models::AccountTransfer::CreatedBy::Category::TaggedSymbol)

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER = T.let(:user, Increase::Models::AccountTransfer::CreatedBy::Category::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::AccountTransfer::CreatedBy::Category::TaggedSymbol]) }
          def self.values
          end
        end

        class OAuthApplication < Increase::Internal::Type::BaseModel
          # The name of the OAuth Application.
          sig { returns(String) }
          attr_accessor :name

          # If present, details about the OAuth Application that created the transfer.
          sig { params(name: String).returns(T.attached_class) }
          def self.new(name:)
          end

          sig { override.returns({name: String}) }
          def to_hash
          end
        end

        class User < Increase::Internal::Type::BaseModel
          # The email address of the User.
          sig { returns(String) }
          attr_accessor :email

          # If present, details about the User that created the transfer.
          sig { params(email: String).returns(T.attached_class) }
          def self.new(email:)
          end

          sig { override.returns({email: String}) }
          def to_hash
          end
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
      #   account currency.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::AccountTransfer::Currency) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::AccountTransfer::Currency::TaggedSymbol) }

        # Canadian Dollar (CAD)
        CAD = T.let(:CAD, Increase::Models::AccountTransfer::Currency::TaggedSymbol)

        # Swiss Franc (CHF)
        CHF = T.let(:CHF, Increase::Models::AccountTransfer::Currency::TaggedSymbol)

        # Euro (EUR)
        EUR = T.let(:EUR, Increase::Models::AccountTransfer::Currency::TaggedSymbol)

        # British Pound (GBP)
        GBP = T.let(:GBP, Increase::Models::AccountTransfer::Currency::TaggedSymbol)

        # Japanese Yen (JPY)
        JPY = T.let(:JPY, Increase::Models::AccountTransfer::Currency::TaggedSymbol)

        # US Dollar (USD)
        USD = T.let(:USD, Increase::Models::AccountTransfer::Currency::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::AccountTransfer::Currency::TaggedSymbol]) }
        def self.values
        end
      end

      # The transfer's network.
      module Network
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::AccountTransfer::Network) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::AccountTransfer::Network::TaggedSymbol) }

        ACCOUNT = T.let(:account, Increase::Models::AccountTransfer::Network::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::AccountTransfer::Network::TaggedSymbol]) }
        def self.values
        end
      end

      # The lifecycle status of the transfer.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::AccountTransfer::Status) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::AccountTransfer::Status::TaggedSymbol) }

        # The transfer is pending approval.
        PENDING_APPROVAL = T.let(:pending_approval, Increase::Models::AccountTransfer::Status::TaggedSymbol)

        # The transfer has been canceled.
        CANCELED = T.let(:canceled, Increase::Models::AccountTransfer::Status::TaggedSymbol)

        # The transfer has been completed.
        COMPLETE = T.let(:complete, Increase::Models::AccountTransfer::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::AccountTransfer::Status::TaggedSymbol]) }
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `account_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::AccountTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::AccountTransfer::Type::TaggedSymbol) }

        ACCOUNT_TRANSFER = T.let(:account_transfer, Increase::Models::AccountTransfer::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::AccountTransfer::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
