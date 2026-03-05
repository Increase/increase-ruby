# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BookkeepingEntries#retrieve
    class BookkeepingEntryRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute bookkeeping_entry_id
      #   The identifier of the Bookkeeping Entry.
      #
      #   @return [String]
      required :bookkeeping_entry_id, String

      # @!method initialize(bookkeeping_entry_id:, request_options: {})
      #   @param bookkeeping_entry_id [String] The identifier of the Bookkeeping Entry.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
