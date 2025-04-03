# typed: strong

module Increase
  module Models
    class BookkeepingEntryListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The identifier for the Bookkeeping Account to filter by.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          account_id: String,
          cursor: String,
          limit: Integer,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(account_id: nil, cursor: nil, limit: nil, request_options: {})
      end

      sig do
        override
          .returns({
                     account_id: String,
                     cursor: String,
                     limit: Integer,
                     request_options: Increase::RequestOptions
                   })
      end
      def to_hash
      end
    end
  end
end
