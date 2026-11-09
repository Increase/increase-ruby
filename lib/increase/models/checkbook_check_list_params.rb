# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckbookChecks#list
    class CheckbookCheckListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_number_id
      #   Filter Checkbook Checks to those drawn on the specified Account Number.
      #
      #   @return [String, nil]
      optional :account_number_id, String

      # @!attribute check_number
      #   Filter Checkbook Checks to the one with the specified check number.
      #
      #   @return [Integer, nil]
      optional :check_number, Integer

      # @!attribute checkbook_id
      #   Filter Checkbook Checks to those belonging to the specified Checkbook.
      #
      #   @return [String, nil]
      optional :checkbook_id, String

      # @!attribute cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   Defaults to `100`.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(account_number_id: nil, check_number: nil, checkbook_id: nil, cursor: nil, limit: nil, request_options: {})
      #   @param account_number_id [String] Filter Checkbook Checks to those drawn on the specified Account Number.
      #
      #   @param check_number [Integer] Filter Checkbook Checks to the one with the specified check number.
      #
      #   @param checkbook_id [String] Filter Checkbook Checks to those belonging to the specified Checkbook.
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param limit [Integer]
      #     Limit the size of the list that is returned. The default (and maximum) is 100
      #     objects.
      #
      #     Defaults to `100`.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
