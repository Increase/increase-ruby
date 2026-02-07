# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::SwiftTransfers#create
    class SwiftTransfer < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Swift transfer's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The Account to which the transfer belongs.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute account_number
      #   The creditor's account number.
      #
      #   @return [String]
      required :account_number, String

      # @!attribute amount
      #   The transfer amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute bank_identification_code
      #   The bank identification code (BIC) of the creditor.
      #
      #   @return [String]
      required :bank_identification_code, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute created_by
      #   What object created the transfer, either via the API or the dashboard.
      #
      #   @return [Increase::Models::SwiftTransfer::CreatedBy]
      required :created_by, -> { Increase::SwiftTransfer::CreatedBy }

      # @!attribute creditor_address
      #   The creditor's address.
      #
      #   @return [Increase::Models::SwiftTransfer::CreditorAddress]
      required :creditor_address, -> { Increase::SwiftTransfer::CreditorAddress }

      # @!attribute creditor_name
      #   The creditor's name.
      #
      #   @return [String]
      required :creditor_name, String

      # @!attribute debtor_address
      #   The debtor's address.
      #
      #   @return [Increase::Models::SwiftTransfer::DebtorAddress]
      required :debtor_address, -> { Increase::SwiftTransfer::DebtorAddress }

      # @!attribute debtor_name
      #   The debtor's name.
      #
      #   @return [String]
      required :debtor_name, String

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute instructed_amount
      #   The amount that was instructed to be transferred in minor units of the
      #   `instructed_currency`.
      #
      #   @return [Integer]
      required :instructed_amount, Integer

      # @!attribute instructed_currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the
      #   instructed amount.
      #
      #   @return [Symbol, Increase::Models::SwiftTransfer::InstructedCurrency]
      required :instructed_currency, enum: -> { Increase::SwiftTransfer::InstructedCurrency }

      # @!attribute pending_transaction_id
      #   The ID for the pending transaction representing the transfer.
      #
      #   @return [String, nil]
      required :pending_transaction_id, String, nil?: true

      # @!attribute routing_number
      #   The creditor's bank account routing or transit number. Required in certain
      #   countries.
      #
      #   @return [String, nil]
      required :routing_number, String, nil?: true

      # @!attribute source_account_number_id
      #   The Account Number included in the transfer as the debtor's account number.
      #
      #   @return [String]
      required :source_account_number_id, String

      # @!attribute status
      #   The lifecycle status of the transfer.
      #
      #   @return [Symbol, Increase::Models::SwiftTransfer::Status]
      required :status, enum: -> { Increase::SwiftTransfer::Status }

      # @!attribute transaction_id
      #   The ID for the transaction funding the transfer. This will be populated after
      #   the transfer is initiated.
      #
      #   @return [String, nil]
      required :transaction_id, String, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `swift_transfer`.
      #
      #   @return [Symbol, Increase::Models::SwiftTransfer::Type]
      required :type, enum: -> { Increase::SwiftTransfer::Type }

      # @!attribute unique_end_to_end_transaction_reference
      #   The Unique End-to-end Transaction Reference
      #   ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
      #   for the transfer.
      #
      #   @return [String]
      required :unique_end_to_end_transaction_reference, String

      # @!attribute unstructured_remittance_information
      #   The unstructured remittance information that was included with the transfer.
      #
      #   @return [String]
      required :unstructured_remittance_information, String

      # @!method initialize(id:, account_id:, account_number:, amount:, bank_identification_code:, created_at:, created_by:, creditor_address:, creditor_name:, debtor_address:, debtor_name:, idempotency_key:, instructed_amount:, instructed_currency:, pending_transaction_id:, routing_number:, source_account_number_id:, status:, transaction_id:, type:, unique_end_to_end_transaction_reference:, unstructured_remittance_information:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::SwiftTransfer} for more details.
      #
      #   Swift Transfers send funds internationally.
      #
      #   @param id [String] The Swift transfer's identifier.
      #
      #   @param account_id [String] The Account to which the transfer belongs.
      #
      #   @param account_number [String] The creditor's account number.
      #
      #   @param amount [Integer] The transfer amount in USD cents.
      #
      #   @param bank_identification_code [String] The bank identification code (BIC) of the creditor.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param created_by [Increase::Models::SwiftTransfer::CreatedBy] What object created the transfer, either via the API or the dashboard.
      #
      #   @param creditor_address [Increase::Models::SwiftTransfer::CreditorAddress] The creditor's address.
      #
      #   @param creditor_name [String] The creditor's name.
      #
      #   @param debtor_address [Increase::Models::SwiftTransfer::DebtorAddress] The debtor's address.
      #
      #   @param debtor_name [String] The debtor's name.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param instructed_amount [Integer] The amount that was instructed to be transferred in minor units of the `instruct
      #
      #   @param instructed_currency [Symbol, Increase::Models::SwiftTransfer::InstructedCurrency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the inst
      #
      #   @param pending_transaction_id [String, nil] The ID for the pending transaction representing the transfer.
      #
      #   @param routing_number [String, nil] The creditor's bank account routing or transit number. Required in certain count
      #
      #   @param source_account_number_id [String] The Account Number included in the transfer as the debtor's account number.
      #
      #   @param status [Symbol, Increase::Models::SwiftTransfer::Status] The lifecycle status of the transfer.
      #
      #   @param transaction_id [String, nil] The ID for the transaction funding the transfer. This will be populated after th
      #
      #   @param type [Symbol, Increase::Models::SwiftTransfer::Type] A constant representing the object's type. For this resource it will always be `
      #
      #   @param unique_end_to_end_transaction_reference [String] The Unique End-to-end Transaction Reference ([UETR](https://www.swift.com/paymen
      #
      #   @param unstructured_remittance_information [String] The unstructured remittance information that was included with the transfer.

      # @see Increase::Models::SwiftTransfer#created_by
      class CreatedBy < Increase::Internal::Type::BaseModel
        # @!attribute category
        #   The type of object that created this transfer.
        #
        #   @return [Symbol, Increase::Models::SwiftTransfer::CreatedBy::Category]
        required :category, enum: -> { Increase::SwiftTransfer::CreatedBy::Category }

        # @!attribute api_key
        #   If present, details about the API key that created the transfer.
        #
        #   @return [Increase::Models::SwiftTransfer::CreatedBy::APIKey, nil]
        optional :api_key, -> { Increase::SwiftTransfer::CreatedBy::APIKey }, nil?: true

        # @!attribute oauth_application
        #   If present, details about the OAuth Application that created the transfer.
        #
        #   @return [Increase::Models::SwiftTransfer::CreatedBy::OAuthApplication, nil]
        optional :oauth_application, -> { Increase::SwiftTransfer::CreatedBy::OAuthApplication }, nil?: true

        # @!attribute user
        #   If present, details about the User that created the transfer.
        #
        #   @return [Increase::Models::SwiftTransfer::CreatedBy::User, nil]
        optional :user, -> { Increase::SwiftTransfer::CreatedBy::User }, nil?: true

        # @!method initialize(category:, api_key: nil, oauth_application: nil, user: nil)
        #   What object created the transfer, either via the API or the dashboard.
        #
        #   @param category [Symbol, Increase::Models::SwiftTransfer::CreatedBy::Category] The type of object that created this transfer.
        #
        #   @param api_key [Increase::Models::SwiftTransfer::CreatedBy::APIKey, nil] If present, details about the API key that created the transfer.
        #
        #   @param oauth_application [Increase::Models::SwiftTransfer::CreatedBy::OAuthApplication, nil] If present, details about the OAuth Application that created the transfer.
        #
        #   @param user [Increase::Models::SwiftTransfer::CreatedBy::User, nil] If present, details about the User that created the transfer.

        # The type of object that created this transfer.
        #
        # @see Increase::Models::SwiftTransfer::CreatedBy#category
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

        # @see Increase::Models::SwiftTransfer::CreatedBy#api_key
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

        # @see Increase::Models::SwiftTransfer::CreatedBy#oauth_application
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

        # @see Increase::Models::SwiftTransfer::CreatedBy#user
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

      # @see Increase::Models::SwiftTransfer#creditor_address
      class CreditorAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city, district, town, or village of the address.
        #
        #   @return [String, nil]
        required :city, String, nil?: true

        # @!attribute country
        #   The two-letter
        #   [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
        #   the country of the address.
        #
        #   @return [String]
        required :country, String

        # @!attribute line1
        #   The first line of the address.
        #
        #   @return [String]
        required :line1, String

        # @!attribute line2
        #   The second line of the address.
        #
        #   @return [String, nil]
        required :line2, String, nil?: true

        # @!attribute postal_code
        #   The ZIP or postal code of the address.
        #
        #   @return [String, nil]
        required :postal_code, String, nil?: true

        # @!attribute state
        #   The state, province, or region of the address. Required in certain countries.
        #
        #   @return [String, nil]
        required :state, String, nil?: true

        # @!method initialize(city:, country:, line1:, line2:, postal_code:, state:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::SwiftTransfer::CreditorAddress} for more details.
        #
        #   The creditor's address.
        #
        #   @param city [String, nil] The city, district, town, or village of the address.
        #
        #   @param country [String] The two-letter [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alp
        #
        #   @param line1 [String] The first line of the address.
        #
        #   @param line2 [String, nil] The second line of the address.
        #
        #   @param postal_code [String, nil] The ZIP or postal code of the address.
        #
        #   @param state [String, nil] The state, province, or region of the address. Required in certain countries.
      end

      # @see Increase::Models::SwiftTransfer#debtor_address
      class DebtorAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city, district, town, or village of the address.
        #
        #   @return [String, nil]
        required :city, String, nil?: true

        # @!attribute country
        #   The two-letter
        #   [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
        #   the country of the address.
        #
        #   @return [String]
        required :country, String

        # @!attribute line1
        #   The first line of the address.
        #
        #   @return [String]
        required :line1, String

        # @!attribute line2
        #   The second line of the address.
        #
        #   @return [String, nil]
        required :line2, String, nil?: true

        # @!attribute postal_code
        #   The ZIP or postal code of the address.
        #
        #   @return [String, nil]
        required :postal_code, String, nil?: true

        # @!attribute state
        #   The state, province, or region of the address. Required in certain countries.
        #
        #   @return [String, nil]
        required :state, String, nil?: true

        # @!method initialize(city:, country:, line1:, line2:, postal_code:, state:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::SwiftTransfer::DebtorAddress} for more details.
        #
        #   The debtor's address.
        #
        #   @param city [String, nil] The city, district, town, or village of the address.
        #
        #   @param country [String] The two-letter [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alp
        #
        #   @param line1 [String] The first line of the address.
        #
        #   @param line2 [String, nil] The second line of the address.
        #
        #   @param postal_code [String, nil] The ZIP or postal code of the address.
        #
        #   @param state [String, nil] The state, province, or region of the address. Required in certain countries.
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the
      # instructed amount.
      #
      # @see Increase::Models::SwiftTransfer#instructed_currency
      module InstructedCurrency
        extend Increase::Internal::Type::Enum

        # United States Dollar
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The lifecycle status of the transfer.
      #
      # @see Increase::Models::SwiftTransfer#status
      module Status
        extend Increase::Internal::Type::Enum

        # The transfer is pending approval.
        PENDING_APPROVAL = :pending_approval

        # The transfer has been canceled.
        CANCELED = :canceled

        # The transfer is pending review by Increase.
        PENDING_REVIEWING = :pending_reviewing

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION = :requires_attention

        # The transfer is pending initiation.
        PENDING_INITIATING = :pending_initiating

        # The transfer has been initiated.
        INITIATED = :initiated

        # The transfer has been rejected by Increase.
        REJECTED = :rejected

        # The transfer has been returned.
        RETURNED = :returned

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `swift_transfer`.
      #
      # @see Increase::Models::SwiftTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        SWIFT_TRANSFER = :swift_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
