# typed: strong

module Increase
  module Models
    class AccountTransfer < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::AccountTransfer, Increase::Internal::AnyHash)
        end

      # The Account Transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account from which the transfer originated.
      sig { returns(String) }
      attr_accessor :account_id

      # The transfer amount in cents. This will always be positive and indicates the
      # amount of money leaving the originating account.
      sig { returns(Integer) }
      attr_accessor :amount

      # If your account requires approvals for transfers and the transfer was approved,
      # this will contain details of the approval.
      sig { returns(T.nilable(Increase::AccountTransfer::Approval)) }
      attr_reader :approval

      sig do
        params(
          approval: T.nilable(Increase::AccountTransfer::Approval::OrHash)
        ).void
      end
      attr_writer :approval

      # If your account requires approvals for transfers and the transfer was not
      # approved, this will contain details of the cancellation.
      sig { returns(T.nilable(Increase::AccountTransfer::Cancellation)) }
      attr_reader :cancellation

      sig do
        params(
          cancellation:
            T.nilable(Increase::AccountTransfer::Cancellation::OrHash)
        ).void
      end
      attr_writer :cancellation

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # What object created the transfer, either via the API or the dashboard.
      sig { returns(T.nilable(Increase::AccountTransfer::CreatedBy)) }
      attr_reader :created_by

      sig do
        params(
          created_by: T.nilable(Increase::AccountTransfer::CreatedBy::OrHash)
        ).void
      end
      attr_writer :created_by

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency.
      sig { returns(Increase::AccountTransfer::Currency::TaggedSymbol) }
      attr_accessor :currency

      # An internal-facing description for the transfer for display in the API and
      # dashboard. This will also show in the description of the created Transactions.
      sig { returns(String) }
      attr_accessor :description

      # The destination Account's identifier.
      sig { returns(String) }
      attr_accessor :destination_account_id

      # The identifier of the Transaction on the destination Account representing the
      # received funds.
      sig { returns(T.nilable(String)) }
      attr_accessor :destination_transaction_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The ID for the pending transaction representing the transfer. A pending
      # transaction is created when the transfer
      # [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      # by someone else in your organization.
      sig { returns(T.nilable(String)) }
      attr_accessor :pending_transaction_id

      # The lifecycle status of the transfer.
      sig { returns(Increase::AccountTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # The identifier of the Transaction on the originating account representing the
      # transferred funds.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      # `account_transfer`.
      sig { returns(Increase::AccountTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # Account transfers move funds between your own accounts at Increase (accounting
      # systems often refer to these as Book Transfers). Account Transfers are free and
      # synchronous. Upon creation they create two Transactions, one negative on the
      # originating account and one positive on the destination account (unless the
      # transfer requires approval, in which case the Transactions will be created when
      # the transfer is approved).
      sig do
        params(
          id: String,
          account_id: String,
          amount: Integer,
          approval: T.nilable(Increase::AccountTransfer::Approval::OrHash),
          cancellation:
            T.nilable(Increase::AccountTransfer::Cancellation::OrHash),
          created_at: Time,
          created_by: T.nilable(Increase::AccountTransfer::CreatedBy::OrHash),
          currency: Increase::AccountTransfer::Currency::OrSymbol,
          description: String,
          destination_account_id: String,
          destination_transaction_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          pending_transaction_id: T.nilable(String),
          status: Increase::AccountTransfer::Status::OrSymbol,
          transaction_id: T.nilable(String),
          type: Increase::AccountTransfer::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account Transfer's identifier.
        id:,
        # The Account from which the transfer originated.
        account_id:,
        # The transfer amount in cents. This will always be positive and indicates the
        # amount of money leaving the originating account.
        amount:,
        # If your account requires approvals for transfers and the transfer was approved,
        # this will contain details of the approval.
        approval:,
        # If your account requires approvals for transfers and the transfer was not
        # approved, this will contain details of the cancellation.
        cancellation:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was created.
        created_at:,
        # What object created the transfer, either via the API or the dashboard.
        created_by:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
        # currency.
        currency:,
        # An internal-facing description for the transfer for display in the API and
        # dashboard. This will also show in the description of the created Transactions.
        description:,
        # The destination Account's identifier.
        destination_account_id:,
        # The identifier of the Transaction on the destination Account representing the
        # received funds.
        destination_transaction_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The ID for the pending transaction representing the transfer. A pending
        # transaction is created when the transfer
        # [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
        # by someone else in your organization.
        pending_transaction_id:,
        # The lifecycle status of the transfer.
        status:,
        # The identifier of the Transaction on the originating account representing the
        # transferred funds.
        transaction_id:,
        # A constant representing the object's type. For this resource it will always be
        # `account_transfer`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            amount: Integer,
            approval: T.nilable(Increase::AccountTransfer::Approval),
            cancellation: T.nilable(Increase::AccountTransfer::Cancellation),
            created_at: Time,
            created_by: T.nilable(Increase::AccountTransfer::CreatedBy),
            currency: Increase::AccountTransfer::Currency::TaggedSymbol,
            description: String,
            destination_account_id: String,
            destination_transaction_id: T.nilable(String),
            idempotency_key: T.nilable(String),
            pending_transaction_id: T.nilable(String),
            status: Increase::AccountTransfer::Status::TaggedSymbol,
            transaction_id: T.nilable(String),
            type: Increase::AccountTransfer::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Approval < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::AccountTransfer::Approval,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was approved.
        sig { returns(Time) }
        attr_accessor :approved_at

        # If the Transfer was approved by a user in the dashboard, the email address of
        # that user.
        sig { returns(T.nilable(String)) }
        attr_accessor :approved_by

        # If your account requires approvals for transfers and the transfer was approved,
        # this will contain details of the approval.
        sig do
          params(approved_at: Time, approved_by: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was approved.
          approved_at:,
          # If the Transfer was approved by a user in the dashboard, the email address of
          # that user.
          approved_by:
        )
        end

        sig do
          override.returns(
            { approved_at: Time, approved_by: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      class Cancellation < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::AccountTransfer::Cancellation,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Transfer was canceled.
        sig { returns(Time) }
        attr_accessor :canceled_at

        # If the Transfer was canceled by a user in the dashboard, the email address of
        # that user.
        sig { returns(T.nilable(String)) }
        attr_accessor :canceled_by

        # If your account requires approvals for transfers and the transfer was not
        # approved, this will contain details of the cancellation.
        sig do
          params(canceled_at: Time, canceled_by: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the Transfer was canceled.
          canceled_at:,
          # If the Transfer was canceled by a user in the dashboard, the email address of
          # that user.
          canceled_by:
        )
        end

        sig do
          override.returns(
            { canceled_at: Time, canceled_by: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      class CreatedBy < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::AccountTransfer::CreatedBy,
              Increase::Internal::AnyHash
            )
          end

        # The type of object that created this transfer.
        sig do
          returns(Increase::AccountTransfer::CreatedBy::Category::TaggedSymbol)
        end
        attr_accessor :category

        # If present, details about the API key that created the transfer.
        sig { returns(T.nilable(Increase::AccountTransfer::CreatedBy::APIKey)) }
        attr_reader :api_key

        sig do
          params(
            api_key:
              T.nilable(Increase::AccountTransfer::CreatedBy::APIKey::OrHash)
          ).void
        end
        attr_writer :api_key

        # If present, details about the OAuth Application that created the transfer.
        sig do
          returns(
            T.nilable(Increase::AccountTransfer::CreatedBy::OAuthApplication)
          )
        end
        attr_reader :oauth_application

        sig do
          params(
            oauth_application:
              T.nilable(
                Increase::AccountTransfer::CreatedBy::OAuthApplication::OrHash
              )
          ).void
        end
        attr_writer :oauth_application

        # If present, details about the User that created the transfer.
        sig { returns(T.nilable(Increase::AccountTransfer::CreatedBy::User)) }
        attr_reader :user

        sig do
          params(
            user: T.nilable(Increase::AccountTransfer::CreatedBy::User::OrHash)
          ).void
        end
        attr_writer :user

        # What object created the transfer, either via the API or the dashboard.
        sig do
          params(
            category: Increase::AccountTransfer::CreatedBy::Category::OrSymbol,
            api_key:
              T.nilable(Increase::AccountTransfer::CreatedBy::APIKey::OrHash),
            oauth_application:
              T.nilable(
                Increase::AccountTransfer::CreatedBy::OAuthApplication::OrHash
              ),
            user: T.nilable(Increase::AccountTransfer::CreatedBy::User::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # The type of object that created this transfer.
          category:,
          # If present, details about the API key that created the transfer.
          api_key: nil,
          # If present, details about the OAuth Application that created the transfer.
          oauth_application: nil,
          # If present, details about the User that created the transfer.
          user: nil
        )
        end

        sig do
          override.returns(
            {
              category:
                Increase::AccountTransfer::CreatedBy::Category::TaggedSymbol,
              api_key: T.nilable(Increase::AccountTransfer::CreatedBy::APIKey),
              oauth_application:
                T.nilable(
                  Increase::AccountTransfer::CreatedBy::OAuthApplication
                ),
              user: T.nilable(Increase::AccountTransfer::CreatedBy::User)
            }
          )
        end
        def to_hash
        end

        # The type of object that created this transfer.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::AccountTransfer::CreatedBy::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # An API key. Details will be under the `api_key` object.
          API_KEY =
            T.let(
              :api_key,
              Increase::AccountTransfer::CreatedBy::Category::TaggedSymbol
            )

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION =
            T.let(
              :oauth_application,
              Increase::AccountTransfer::CreatedBy::Category::TaggedSymbol
            )

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER =
            T.let(
              :user,
              Increase::AccountTransfer::CreatedBy::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::AccountTransfer::CreatedBy::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class APIKey < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::AccountTransfer::CreatedBy::APIKey,
                Increase::Internal::AnyHash
              )
            end

          # The description set for the API key when it was created.
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # If present, details about the API key that created the transfer.
          sig do
            params(description: T.nilable(String)).returns(T.attached_class)
          end
          def self.new(
            # The description set for the API key when it was created.
            description:
          )
          end

          sig { override.returns({ description: T.nilable(String) }) }
          def to_hash
          end
        end

        class OAuthApplication < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::AccountTransfer::CreatedBy::OAuthApplication,
                Increase::Internal::AnyHash
              )
            end

          # The name of the OAuth Application.
          sig { returns(String) }
          attr_accessor :name

          # If present, details about the OAuth Application that created the transfer.
          sig { params(name: String).returns(T.attached_class) }
          def self.new(
            # The name of the OAuth Application.
            name:
          )
          end

          sig { override.returns({ name: String }) }
          def to_hash
          end
        end

        class User < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::AccountTransfer::CreatedBy::User,
                Increase::Internal::AnyHash
              )
            end

          # The email address of the User.
          sig { returns(String) }
          attr_accessor :email

          # If present, details about the User that created the transfer.
          sig { params(email: String).returns(T.attached_class) }
          def self.new(
            # The email address of the User.
            email:
          )
          end

          sig { override.returns({ email: String }) }
          def to_hash
          end
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::AccountTransfer::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # US Dollar (USD)
        USD = T.let(:USD, Increase::AccountTransfer::Currency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::AccountTransfer::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The lifecycle status of the transfer.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::AccountTransfer::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The transfer is pending approval from your team.
        PENDING_APPROVAL =
          T.let(
            :pending_approval,
            Increase::AccountTransfer::Status::TaggedSymbol
          )

        # The transfer was pending approval from your team and has been canceled.
        CANCELED =
          T.let(:canceled, Increase::AccountTransfer::Status::TaggedSymbol)

        # The transfer has been completed.
        COMPLETE =
          T.let(:complete, Increase::AccountTransfer::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::AccountTransfer::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `account_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::AccountTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT_TRANSFER =
          T.let(
            :account_transfer,
            Increase::AccountTransfer::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::AccountTransfer::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
