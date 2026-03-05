# typed: strong

module Increase
  module Models
    class BookkeepingEntryRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::BookkeepingEntryRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Bookkeeping Entry.
      sig { returns(String) }
      attr_accessor :bookkeeping_entry_id

      sig do
        params(
          bookkeeping_entry_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Bookkeeping Entry.
        bookkeeping_entry_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            bookkeeping_entry_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
