# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundWireTransfers#list
    class InboundWireTransferListParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute [r] account_id
      #   Filter Inbound Wire Transfers to ones belonging to the specified Account.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :account_id

      # @!attribute [r] account_number_id
      #   Filter Inbound Wire Transfers to ones belonging to the specified Account Number.
      #
      #   @return [String, nil]
      optional :account_number_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :account_number_id

      # @!attribute [r] created_at
      #
      #   @return [Increase::Models::InboundWireTransferListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::Models::InboundWireTransferListParams::CreatedAt }

      # @!parse
      #   # @return [Increase::Models::InboundWireTransferListParams::CreatedAt]
      #   attr_writer :created_at

      # @!attribute [r] cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!parse
      #   # @return [String]
      #   attr_writer :cursor

      # @!attribute [r] limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #     objects.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :limit

      # @!attribute [r] status
      #
      #   @return [Increase::Models::InboundWireTransferListParams::Status, nil]
      optional :status, -> { Increase::Models::InboundWireTransferListParams::Status }

      # @!parse
      #   # @return [Increase::Models::InboundWireTransferListParams::Status]
      #   attr_writer :status

      # @!parse
      #   # @param account_id [String]
      #   # @param account_number_id [String]
      #   # @param created_at [Increase::Models::InboundWireTransferListParams::CreatedAt]
      #   # @param cursor [String]
      #   # @param limit [Integer]
      #   # @param status [Increase::Models::InboundWireTransferListParams::Status]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     account_id: nil,
      #     account_number_id: nil,
      #     created_at: nil,
      #     cursor: nil,
      #     limit: nil,
      #     status: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class CreatedAt < Increase::Internal::Type::BaseModel
        # @!attribute [r] after
        #   Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #     timestamp.
        #
        #   @return [Time, nil]
        optional :after, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :after

        # @!attribute [r] before
        #   Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #     timestamp.
        #
        #   @return [Time, nil]
        optional :before, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :before

        # @!attribute [r] on_or_after
        #   Return results on or after this
        #     [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        #
        #   @return [Time, nil]
        optional :on_or_after, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :on_or_after

        # @!attribute [r] on_or_before
        #   Return results on or before this
        #     [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        #
        #   @return [Time, nil]
        optional :on_or_before, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :on_or_before

        # @!parse
        #   # @param after [Time]
        #   # @param before [Time]
        #   # @param on_or_after [Time]
        #   # @param on_or_before [Time]
        #   #
        #   def initialize(after: nil, before: nil, on_or_after: nil, on_or_before: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute [r] in_
        #   Filter Inbound Wire Transfers to those with the specified status. For GET
        #     requests, this should be encoded as a comma-delimited string, such as
        #     `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::InboundWireTransferListParams::Status::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::Models::InboundWireTransferListParams::Status::In] },
                 api_name: :in

        # @!parse
        #   # @return [Array<Symbol, Increase::Models::InboundWireTransferListParams::Status::In>]
        #   attr_writer :in_

        # @!parse
        #   # @param in_ [Array<Symbol, Increase::Models::InboundWireTransferListParams::Status::In>]
        #   #
        #   def initialize(in_: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
