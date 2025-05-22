# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundACHTransfers#list
    class InboundACHTransferListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   Filter Inbound ACH Transfers to ones belonging to the specified Account.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute account_number_id
      #   Filter Inbound ACH Transfers to ones belonging to the specified Account Number.
      #
      #   @return [String, nil]
      optional :account_number_id, String

      # @!attribute created_at
      #
      #   @return [Increase::Models::InboundACHTransferListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::InboundACHTransferListParams::CreatedAt }

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
      #   @return [Increase::Models::InboundACHTransferListParams::Status, nil]
      optional :status, -> { Increase::InboundACHTransferListParams::Status }

      # @!method initialize(account_id: nil, account_number_id: nil, created_at: nil, cursor: nil, limit: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::InboundACHTransferListParams} for more details.
      #
      #   @param account_id [String] Filter Inbound ACH Transfers to ones belonging to the specified Account.
      #
      #   @param account_number_id [String] Filter Inbound ACH Transfers to ones belonging to the specified Account Number.
      #
      #   @param created_at [Increase::Models::InboundACHTransferListParams::CreatedAt]
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param status [Increase::Models::InboundACHTransferListParams::Status]
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
        #   {Increase::Models::InboundACHTransferListParams::CreatedAt} for more details.
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
        #   Filter Inbound ACH Transfers to those with the specified status. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::InboundACHTransferListParams::Status::In>, nil]
        optional :in_,
                 -> {
                   Increase::Internal::Type::ArrayOf[enum: Increase::InboundACHTransferListParams::Status::In]
                 },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::InboundACHTransferListParams::Status} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::Models::InboundACHTransferListParams::Status::In>] Filter Inbound ACH Transfers to those with the specified status. For GET request

        module In
          extend Increase::Internal::Type::Enum

          # The Inbound ACH Transfer is awaiting action, will transition automatically if no action is taken.
          PENDING = :pending

          # The Inbound ACH Transfer has been declined.
          DECLINED = :declined

          # The Inbound ACH Transfer is accepted.
          ACCEPTED = :accepted

          # The Inbound ACH Transfer has been returned.
          RETURNED = :returned

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
