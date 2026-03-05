# typed: strong

module Increase
  module Models
    class BookkeepingEntrySetRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::BookkeepingEntrySetRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Bookkeeping Entry Set.
      sig { returns(String) }
      attr_accessor :bookkeeping_entry_set_id

      sig do
        params(
          bookkeeping_entry_set_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Bookkeeping Entry Set.
        bookkeeping_entry_set_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            bookkeeping_entry_set_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
