# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BookkeepingAccounts#create
    class BookkeepingAccount < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The account identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The API Account associated with this bookkeeping account.
      #
      #   @return [String, nil]
      required :account_id, String, nil?: true

      # @!attribute compliance_category
      #   The compliance category of the account.
      #
      #   @return [Symbol, Increase::BookkeepingAccount::ComplianceCategory, nil]
      required :compliance_category, enum: -> { Increase::BookkeepingAccount::ComplianceCategory }, nil?: true

      # @!attribute entity_id
      #   The Entity associated with this bookkeeping account.
      #
      #   @return [String, nil]
      required :entity_id, String, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute name
      #   The name you choose for the account.
      #
      #   @return [String]
      required :name, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `bookkeeping_account`.
      #
      #   @return [Symbol, Increase::BookkeepingAccount::Type]
      required :type, enum: -> { Increase::BookkeepingAccount::Type }

      # @!method initialize(id:, account_id:, compliance_category:, entity_id:, idempotency_key:, name:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::BookkeepingAccount} for more details.
      #
      #   Accounts are T-accounts. They can store accounting entries. Your compliance
      #   setup might require annotating money movements using this API. Learn more in our
      #   [guide to Bookkeeping](https://increase.com/documentation/bookkeeping#bookkeeping).
      #
      #   @param id [String] The account identifier.
      #
      #   @param account_id [String, nil] The API Account associated with this bookkeeping account.
      #
      #   @param compliance_category [Symbol, Increase::BookkeepingAccount::ComplianceCategory, nil] The compliance category of the account.
      #
      #   @param entity_id [String, nil] The Entity associated with this bookkeeping account.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param name [String] The name you choose for the account.
      #
      #   @param type [Symbol, Increase::BookkeepingAccount::Type] A constant representing the object's type. For this resource it will always be `

      # The compliance category of the account.
      #
      # @see Increase::BookkeepingAccount#compliance_category
      module ComplianceCategory
        extend Increase::Internal::Type::Enum

        # A cash in an commingled Increase Account.
        COMMINGLED_CASH = :commingled_cash

        # A customer balance.
        CUSTOMER_BALANCE = :customer_balance

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `bookkeeping_account`.
      #
      # @see Increase::BookkeepingAccount#type
      module Type
        extend Increase::Internal::Type::Enum

        BOOKKEEPING_ACCOUNT = :bookkeeping_account

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
