# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountTransfers#create
    class AccountTransfer < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Account Transfer's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The Account from which the transfer originated.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The transfer amount in cents. This will always be positive and indicates the
      #   amount of money leaving the originating account.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute approval
      #   If your account requires approvals for transfers and the transfer was approved,
      #   this will contain details of the approval.
      #
      #   @return [Increase::Models::AccountTransfer::Approval, nil]
      required :approval, -> { Increase::AccountTransfer::Approval }, nil?: true

      # @!attribute cancellation
      #   If your account requires approvals for transfers and the transfer was not
      #   approved, this will contain details of the cancellation.
      #
      #   @return [Increase::Models::AccountTransfer::Cancellation, nil]
      required :cancellation, -> { Increase::AccountTransfer::Cancellation }, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute created_by
      #   What object created the transfer, either via the API or the dashboard.
      #
      #   @return [Increase::Models::AccountTransfer::CreatedBy, nil]
      required :created_by, -> { Increase::AccountTransfer::CreatedBy }, nil?: true

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      #   currency.
      #
      #   @return [Symbol, Increase::Models::AccountTransfer::Currency]
      required :currency, enum: -> { Increase::AccountTransfer::Currency }

      # @!attribute description
      #   An internal-facing description for the transfer for display in the API and
      #   dashboard. This will also show in the description of the created Transactions.
      #
      #   @return [String]
      required :description, String

      # @!attribute destination_account_id
      #   The destination Account's identifier.
      #
      #   @return [String]
      required :destination_account_id, String

      # @!attribute destination_transaction_id
      #   The identifier of the Transaction on the destination Account representing the
      #   received funds.
      #
      #   @return [String, nil]
      required :destination_transaction_id, String, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute pending_transaction_id
      #   The ID for the pending transaction representing the transfer. A pending
      #   transaction is created when the transfer
      #   [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      #   by someone else in your organization.
      #
      #   @return [String, nil]
      required :pending_transaction_id, String, nil?: true

      # @!attribute status
      #   The lifecycle status of the transfer.
      #
      #   @return [Symbol, Increase::Models::AccountTransfer::Status]
      required :status, enum: -> { Increase::AccountTransfer::Status }

      # @!attribute transaction_id
      #   The identifier of the Transaction on the originating account representing the
      #   transferred funds.
      #
      #   @return [String, nil]
      required :transaction_id, String, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `account_transfer`.
      #
      #   @return [Symbol, Increase::Models::AccountTransfer::Type]
      required :type, enum: -> { Increase::AccountTransfer::Type }

      # @!method initialize(id:, account_id:, amount:, approval:, cancellation:, created_at:, created_by:, currency:, description:, destination_account_id:, destination_transaction_id:, idempotency_key:, pending_transaction_id:, status:, transaction_id:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::AccountTransfer} for more details.
      #
      #   Account transfers move funds between your own accounts at Increase (accounting
      #   systems often refer to these as Book Transfers). Account Transfers are free and
      #   synchronous. Upon creation they create two Transactions, one negative on the
      #   originating account and one positive on the destination account (unless the
      #   transfer requires approval, in which case the Transactions will be created when
      #   the transfer is approved).
      #
      #   @param id [String] The Account Transfer's identifier.
      #
      #   @param account_id [String] The Account from which the transfer originated.
      #
      #   @param amount [Integer] The transfer amount in cents. This will always be positive and indicates the amo
      #
      #   @param approval [Increase::Models::AccountTransfer::Approval, nil] If your account requires approvals for transfers and the transfer was approved,
      #
      #   @param cancellation [Increase::Models::AccountTransfer::Cancellation, nil] If your account requires approvals for transfers and the transfer was not approv
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param created_by [Increase::Models::AccountTransfer::CreatedBy, nil] What object created the transfer, either via the API or the dashboard.
      #
      #   @param currency [Symbol, Increase::Models::AccountTransfer::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's c
      #
      #   @param description [String] An internal-facing description for the transfer for display in the API and dashb
      #
      #   @param destination_account_id [String] The destination Account's identifier.
      #
      #   @param destination_transaction_id [String, nil] The identifier of the Transaction on the destination Account representing the re
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param pending_transaction_id [String, nil] The ID for the pending transaction representing the transfer. A pending transact
      #
      #   @param status [Symbol, Increase::Models::AccountTransfer::Status] The lifecycle status of the transfer.
      #
      #   @param transaction_id [String, nil] The identifier of the Transaction on the originating account representing the tr
      #
      #   @param type [Symbol, Increase::Models::AccountTransfer::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::AccountTransfer#approval
      class Approval < Increase::Internal::Type::BaseModel
        # @!attribute approved_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the transfer was approved.
        #
        #   @return [Time]
        required :approved_at, Time

        # @!attribute approved_by
        #   If the Transfer was approved by a user in the dashboard, the email address of
        #   that user.
        #
        #   @return [String, nil]
        required :approved_by, String, nil?: true

        # @!method initialize(approved_at:, approved_by:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::AccountTransfer::Approval} for more details.
        #
        #   If your account requires approvals for transfers and the transfer was approved,
        #   this will contain details of the approval.
        #
        #   @param approved_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param approved_by [String, nil] If the Transfer was approved by a user in the dashboard, the email address of th
      end

      # @see Increase::Models::AccountTransfer#cancellation
      class Cancellation < Increase::Internal::Type::BaseModel
        # @!attribute canceled_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the Transfer was canceled.
        #
        #   @return [Time]
        required :canceled_at, Time

        # @!attribute canceled_by
        #   If the Transfer was canceled by a user in the dashboard, the email address of
        #   that user.
        #
        #   @return [String, nil]
        required :canceled_by, String, nil?: true

        # @!method initialize(canceled_at:, canceled_by:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::AccountTransfer::Cancellation} for more details.
        #
        #   If your account requires approvals for transfers and the transfer was not
        #   approved, this will contain details of the cancellation.
        #
        #   @param canceled_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param canceled_by [String, nil] If the Transfer was canceled by a user in the dashboard, the email address of th
      end

      # @see Increase::Models::AccountTransfer#created_by
      class CreatedBy < Increase::Internal::Type::BaseModel
        # @!attribute category
        #   The type of object that created this transfer.
        #
        #   @return [Symbol, Increase::Models::AccountTransfer::CreatedBy::Category]
        required :category, enum: -> { Increase::AccountTransfer::CreatedBy::Category }

        # @!attribute api_key
        #   If present, details about the API key that created the transfer.
        #
        #   @return [Increase::Models::AccountTransfer::CreatedBy::APIKey, nil]
        optional :api_key, -> { Increase::AccountTransfer::CreatedBy::APIKey }, nil?: true

        # @!attribute oauth_application
        #   If present, details about the OAuth Application that created the transfer.
        #
        #   @return [Increase::Models::AccountTransfer::CreatedBy::OAuthApplication, nil]
        optional :oauth_application, -> { Increase::AccountTransfer::CreatedBy::OAuthApplication }, nil?: true

        # @!attribute user
        #   If present, details about the User that created the transfer.
        #
        #   @return [Increase::Models::AccountTransfer::CreatedBy::User, nil]
        optional :user, -> { Increase::AccountTransfer::CreatedBy::User }, nil?: true

        # @!method initialize(category:, api_key: nil, oauth_application: nil, user: nil)
        #   What object created the transfer, either via the API or the dashboard.
        #
        #   @param category [Symbol, Increase::Models::AccountTransfer::CreatedBy::Category] The type of object that created this transfer.
        #
        #   @param api_key [Increase::Models::AccountTransfer::CreatedBy::APIKey, nil] If present, details about the API key that created the transfer.
        #
        #   @param oauth_application [Increase::Models::AccountTransfer::CreatedBy::OAuthApplication, nil] If present, details about the OAuth Application that created the transfer.
        #
        #   @param user [Increase::Models::AccountTransfer::CreatedBy::User, nil] If present, details about the User that created the transfer.

        # The type of object that created this transfer.
        #
        # @see Increase::Models::AccountTransfer::CreatedBy#category
        module Category
          extend Increase::Internal::Type::Enum

          # An API key. Details will be under the `api_key` object.
          API_KEY = :api_key

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION = :oauth_application

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER = :user

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::AccountTransfer::CreatedBy#api_key
        class APIKey < Increase::Internal::Type::BaseModel
          # @!attribute description
          #   The description set for the API key when it was created.
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!method initialize(description:)
          #   If present, details about the API key that created the transfer.
          #
          #   @param description [String, nil] The description set for the API key when it was created.
        end

        # @see Increase::Models::AccountTransfer::CreatedBy#oauth_application
        class OAuthApplication < Increase::Internal::Type::BaseModel
          # @!attribute name
          #   The name of the OAuth Application.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(name:)
          #   If present, details about the OAuth Application that created the transfer.
          #
          #   @param name [String] The name of the OAuth Application.
        end

        # @see Increase::Models::AccountTransfer::CreatedBy#user
        class User < Increase::Internal::Type::BaseModel
          # @!attribute email
          #   The email address of the User.
          #
          #   @return [String]
          required :email, String

          # @!method initialize(email:)
          #   If present, details about the User that created the transfer.
          #
          #   @param email [String] The email address of the User.
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency.
      #
      # @see Increase::Models::AccountTransfer#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The lifecycle status of the transfer.
      #
      # @see Increase::Models::AccountTransfer#status
      module Status
        extend Increase::Internal::Type::Enum

        # The transfer is pending approval from your team.
        PENDING_APPROVAL = :pending_approval

        # The transfer was pending approval from your team and has been canceled.
        CANCELED = :canceled

        # The transfer has been completed.
        COMPLETE = :complete

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `account_transfer`.
      #
      # @see Increase::Models::AccountTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        ACCOUNT_TRANSFER = :account_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
