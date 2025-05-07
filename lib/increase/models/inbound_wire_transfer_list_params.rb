# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundWireTransfers#list
    class InboundWireTransferListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   Filter Inbound Wire Transfers to ones belonging to the specified Account.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute account_number_id
      #   Filter Inbound Wire Transfers to ones belonging to the specified Account Number.
      #
      #   @return [String, nil]
      optional :account_number_id, String

      # @!attribute created_at
      #
      #   @return [Increase::InboundWireTransferListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::InboundWireTransferListParams::CreatedAt }

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

      # @!attribute status
      #
      #   @return [Increase::InboundWireTransferListParams::Status, nil]
      optional :status, -> { Increase::InboundWireTransferListParams::Status }

      # @!method initialize(account_id: nil, account_number_id: nil, created_at: nil, cursor: nil, limit: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::InboundWireTransferListParams} for more details.
      #
      #   @param account_id [String] Filter Inbound Wire Transfers to ones belonging to the specified Account.
      #
      #   @param account_number_id [String] Filter Inbound Wire Transfers to ones belonging to the specified Account Number.
      #
      #   @param created_at [Increase::InboundWireTransferListParams::CreatedAt]
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param status [Increase::InboundWireTransferListParams::Status]
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
        #   {Increase::InboundWireTransferListParams::CreatedAt} for more details.
        #
        #   @param after [Time] Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) tim
        #
        #   @param before [Time] Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) ti
        #
        #   @param on_or_after [Time] Return results on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_860
        #
        #   @param on_or_before [Time] Return results on or before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_86
      end

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute in_
        #   Filter Inbound Wire Transfers to those with the specified status. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::InboundWireTransferListParams::Status::In>, nil]
        optional :in_,
                 -> {
                   Increase::Internal::Type::ArrayOf[enum: Increase::InboundWireTransferListParams::Status::In]
                 },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::InboundWireTransferListParams::Status} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::InboundWireTransferListParams::Status::In>] Filter Inbound Wire Transfers to those with the specified status. For GET reques

        module In
          extend Increase::Internal::Type::Enum

          # The Inbound Wire Transfer is awaiting action, will transition automatically if no action is taken.
          PENDING = :pending

          # The Inbound Wire Transfer is accepted.
          ACCEPTED = :accepted

          # The Inbound Wire Transfer was declined.
          DECLINED = :declined

          # The Inbound Wire Transfer was reversed.
          REVERSED = :reversed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
