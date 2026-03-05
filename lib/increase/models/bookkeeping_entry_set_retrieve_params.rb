# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BookkeepingEntrySets#retrieve
    class BookkeepingEntrySetRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute bookkeeping_entry_set_id
      #   The identifier of the Bookkeeping Entry Set.
      #
      #   @return [String]
      required :bookkeeping_entry_set_id, String

      # @!method initialize(bookkeeping_entry_set_id:, request_options: {})
      #   @param bookkeeping_entry_set_id [String] The identifier of the Bookkeeping Entry Set.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
