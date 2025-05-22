# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DigitalWalletTokens#list
    class DigitalWalletTokenListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_id
      #   Filter Digital Wallet Tokens to ones belonging to the specified Card.
      #
      #   @return [String, nil]
      optional :card_id, String

      # @!attribute created_at
      #
      #   @return [Increase::Models::DigitalWalletTokenListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::DigitalWalletTokenListParams::CreatedAt }

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

      # @!method initialize(card_id: nil, created_at: nil, cursor: nil, limit: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::DigitalWalletTokenListParams} for more details.
      #
      #   @param card_id [String] Filter Digital Wallet Tokens to ones belonging to the specified Card.
      #
      #   @param created_at [Increase::Models::DigitalWalletTokenListParams::CreatedAt]
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
        #   {Increase::Models::DigitalWalletTokenListParams::CreatedAt} for more details.
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
