# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::BookkeepingEntrySets#create
    class BookkeepingEntrySetCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute entries
      #   The bookkeeping entries.
      #
      #   @return [Array<Increase::Models::BookkeepingEntrySetCreateParams::Entry>]
      required :entries,
               -> { Increase::Internal::Type::ArrayOf[Increase::BookkeepingEntrySetCreateParams::Entry] }

      # @!attribute date
      #   The date of the transaction. Optional if `transaction_id` is provided, in which
      #   case we use the `date` of that transaction. Required otherwise.
      #
      #   @return [Time, nil]
      optional :date, Time

      # @!attribute transaction_id
      #   The identifier of the Transaction related to this entry set, if any.
      #
      #   @return [String, nil]
      optional :transaction_id, String

      # @!method initialize(entries:, date: nil, transaction_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::BookkeepingEntrySetCreateParams} for more details.
      #
      #   @param entries [Array<Increase::Models::BookkeepingEntrySetCreateParams::Entry>] The bookkeeping entries.
      #
      #   @param date [Time] The date of the transaction. Optional if `transaction_id` is provided, in which
      #
      #   @param transaction_id [String] The identifier of the Transaction related to this entry set, if any.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Entry < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   The identifier for the Bookkeeping Account impacted by this entry.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute amount
        #   The entry amount in the minor unit of the account currency. For dollars, for
        #   example, this is cents. Debit entries have positive amounts; credit entries have
        #   negative amounts.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!method initialize(account_id:, amount:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::BookkeepingEntrySetCreateParams::Entry} for more details.
        #
        #   @param account_id [String] The identifier for the Bookkeeping Account impacted by this entry.
        #
        #   @param amount [Integer] The entry amount in the minor unit of the account currency. For dollars, for exa
      end
    end
  end
end
