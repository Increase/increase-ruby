# typed: strong

module Increase
  module Models
    class BookkeepingAccountCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The name you choose for the account.
      sig { returns(String) }
      attr_accessor :name

      # The entity, if `compliance_category` is `commingled_cash`.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      # The account compliance category.
      sig do
        returns(
          T.nilable(
            Increase::BookkeepingAccountCreateParams::ComplianceCategory::OrSymbol
          )
        )
      end
      attr_reader :compliance_category

      sig do
        params(
          compliance_category:
            Increase::BookkeepingAccountCreateParams::ComplianceCategory::OrSymbol
        ).void
      end
      attr_writer :compliance_category

      # The entity, if `compliance_category` is `customer_balance`.
      sig { returns(T.nilable(String)) }
      attr_reader :entity_id

      sig { params(entity_id: String).void }
      attr_writer :entity_id

      sig do
        params(
          name: String,
          account_id: String,
          compliance_category:
            Increase::BookkeepingAccountCreateParams::ComplianceCategory::OrSymbol,
          entity_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name you choose for the account.
        name:,
        # The entity, if `compliance_category` is `commingled_cash`.
        account_id: nil,
        # The account compliance category.
        compliance_category: nil,
        # The entity, if `compliance_category` is `customer_balance`.
        entity_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            account_id: String,
            compliance_category:
              Increase::BookkeepingAccountCreateParams::ComplianceCategory::OrSymbol,
            entity_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The account compliance category.
      module ComplianceCategory
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::BookkeepingAccountCreateParams::ComplianceCategory
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # A cash in an commingled Increase Account.
        COMMINGLED_CASH =
          T.let(
            :commingled_cash,
            Increase::BookkeepingAccountCreateParams::ComplianceCategory::TaggedSymbol
          )

        # A customer balance.
        CUSTOMER_BALANCE =
          T.let(
            :customer_balance,
            Increase::BookkeepingAccountCreateParams::ComplianceCategory::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::BookkeepingAccountCreateParams::ComplianceCategory::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
