# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RealTimePaymentsTransfers#list
    class RealTimePaymentsTransferListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   Filter Real-Time Payments Transfers to those belonging to the specified Account.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute created_at
      #
      #   @return [Increase::RealTimePaymentsTransferListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::RealTimePaymentsTransferListParams::CreatedAt }

      # @!attribute cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute external_account_id
      #   Filter Real-Time Payments Transfers to those made to the specified External
      #   Account.
      #
      #   @return [String, nil]
      optional :external_account_id, String

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

      # @!attribute status
      #
      #   @return [Increase::RealTimePaymentsTransferListParams::Status, nil]
      optional :status, -> { Increase::RealTimePaymentsTransferListParams::Status }

      # @!method initialize(account_id: nil, created_at: nil, cursor: nil, external_account_id: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::RealTimePaymentsTransferListParams} for more details.
      #
      #   @param account_id [String] Filter Real-Time Payments Transfers to those belonging to the specified Account.
      #
      #   @param created_at [Increase::RealTimePaymentsTransferListParams::CreatedAt]
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param external_account_id [String] Filter Real-Time Payments Transfers to those made to the specified External Acco
      #
      #   @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param status [Increase::RealTimePaymentsTransferListParams::Status]
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
        #   {Increase::RealTimePaymentsTransferListParams::CreatedAt} for more details.
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
        #   Return results whose value is in the provided list. For GET requests, this
        #   should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::RealTimePaymentsTransferListParams::Status::In>, nil]
        optional :in_,
                 -> {
                   Increase::Internal::Type::ArrayOf[enum: Increase::RealTimePaymentsTransferListParams::Status::In]
                 },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::RealTimePaymentsTransferListParams::Status} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::RealTimePaymentsTransferListParams::Status::In>] Return results whose value is in the provided list. For GET requests, this shoul

        module In
          extend Increase::Internal::Type::Enum

          # The transfer is pending approval.
          PENDING_APPROVAL = :pending_approval

          # The transfer has been canceled.
          CANCELED = :canceled

          # The transfer is pending review by Increase.
          PENDING_REVIEWING = :pending_reviewing

          # The transfer requires attention from an Increase operator.
          REQUIRES_ATTENTION = :requires_attention

          # The transfer was rejected by the network or the recipient's bank.
          REJECTED = :rejected

          # The transfer is queued to be submitted to Real-Time Payments.
          PENDING_SUBMISSION = :pending_submission

          # The transfer has been submitted and is pending a response from Real-Time Payments.
          SUBMITTED = :submitted

          # The transfer has been sent successfully and is complete.
          COMPLETE = :complete

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
