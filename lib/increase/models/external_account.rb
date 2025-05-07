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
      #   @return [Symbol, Increase::ExternalAccount::AccountHolder]
      required :account_holder, enum: -> { Increase::ExternalAccount::AccountHolder }

      # @!attribute account_number
      #   The destination account number.
      #
      #   @return [String]
      required :account_number, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the External Account was created.
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
      #   @return [Symbol, Increase::ExternalAccount::Funding]
      required :funding, enum: -> { Increase::ExternalAccount::Funding }

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
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
      #   @return [Symbol, Increase::ExternalAccount::Status]
      required :status, enum: -> { Increase::ExternalAccount::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `external_account`.
      #
      #   @return [Symbol, Increase::ExternalAccount::Type]
      required :type, enum: -> { Increase::ExternalAccount::Type }

      # @!attribute verification_status
      #   If you have verified ownership of the External Account.
      #
      #   @return [Symbol, Increase::ExternalAccount::VerificationStatus]
      required :verification_status, enum: -> { Increase::ExternalAccount::VerificationStatus }

      # @!method initialize(id:, account_holder:, account_number:, created_at:, description:, funding:, idempotency_key:, routing_number:, status:, type:, verification_status:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::ExternalAccount} for more details.
      #
      #   External Accounts represent accounts at financial institutions other than
      #   Increase. You can use this API to store their details for reuse.
      #
      #   @param id [String] The External Account's identifier.
      #
      #   @param account_holder [Symbol, Increase::ExternalAccount::AccountHolder] The type of entity that owns the External Account.
      #
      #   @param account_number [String] The destination account number.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param description [String] The External Account's description for display purposes.
      #
      #   @param funding [Symbol, Increase::ExternalAccount::Funding] The type of the account to which the transfer will be sent.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @param status [Symbol, Increase::ExternalAccount::Status] The External Account's status.
      #
      #   @param type [Symbol, Increase::ExternalAccount::Type] A constant representing the object's type. For this resource it will always be `
      #
      #   @param verification_status [Symbol, Increase::ExternalAccount::VerificationStatus] If you have verified ownership of the External Account.

      # The type of entity that owns the External Account.
      #
      # @see Increase::ExternalAccount#account_holder
      module AccountHolder
        extend Increase::Internal::Type::Enum

        # The External Account is owned by a business.
        BUSINESS = :business

        # The External Account is owned by an individual.
        INDIVIDUAL = :individual

        # It's unknown what kind of entity owns the External Account.
        UNKNOWN = :unknown

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The type of the account to which the transfer will be sent.
      #
      # @see Increase::ExternalAccount#funding
      module Funding
        extend Increase::Internal::Type::Enum

        # A checking account.
        CHECKING = :checking

        # A savings account.
        SAVINGS = :savings

        # A different type of account.
        OTHER = :other

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The External Account's status.
      #
      # @see Increase::ExternalAccount#status
      module Status
        extend Increase::Internal::Type::Enum

        # The External Account is active.
        ACTIVE = :active

        # The External Account is archived and won't appear in the dashboard.
        ARCHIVED = :archived

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `external_account`.
      #
      # @see Increase::ExternalAccount#type
      module Type
        extend Increase::Internal::Type::Enum

        EXTERNAL_ACCOUNT = :external_account

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # If you have verified ownership of the External Account.
      #
      # @see Increase::ExternalAccount#verification_status
      module VerificationStatus
        extend Increase::Internal::Type::Enum

        # The External Account has not been verified.
        UNVERIFIED = :unverified

        # The External Account is in the process of being verified.
        PENDING = :pending

        # The External Account is verified.
        VERIFIED = :verified

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
