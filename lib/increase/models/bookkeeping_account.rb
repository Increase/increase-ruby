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
      #   @return [Symbol, Increase::Models::BookkeepingAccount::ComplianceCategory, nil]
      required :compliance_category,
               enum: -> { Increase::Models::BookkeepingAccount::ComplianceCategory },
               nil?: true

      # @!attribute entity_id
      #   The Entity associated with this bookkeeping account.
      #
      #   @return [String, nil]
      required :entity_id, String, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
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
      #     `bookkeeping_account`.
      #
      #   @return [Symbol, Increase::Models::BookkeepingAccount::Type]
      required :type, enum: -> { Increase::Models::BookkeepingAccount::Type }

      # @!parse
      #   # Accounts are T-accounts. They can store accounting entries. Your compliance
      #   #   setup might require annotating money movements using this API. Learn more in our
      #   #   [guide to Bookkeeping](https://increase.com/documentation/bookkeeping#bookkeeping).
      #   #
      #   # @param id [String]
      #   # @param account_id [String, nil]
      #   # @param compliance_category [Symbol, Increase::Models::BookkeepingAccount::ComplianceCategory, nil]
      #   # @param entity_id [String, nil]
      #   # @param idempotency_key [String, nil]
      #   # @param name [String]
      #   # @param type [Symbol, Increase::Models::BookkeepingAccount::Type]
      #   #
      #   def initialize(id:, account_id:, compliance_category:, entity_id:, idempotency_key:, name:, type:, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # The compliance category of the account.
      #
      # @see Increase::Models::BookkeepingAccount#compliance_category
      module ComplianceCategory
        extend Increase::Internal::Type::Enum

        # A cash in an commingled Increase Account.
        COMMINGLED_CASH = :commingled_cash

        # A customer balance.
        CUSTOMER_BALANCE = :customer_balance

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `bookkeeping_account`.
      #
      # @see Increase::Models::BookkeepingAccount#type
      module Type
        extend Increase::Internal::Type::Enum

        BOOKKEEPING_ACCOUNT = :bookkeeping_account

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
