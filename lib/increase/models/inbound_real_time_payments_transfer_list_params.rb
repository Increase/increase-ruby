# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundRealTimePaymentsTransfers#list
    class InboundRealTimePaymentsTransferListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   Filter Inbound Real-Time Payments Transfers to those belonging to the specified
      #   Account.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute account_number_id
      #   Filter Inbound Real-Time Payments Transfers to ones belonging to the specified
      #   Account Number.
      #
      #   @return [String, nil]
      optional :account_number_id, String

      # @!attribute created_at
      #
      #   @return [Increase::InboundRealTimePaymentsTransferListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::InboundRealTimePaymentsTransferListParams::CreatedAt }

      # @!attribute cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(account_id: nil, account_number_id: nil, created_at: nil, cursor: nil, limit: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::InboundRealTimePaymentsTransferListParams} for more details.
      #
      #   @param account_id [String] Filter Inbound Real-Time Payments Transfers to those belonging to the specified
      #
      #   @param account_number_id [String] Filter Inbound Real-Time Payments Transfers to ones belonging to the specified A
      #
      #   @param created_at [Increase::InboundRealTimePaymentsTransferListParams::CreatedAt]
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class CreatedAt < Increase::Internal::Type::BaseModel
        # @!attribute after
        #   Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        #
        #   @return [Time, nil]
        optional :after, Time

        # @!attribute before
        #   Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        #
        #   @return [Time, nil]
        optional :before, Time

        # @!attribute on_or_after
        #   Return results on or after this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        #
        #   @return [Time, nil]
        optional :on_or_after, Time

        # @!attribute on_or_before
        #   Return results on or before this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        #
        #   @return [Time, nil]
        optional :on_or_before, Time

        # @!method initialize(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::InboundRealTimePaymentsTransferListParams::CreatedAt} for more
        #   details.
        #
        #   @param after [Time] Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) tim
        #
        #   @param before [Time] Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) ti
        #
        #   @param on_or_after [Time] Return results on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_860
        #
        #   @param on_or_before [Time] Return results on or before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_86
      end
    end
  end
end
