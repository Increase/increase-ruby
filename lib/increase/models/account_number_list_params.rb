# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountNumbers#list
    class AccountNumberListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   Filter Account Numbers to those belonging to the specified Account.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute ach_debit_status
      #
      #   @return [Increase::AccountNumberListParams::ACHDebitStatus, nil]
      optional :ach_debit_status, -> { Increase::AccountNumberListParams::ACHDebitStatus }

      # @!attribute created_at
      #
      #   @return [Increase::AccountNumberListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::AccountNumberListParams::CreatedAt }

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

      # @!attribute status
      #
      #   @return [Increase::AccountNumberListParams::Status, nil]
      optional :status, -> { Increase::AccountNumberListParams::Status }

      # @!method initialize(account_id: nil, ach_debit_status: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::AccountNumberListParams} for more details.
      #
      #   @param account_id [String] Filter Account Numbers to those belonging to the specified Account.
      #
      #   @param ach_debit_status [Increase::AccountNumberListParams::ACHDebitStatus]
      #
      #   @param created_at [Increase::AccountNumberListParams::CreatedAt]
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param status [Increase::AccountNumberListParams::Status]
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class ACHDebitStatus < Increase::Internal::Type::BaseModel
        # @!attribute in_
        #   The ACH Debit status to retrieve Account Numbers for. For GET requests, this
        #   should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::AccountNumberListParams::ACHDebitStatus::In>, nil]
        optional :in_,
                 -> {
                   Increase::Internal::Type::ArrayOf[enum: Increase::AccountNumberListParams::ACHDebitStatus::In]
                 },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::AccountNumberListParams::ACHDebitStatus} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::AccountNumberListParams::ACHDebitStatus::In>] The ACH Debit status to retrieve Account Numbers for. For GET requests, this sho

        module In
          extend Increase::Internal::Type::Enum

          # ACH Debits are allowed.
          ALLOWED = :allowed

          # ACH Debits are blocked.
          BLOCKED = :blocked

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
        #   {Increase::AccountNumberListParams::CreatedAt} for more details.
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
        #   The status to retrieve Account Numbers for. For GET requests, this should be
        #   encoded as a comma-delimited string, such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::AccountNumberListParams::Status::In>, nil]
        optional :in_,
                 -> {
                   Increase::Internal::Type::ArrayOf[enum: Increase::AccountNumberListParams::Status::In]
                 },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::AccountNumberListParams::Status} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::AccountNumberListParams::Status::In>] The status to retrieve Account Numbers for. For GET requests, this should be enc

        module In
          extend Increase::Internal::Type::Enum

          # The account number is active.
          ACTIVE = :active

          # The account number is temporarily disabled.
          DISABLED = :disabled

          # The account number is permanently disabled.
          CANCELED = :canceled

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
