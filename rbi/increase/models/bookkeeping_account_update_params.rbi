# typed: strong

module Increase
  module Models
    class BookkeepingAccountUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::BookkeepingAccountUpdateParams,
            Increase::Internal::AnyHash
          )
        end

      # The bookkeeping account you would like to update.
      sig { returns(String) }
      attr_accessor :bookkeeping_account_id

      # The name you choose for the account.
      sig { returns(String) }
      attr_accessor :name

      sig do
        params(
          bookkeeping_account_id: String,
          name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The bookkeeping account you would like to update.
        bookkeeping_account_id:,
        # The name you choose for the account.
        name:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            bookkeeping_account_id: String,
            name: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
