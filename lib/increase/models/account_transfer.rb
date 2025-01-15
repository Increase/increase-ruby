# frozen_string_literal: true

module Increase
  module Models
    # @example
    #
    # ```ruby
    # account_transfer => {
    #   id: String,
    #   account_id: String,
    #   amount: Integer,
    #   approval: Increase::Models::AccountTransfer::Approval,
    #   cancellation: Increase::Models::AccountTransfer::Cancellation,
    #   **_
    # }
    # ```
    class AccountTransfer < Increase::BaseModel
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
      #   The transfer amount in the minor unit of the destination account currency. For dollars, for example, this is cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute approval
      #   If your account requires approvals for transfers and the transfer was approved, this will contain details of the approval.
      #
      #   @return [Increase::Models::AccountTransfer::Approval, nil]
      required :approval, -> { Increase::Models::AccountTransfer::Approval }

      # @!attribute cancellation
      #   If your account requires approvals for transfers and the transfer was not approved, this will contain details of the cancellation.
      #
      #   @return [Increase::Models::AccountTransfer::Cancellation, nil]
      required :cancellation, -> { Increase::Models::AccountTransfer::Cancellation }

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which the transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute created_by
      #   What object created the transfer, either via the API or the dashboard.
      #
      #   @return [Increase::Models::AccountTransfer::CreatedBy, nil]
      required :created_by, -> { Increase::Models::AccountTransfer::CreatedBy }

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination account currency.
      #
      #   @return [Symbol, Increase::Models::AccountTransfer::Currency]
      required :currency, enum: -> { Increase::Models::AccountTransfer::Currency }

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
      required :destination_transaction_id, String

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across Increase and is used to ensure that a request is only processed once. Learn more about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String

      # @!attribute network
      #   The transfer's network.
      #
      #   @return [Symbol, Increase::Models::AccountTransfer::Network]
      required :network, enum: -> { Increase::Models::AccountTransfer::Network }

      # @!attribute pending_transaction_id
      #   The ID for the pending transaction representing the transfer. A pending transaction is created when the transfer [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals) by someone else in your organization.
      #
      #   @return [String, nil]
      required :pending_transaction_id, String

      # @!attribute status
      #   The lifecycle status of the transfer.
      #
      #   @return [Symbol, Increase::Models::AccountTransfer::Status]
      required :status, enum: -> { Increase::Models::AccountTransfer::Status }

      # @!attribute transaction_id
      #   The ID for the transaction funding the transfer.
      #
      #   @return [String, nil]
      required :transaction_id, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be `account_transfer`.
      #
      #   @return [Symbol, Increase::Models::AccountTransfer::Type]
      required :type, enum: -> { Increase::Models::AccountTransfer::Type }

      # @!parse
      #   # Account transfers move funds between your own accounts at Increase.
      #   #
      #   # @param id [String] The account transfer's identifier.
      #   #
      #   # @param account_id [String] The Account to which the transfer belongs.
      #   #
      #   # @param amount [Integer] The transfer amount in the minor unit of the destination account currency. For
      #   #   dollars, for example, this is cents.
      #   #
      #   # @param approval [Increase::Models::AccountTransfer::Approval, nil] If your account requires approvals for transfers and the transfer was approved,
      #   #   this will contain details of the approval.
      #   #
      #   # @param cancellation [Increase::Models::AccountTransfer::Cancellation, nil] If your account requires approvals for transfers and the transfer was not
      #   #   approved, this will contain details of the cancellation.
      #   #
      #   # @param created_at [String] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   #   the transfer was created.
      #   #
      #   # @param created_by [Increase::Models::AccountTransfer::CreatedBy, nil] What object created the transfer, either via the API or the dashboard.
      #   #
      #   # @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
      #   #   account currency.
      #   #
      #   # @param description [String] The description that will show on the transactions.
      #   #
      #   # @param destination_account_id [String] The destination account's identifier.
      #   #
      #   # @param destination_transaction_id [String, nil] The ID for the transaction receiving the transfer.
      #   #
      #   # @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across
      #   #   Increase and is used to ensure that a request is only processed once. Learn more
      #   #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #   #
      #   # @param network [String] The transfer's network.
      #   #
      #   # @param pending_transaction_id [String, nil] The ID for the pending transaction representing the transfer. A pending
      #   #   transaction is created when the transfer
      #   #   [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      #   #   by someone else in your organization.
      #   #
      #   # @param status [String] The lifecycle status of the transfer.
      #   #
      #   # @param transaction_id [String, nil] The ID for the transaction funding the transfer.
      #   #
      #   # @param type [String] A constant representing the object's type. For this resource it will always be
      #   #   `account_transfer`.
      #   #
      #   def initialize(
      #     id:,
      #     account_id:,
      #     amount:,
      #     approval:,
      #     cancellation:,
      #     created_at:,
      #     created_by:,
      #     currency:,
      #     description:,
      #     destination_account_id:,
      #     destination_transaction_id:,
      #     idempotency_key:,
      #     network:,
      #     pending_transaction_id:,
      #     status:,
      #     transaction_id:,
      #     type:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::BaseModel) -> void

      # @example
      #
      # ```ruby
      # approval => {
      #   approved_at: Time,
      #   approved_by: String
      # }
      # ```
      class Approval < Increase::BaseModel
        # @!attribute approved_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which the transfer was approved.
        #
        #   @return [Time]
        required :approved_at, Time

        # @!attribute approved_by
        #   If the Transfer was approved by a user in the dashboard, the email address of that user.
        #
        #   @return [String, nil]
        required :approved_by, String

        # @!parse
        #   # If your account requires approvals for transfers and the transfer was approved,
        #   #   this will contain details of the approval.
        #   #
        #   # @param approved_at [String] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   #   the transfer was approved.
        #   #
        #   # @param approved_by [String, nil] If the Transfer was approved by a user in the dashboard, the email address of
        #   #   that user.
        #   #
        #   def initialize(approved_at:, approved_by:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void
      end

      # @example
      #
      # ```ruby
      # cancellation => {
      #   canceled_at: Time,
      #   canceled_by: String
      # }
      # ```
      class Cancellation < Increase::BaseModel
        # @!attribute canceled_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which the Transfer was canceled.
        #
        #   @return [Time]
        required :canceled_at, Time

        # @!attribute canceled_by
        #   If the Transfer was canceled by a user in the dashboard, the email address of that user.
        #
        #   @return [String, nil]
        required :canceled_by, String

        # @!parse
        #   # If your account requires approvals for transfers and the transfer was not
        #   #   approved, this will contain details of the cancellation.
        #   #
        #   # @param canceled_at [String] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   #   the Transfer was canceled.
        #   #
        #   # @param canceled_by [String, nil] If the Transfer was canceled by a user in the dashboard, the email address of
        #   #   that user.
        #   #
        #   def initialize(canceled_at:, canceled_by:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void
      end

      # @example
      #
      # ```ruby
      # created_by => {
      #   api_key: Increase::Models::AccountTransfer::CreatedBy::APIKey,
      #   category: enum: Increase::Models::AccountTransfer::CreatedBy::Category,
      #   oauth_application: Increase::Models::AccountTransfer::CreatedBy::OAuthApplication,
      #   user: Increase::Models::AccountTransfer::CreatedBy::User
      # }
      # ```
      class CreatedBy < Increase::BaseModel
        # @!attribute api_key
        #   If present, details about the API key that created the transfer.
        #
        #   @return [Increase::Models::AccountTransfer::CreatedBy::APIKey, nil]
        required :api_key, -> { Increase::Models::AccountTransfer::CreatedBy::APIKey }

        # @!attribute category
        #   The type of object that created this transfer.
        #
        #   @return [Symbol, Increase::Models::AccountTransfer::CreatedBy::Category]
        required :category, enum: -> { Increase::Models::AccountTransfer::CreatedBy::Category }

        # @!attribute oauth_application
        #   If present, details about the OAuth Application that created the transfer.
        #
        #   @return [Increase::Models::AccountTransfer::CreatedBy::OAuthApplication, nil]
        required :oauth_application, -> { Increase::Models::AccountTransfer::CreatedBy::OAuthApplication }

        # @!attribute user
        #   If present, details about the User that created the transfer.
        #
        #   @return [Increase::Models::AccountTransfer::CreatedBy::User, nil]
        required :user, -> { Increase::Models::AccountTransfer::CreatedBy::User }

        # @!parse
        #   # What object created the transfer, either via the API or the dashboard.
        #   #
        #   # @param api_key [Increase::Models::AccountTransfer::CreatedBy::APIKey, nil] If present, details about the API key that created the transfer.
        #   #
        #   # @param category [String] The type of object that created this transfer.
        #   #
        #   # @param oauth_application [Increase::Models::AccountTransfer::CreatedBy::OAuthApplication, nil] If present, details about the OAuth Application that created the transfer.
        #   #
        #   # @param user [Increase::Models::AccountTransfer::CreatedBy::User, nil] If present, details about the User that created the transfer.
        #   #
        #   def initialize(api_key:, category:, oauth_application:, user:, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void

        # @example
        #
        # ```ruby
        # api_key => {
        #   description: String
        # }
        # ```
        class APIKey < Increase::BaseModel
          # @!attribute description
          #   The description set for the API key when it was created.
          #
          #   @return [String, nil]
          required :description, String

          # @!parse
          #   # If present, details about the API key that created the transfer.
          #   #
          #   # @param description [String, nil] The description set for the API key when it was created.
          #   #
          #   def initialize(description:, **) = super

          # def initialize: (Hash | Increase::BaseModel) -> void
        end

        # The type of object that created this transfer.
        #
        # @example
        #
        # ```ruby
        # case category
        # in :api_key
        #   # ...
        # in :oauth_application
        #   # ...
        # in :user
        #   # ...
        # end
        # ```
        class Category < Increase::Enum
          # An API key. Details will be under the `api_key` object.
          API_KEY = :api_key

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION = :oauth_application

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER = :user

          finalize!
        end

        # @example
        #
        # ```ruby
        # oauth_application => {
        #   name: String
        # }
        # ```
        class OAuthApplication < Increase::BaseModel
          # @!attribute name
          #   The name of the OAuth Application.
          #
          #   @return [String]
          required :name, String

          # @!parse
          #   # If present, details about the OAuth Application that created the transfer.
          #   #
          #   # @param name [String] The name of the OAuth Application.
          #   #
          #   def initialize(name:, **) = super

          # def initialize: (Hash | Increase::BaseModel) -> void
        end

        # @example
        #
        # ```ruby
        # user => {
        #   email: String
        # }
        # ```
        class User < Increase::BaseModel
          # @!attribute email
          #   The email address of the User.
          #
          #   @return [String]
          required :email, String

          # @!parse
          #   # If present, details about the User that created the transfer.
          #   #
          #   # @param email [String] The email address of the User.
          #   #
          #   def initialize(email:, **) = super

          # def initialize: (Hash | Increase::BaseModel) -> void
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination account currency.
      #
      # @example
      #
      # ```ruby
      # case currency
      # in :CAD
      #   # ...
      # in :CHF
      #   # ...
      # in :EUR
      #   # ...
      # in :GBP
      #   # ...
      # in :JPY
      #   # ...
      # in ...
      #   #...
      # end
      # ```
      class Currency < Increase::Enum
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

        finalize!
      end

      # The transfer's network.
      #
      # @example
      #
      # ```ruby
      # case network
      # in :account
      #   # ...
      # end
      # ```
      class Network < Increase::Enum
        ACCOUNT = :account

        finalize!
      end

      # The lifecycle status of the transfer.
      #
      # @example
      #
      # ```ruby
      # case status
      # in :pending_approval
      #   # ...
      # in :canceled
      #   # ...
      # in :complete
      #   # ...
      # end
      # ```
      class Status < Increase::Enum
        # The transfer is pending approval.
        PENDING_APPROVAL = :pending_approval

        # The transfer has been canceled.
        CANCELED = :canceled

        # The transfer has been completed.
        COMPLETE = :complete

        finalize!
      end

      # A constant representing the object's type. For this resource it will always be `account_transfer`.
      #
      # @example
      #
      # ```ruby
      # case type
      # in :account_transfer
      #   # ...
      # end
      # ```
      class Type < Increase::Enum
        ACCOUNT_TRANSFER = :account_transfer

        finalize!
      end
    end
  end
end
