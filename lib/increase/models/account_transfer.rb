# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountTransfers#create
    class AccountTransfer < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The account transfer's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The Account to which the transfer belongs.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The transfer amount in the minor unit of the destination account currency. For
      #   dollars, for example, this is cents.
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
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
      #   account currency.
      #
      #   @return [Symbol, Increase::Models::AccountTransfer::Currency]
      required :currency, enum: -> { Increase::AccountTransfer::Currency }

      # @!attribute description
      #   The description that will show on the transactions.
      #
      #   @return [String]
      required :description, String

      # @!attribute destination_account_id
      #   The destination account's identifier.
      #
      #   @return [String]
      required :destination_account_id, String

      # @!attribute destination_transaction_id
      #   The ID for the transaction receiving the transfer.
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

      # @!attribute network
      #   The transfer's network.
      #
      #   @return [Symbol, Increase::Models::AccountTransfer::Network]
      required :network, enum: -> { Increase::AccountTransfer::Network }

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
      #   The ID for the transaction funding the transfer.
      #
      #   @return [String, nil]
      required :transaction_id, String, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `account_transfer`.
      #
      #   @return [Symbol, Increase::Models::AccountTransfer::Type]
      required :type, enum: -> { Increase::AccountTransfer::Type }

      # @!method initialize(id:, account_id:, amount:, approval:, cancellation:, created_at:, created_by:, currency:, description:, destination_account_id:, destination_transaction_id:, idempotency_key:, network:, pending_transaction_id:, status:, transaction_id:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::AccountTransfer} for more details.
      #
      #   Account transfers move funds between your own accounts at Increase.
      #
      #   @param id [String] The account transfer's identifier.
      #
      #   @param account_id [String] The Account to which the transfer belongs.
      #
      #   @param amount [Integer] The transfer amount in the minor unit of the destination account currency. For d
      #
      #   @param approval [Increase::Models::AccountTransfer::Approval, nil] If your account requires approvals for transfers and the transfer was approved,
      #
      #   @param cancellation [Increase::Models::AccountTransfer::Cancellation, nil] If your account requires approvals for transfers and the transfer was not approv
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param created_by [Increase::Models::AccountTransfer::CreatedBy, nil] What object created the transfer, either via the API or the dashboard.
      #
      #   @param currency [Symbol, Increase::Models::AccountTransfer::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
      #
      #   @param description [String] The description that will show on the transactions.
      #
      #   @param destination_account_id [String] The destination account's identifier.
      #
      #   @param destination_transaction_id [String, nil] The ID for the transaction receiving the transfer.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param network [Symbol, Increase::Models::AccountTransfer::Network] The transfer's network.
      #
      #   @param pending_transaction_id [String, nil] The ID for the pending transaction representing the transfer. A pending transact
      #
      #   @param status [Symbol, Increase::Models::AccountTransfer::Status] The lifecycle status of the transfer.
      #
      #   @param transaction_id [String, nil] The ID for the transaction funding the transfer.
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
        # @!attribute api_key
        #   If present, details about the API key that created the transfer.
        #
        #   @return [Increase::Models::AccountTransfer::CreatedBy::APIKey, nil]
        required :api_key, -> { Increase::AccountTransfer::CreatedBy::APIKey }, nil?: true

        # @!attribute category
        #   The type of object that created this transfer.
        #
        #   @return [Symbol, Increase::Models::AccountTransfer::CreatedBy::Category]
        required :category, enum: -> { Increase::AccountTransfer::CreatedBy::Category }

        # @!attribute oauth_application
        #   If present, details about the OAuth Application that created the transfer.
        #
        #   @return [Increase::Models::AccountTransfer::CreatedBy::OAuthApplication, nil]
        required :oauth_application, -> { Increase::AccountTransfer::CreatedBy::OAuthApplication }, nil?: true

        # @!attribute user
        #   If present, details about the User that created the transfer.
        #
        #   @return [Increase::Models::AccountTransfer::CreatedBy::User, nil]
        required :user, -> { Increase::AccountTransfer::CreatedBy::User }, nil?: true

        # @!method initialize(api_key:, category:, oauth_application:, user:)
        #   What object created the transfer, either via the API or the dashboard.
        #
        #   @param api_key [Increase::Models::AccountTransfer::CreatedBy::APIKey, nil] If present, details about the API key that created the transfer.
        #
        #   @param category [Symbol, Increase::Models::AccountTransfer::CreatedBy::Category] The type of object that created this transfer.
        #
        #   @param oauth_application [Increase::Models::AccountTransfer::CreatedBy::OAuthApplication, nil] If present, details about the OAuth Application that created the transfer.
        #
        #   @param user [Increase::Models::AccountTransfer::CreatedBy::User, nil] If present, details about the User that created the transfer.

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

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
      # account currency.
      #
      # @see Increase::Models::AccountTransfer#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # Canadian Dollar (CAD)
        CAD = :CAD

        # Swiss Franc (CHF)
        CHF = :CHF

        # Euro (EUR)
        EUR = :EUR

        # British Pound (GBP)
        GBP = :GBP

        # Japanese Yen (JPY)
        JPY = :JPY

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The transfer's network.
      #
      # @see Increase::Models::AccountTransfer#network
      module Network
        extend Increase::Internal::Type::Enum

        ACCOUNT = :account

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The lifecycle status of the transfer.
      #
      # @see Increase::Models::AccountTransfer#status
      module Status
        extend Increase::Internal::Type::Enum

        # The transfer is pending approval.
        PENDING_APPROVAL = :pending_approval

        # The transfer has been canceled.
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
