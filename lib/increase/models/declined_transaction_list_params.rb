# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DeclinedTransactions#list
    class DeclinedTransactionListParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute [r] account_id
      #   Filter Declined Transactions to ones belonging to the specified Account.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :account_id

      # @!attribute [r] category
      #
      #   @return [Increase::Models::DeclinedTransactionListParams::Category, nil]
      optional :category, -> { Increase::Models::DeclinedTransactionListParams::Category }

      # @!parse
      #   # @return [Increase::Models::DeclinedTransactionListParams::Category]
      #   attr_writer :category

      # @!attribute [r] created_at
      #
      #   @return [Increase::Models::DeclinedTransactionListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::Models::DeclinedTransactionListParams::CreatedAt }

      # @!parse
      #   # @return [Increase::Models::DeclinedTransactionListParams::CreatedAt]
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

      # @!attribute [r] route_id
      #   Filter Declined Transactions to those belonging to the specified route.
      #
      #   @return [String, nil]
      optional :route_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :route_id

      # @!parse
      #   # @param account_id [String]
      #   # @param category [Increase::Models::DeclinedTransactionListParams::Category]
      #   # @param created_at [Increase::Models::DeclinedTransactionListParams::CreatedAt]
      #   # @param cursor [String]
      #   # @param limit [Integer]
      #   # @param route_id [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     account_id: nil,
      #     category: nil,
      #     created_at: nil,
      #     cursor: nil,
      #     limit: nil,
      #     route_id: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class Category < Increase::Internal::Type::BaseModel
        # @!attribute [r] in_
        #   Return results whose value is in the provided list. For GET requests, this
        #     should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::DeclinedTransactionListParams::Category::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::Models::DeclinedTransactionListParams::Category::In] },
                 api_name: :in

        # @!parse
        #   # @return [Array<Symbol, Increase::Models::DeclinedTransactionListParams::Category::In>]
        #   attr_writer :in_

        # @!parse
        #   # @param in_ [Array<Symbol, Increase::Models::DeclinedTransactionListParams::Category::In>]
        #   #
        #   def initialize(in_: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        module In
          extend Increase::Internal::Type::Enum

          # ACH Decline: details will be under the `ach_decline` object.
          ACH_DECLINE = :ach_decline

          # Card Decline: details will be under the `card_decline` object.
          CARD_DECLINE = :card_decline

          # Check Decline: details will be under the `check_decline` object.
          CHECK_DECLINE = :check_decline

          # Inbound Real-Time Payments Transfer Decline: details will be under the `inbound_real_time_payments_transfer_decline` object.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_DECLINE = :inbound_real_time_payments_transfer_decline

          # Wire Decline: details will be under the `wire_decline` object.
          WIRE_DECLINE = :wire_decline

          # Check Deposit Rejection: details will be under the `check_deposit_rejection` object.
          CHECK_DEPOSIT_REJECTION = :check_deposit_rejection

          # The Declined Transaction was made for an undocumented or deprecated reason.
          OTHER = :other

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

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
    end
  end
end
