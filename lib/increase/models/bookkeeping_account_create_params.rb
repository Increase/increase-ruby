# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BookkeepingAccounts#create
    class BookkeepingAccountCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute name
      #   The name you choose for the account.
      #
      #   @return [String]
      required :name, String

      # @!attribute account_id
      #   The entity, if `compliance_category` is `commingled_cash`.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute compliance_category
      #   The account compliance category.
      #
      #   @return [Symbol, Increase::BookkeepingAccountCreateParams::ComplianceCategory, nil]
      optional :compliance_category, enum: -> { Increase::BookkeepingAccountCreateParams::ComplianceCategory }

      # @!attribute entity_id
      #   The entity, if `compliance_category` is `customer_balance`.
      #
      #   @return [String, nil]
      optional :entity_id, String

      # @!method initialize(name:, account_id: nil, compliance_category: nil, entity_id: nil, request_options: {})
      #   @param name [String] The name you choose for the account.
      #
      #   @param account_id [String] The entity, if `compliance_category` is `commingled_cash`.
      #
      #   @param compliance_category [Symbol, Increase::BookkeepingAccountCreateParams::ComplianceCategory] The account compliance category.
      #
      #   @param entity_id [String] The entity, if `compliance_category` is `customer_balance`.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The account compliance category.
      module ComplianceCategory
        extend Increase::Internal::Type::Enum

        # A cash in an commingled Increase Account.
        COMMINGLED_CASH = :commingled_cash

        # A customer balance.
        CUSTOMER_BALANCE = :customer_balance

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
