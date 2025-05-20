# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PendingTransactions#list
    class PendingTransactionListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   Filter pending transactions to those belonging to the specified Account.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute category
      #
      #   @return [Increase::PendingTransactionListParams::Category, nil]
      optional :category, -> { Increase::PendingTransactionListParams::Category }

      # @!attribute created_at
      #
      #   @return [Increase::PendingTransactionListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::PendingTransactionListParams::CreatedAt }

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

      # @!attribute route_id
      #   Filter pending transactions to those belonging to the specified Route.
      #
      #   @return [String, nil]
      optional :route_id, String

      # @!attribute status
      #
      #   @return [Increase::PendingTransactionListParams::Status, nil]
      optional :status, -> { Increase::PendingTransactionListParams::Status }

      # @!method initialize(account_id: nil, category: nil, created_at: nil, cursor: nil, limit: nil, route_id: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::PendingTransactionListParams} for more details.
      #
      #   @param account_id [String] Filter pending transactions to those belonging to the specified Account.
      #
      #   @param category [Increase::PendingTransactionListParams::Category]
      #
      #   @param created_at [Increase::PendingTransactionListParams::CreatedAt]
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param route_id [String] Filter pending transactions to those belonging to the specified Route.
      #
      #   @param status [Increase::PendingTransactionListParams::Status]
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Category < Increase::Internal::Type::BaseModel
        # @!attribute in_
        #   Return results whose value is in the provided list. For GET requests, this
        #   should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::PendingTransactionListParams::Category::In>, nil]
        optional :in_,
                 -> {
                   Increase::Internal::Type::ArrayOf[enum: Increase::PendingTransactionListParams::Category::In]
                 },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::PendingTransactionListParams::Category} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::PendingTransactionListParams::Category::In>] Return results whose value is in the provided list. For GET requests, this shoul

        module In
          extend Increase::Internal::Type::Enum

          # Account Transfer Instruction: details will be under the `account_transfer_instruction` object.
          ACCOUNT_TRANSFER_INSTRUCTION = :account_transfer_instruction

          # ACH Transfer Instruction: details will be under the `ach_transfer_instruction` object.
          ACH_TRANSFER_INSTRUCTION = :ach_transfer_instruction

          # Card Authorization: details will be under the `card_authorization` object.
          CARD_AUTHORIZATION = :card_authorization

          # Check Deposit Instruction: details will be under the `check_deposit_instruction` object.
          CHECK_DEPOSIT_INSTRUCTION = :check_deposit_instruction

          # Check Transfer Instruction: details will be under the `check_transfer_instruction` object.
          CHECK_TRANSFER_INSTRUCTION = :check_transfer_instruction

          # Inbound Funds Hold: details will be under the `inbound_funds_hold` object.
          INBOUND_FUNDS_HOLD = :inbound_funds_hold

          # Real-Time Payments Transfer Instruction: details will be under the `real_time_payments_transfer_instruction` object.
          REAL_TIME_PAYMENTS_TRANSFER_INSTRUCTION = :real_time_payments_transfer_instruction

          # Wire Transfer Instruction: details will be under the `wire_transfer_instruction` object.
          WIRE_TRANSFER_INSTRUCTION = :wire_transfer_instruction

          # Inbound Wire Transfer Reversal: details will be under the `inbound_wire_transfer_reversal` object.
          INBOUND_WIRE_TRANSFER_REVERSAL = :inbound_wire_transfer_reversal

          # Swift Transfer Instruction: details will be under the `swift_transfer_instruction` object.
          SWIFT_TRANSFER_INSTRUCTION = :swift_transfer_instruction

          # Outbound Card Push Transfer Instruction: details will be under the `outbound_card_push_transfer_instruction` object.
          OUTBOUND_CARD_PUSH_TRANSFER_INSTRUCTION = :outbound_card_push_transfer_instruction

          # The Pending Transaction was made for an undocumented or deprecated reason.
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

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
        #   {Increase::PendingTransactionListParams::CreatedAt} for more details.
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
        #   Filter Pending Transactions for those with the specified status. By default only
        #   Pending Transactions in with status `pending` will be returned. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::PendingTransactionListParams::Status::In>, nil]
        optional :in_,
                 -> {
                   Increase::Internal::Type::ArrayOf[enum: Increase::PendingTransactionListParams::Status::In]
                 },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::PendingTransactionListParams::Status} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::PendingTransactionListParams::Status::In>] Filter Pending Transactions for those with the specified status. By default only

        module In
          extend Increase::Internal::Type::Enum

          # The Pending Transaction is still awaiting confirmation.
          PENDING = :pending

          # The Pending Transaction is confirmed. An associated Transaction exists for this object. The Pending Transaction will no longer count against your balance and can generally be hidden from UIs, etc.
          COMPLETE = :complete

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
