# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckDeposits#list
    class CheckDepositListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   Filter Check Deposits to those belonging to the specified Account.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute created_at
      #
      #   @return [Increase::Models::CheckDepositListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::CheckDepositListParams::CreatedAt }

      # @!attribute cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute idempotency_key
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(account_id: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CheckDepositListParams} for more details.
      #
      #   @param account_id [String] Filter Check Deposits to those belonging to the specified Account.
      #
      #   @param created_at [Increase::Models::CheckDepositListParams::CreatedAt]
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
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
        #   {Increase::Models::CheckDepositListParams::CreatedAt} for more details.
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
