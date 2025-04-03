# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ExternalAccounts#create
    class ExternalAccount < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The External Account's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_holder
      #   The type of entity that owns the External Account.
      #
      #   @return [Symbol, Increase::Models::ExternalAccount::AccountHolder]
      required :account_holder, enum: -> { Increase::Models::ExternalAccount::AccountHolder }

      # @!attribute account_number
      #   The destination account number.
      #
      #   @return [String]
      required :account_number, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the External Account was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute description
      #   The External Account's description for display purposes.
      #
      #   @return [String]
      required :description, String

      # @!attribute funding
      #   The type of the account to which the transfer will be sent.
      #
      #   @return [Symbol, Increase::Models::ExternalAccount::Funding]
      required :funding, enum: -> { Increase::Models::ExternalAccount::Funding }

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute routing_number
      #   The American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @return [String]
      required :routing_number, String

      # @!attribute status
      #   The External Account's status.
      #
      #   @return [Symbol, Increase::Models::ExternalAccount::Status]
      required :status, enum: -> { Increase::Models::ExternalAccount::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `external_account`.
      #
      #   @return [Symbol, Increase::Models::ExternalAccount::Type]
      required :type, enum: -> { Increase::Models::ExternalAccount::Type }

      # @!attribute verification_status
      #   If you have verified ownership of the External Account.
      #
      #   @return [Symbol, Increase::Models::ExternalAccount::VerificationStatus]
      required :verification_status, enum: -> { Increase::Models::ExternalAccount::VerificationStatus }

      # @!parse
      #   # External Accounts represent accounts at financial institutions other than
      #   #   Increase. You can use this API to store their details for reuse.
      #   #
      #   # @param id [String]
      #   # @param account_holder [Symbol, Increase::Models::ExternalAccount::AccountHolder]
      #   # @param account_number [String]
      #   # @param created_at [Time]
      #   # @param description [String]
      #   # @param funding [Symbol, Increase::Models::ExternalAccount::Funding]
      #   # @param idempotency_key [String, nil]
      #   # @param routing_number [String]
      #   # @param status [Symbol, Increase::Models::ExternalAccount::Status]
      #   # @param type [Symbol, Increase::Models::ExternalAccount::Type]
      #   # @param verification_status [Symbol, Increase::Models::ExternalAccount::VerificationStatus]
      #   #
      #   def initialize(
      #     id:,
      #     account_holder:,
      #     account_number:,
      #     created_at:,
      #     description:,
      #     funding:,
      #     idempotency_key:,
      #     routing_number:,
      #     status:,
      #     type:,
      #     verification_status:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # The type of entity that owns the External Account.
      #
      # @see Increase::Models::ExternalAccount#account_holder
      module AccountHolder
        extend Increase::Internal::Type::Enum

        # The External Account is owned by a business.
        BUSINESS = :business

        # The External Account is owned by an individual.
        INDIVIDUAL = :individual

        # It's unknown what kind of entity owns the External Account.
        UNKNOWN = :unknown

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # The type of the account to which the transfer will be sent.
      #
      # @see Increase::Models::ExternalAccount#funding
      module Funding
        extend Increase::Internal::Type::Enum

        # A checking account.
        CHECKING = :checking

        # A savings account.
        SAVINGS = :savings

        # A different type of account.
        OTHER = :other

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # The External Account's status.
      #
      # @see Increase::Models::ExternalAccount#status
      module Status
        extend Increase::Internal::Type::Enum

        # The External Account is active.
        ACTIVE = :active

        # The External Account is archived and won't appear in the dashboard.
        ARCHIVED = :archived

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `external_account`.
      #
      # @see Increase::Models::ExternalAccount#type
      module Type
        extend Increase::Internal::Type::Enum

        EXTERNAL_ACCOUNT = :external_account

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # If you have verified ownership of the External Account.
      #
      # @see Increase::Models::ExternalAccount#verification_status
      module VerificationStatus
        extend Increase::Internal::Type::Enum

        # The External Account has not been verified.
        UNVERIFIED = :unverified

        # The External Account is in the process of being verified.
        PENDING = :pending

        # The External Account is verified.
        VERIFIED = :verified

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
