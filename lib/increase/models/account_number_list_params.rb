# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::AccountNumbers#list
    class AccountNumberListParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute [r] account_id
      #   Filter Account Numbers to those belonging to the specified Account.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :account_id

      # @!attribute [r] ach_debit_status
      #
      #   @return [Increase::Models::AccountNumberListParams::ACHDebitStatus, nil]
      optional :ach_debit_status, -> { Increase::Models::AccountNumberListParams::ACHDebitStatus }

      # @!parse
      #   # @return [Increase::Models::AccountNumberListParams::ACHDebitStatus]
      #   attr_writer :ach_debit_status

      # @!attribute [r] created_at
      #
      #   @return [Increase::Models::AccountNumberListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::Models::AccountNumberListParams::CreatedAt }

      # @!parse
      #   # @return [Increase::Models::AccountNumberListParams::CreatedAt]
      #   attr_writer :created_at

      # @!attribute [r] cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!parse
      #   # @return [String]
      #   attr_writer :cursor

      # @!attribute [r] idempotency_key
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #     that object. This value is unique across Increase and is used to ensure that a
      #     request is only processed once. Learn more about
      #     [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!parse
      #   # @return [String]
      #   attr_writer :idempotency_key

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
      #   @return [Increase::Models::AccountNumberListParams::Status, nil]
      optional :status, -> { Increase::Models::AccountNumberListParams::Status }

      # @!parse
      #   # @return [Increase::Models::AccountNumberListParams::Status]
      #   attr_writer :status

      # @!parse
      #   # @param account_id [String]
      #   # @param ach_debit_status [Increase::Models::AccountNumberListParams::ACHDebitStatus]
      #   # @param created_at [Increase::Models::AccountNumberListParams::CreatedAt]
      #   # @param cursor [String]
      #   # @param idempotency_key [String]
      #   # @param limit [Integer]
      #   # @param status [Increase::Models::AccountNumberListParams::Status]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     account_id: nil,
      #     ach_debit_status: nil,
      #     created_at: nil,
      #     cursor: nil,
      #     idempotency_key: nil,
      #     limit: nil,
      #     status: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class ACHDebitStatus < Increase::Internal::Type::BaseModel
        # @!attribute [r] in_
        #   The ACH Debit status to retrieve Account Numbers for. For GET requests, this
        #     should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::AccountNumberListParams::ACHDebitStatus::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::Models::AccountNumberListParams::ACHDebitStatus::In] },
                 api_name: :in

        # @!parse
        #   # @return [Array<Symbol, Increase::Models::AccountNumberListParams::ACHDebitStatus::In>]
        #   attr_writer :in_

        # @!parse
        #   # @param in_ [Array<Symbol, Increase::Models::AccountNumberListParams::ACHDebitStatus::In>]
        #   #
        #   def initialize(in_: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        module In
          extend Increase::Internal::Type::Enum

          # ACH Debits are allowed.
          ALLOWED = :allowed

          # ACH Debits are blocked.
          BLOCKED = :blocked

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

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute [r] in_
        #   The status to retrieve Account Numbers for. For GET requests, this should be
        #     encoded as a comma-delimited string, such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::AccountNumberListParams::Status::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::Models::AccountNumberListParams::Status::In] },
                 api_name: :in

        # @!parse
        #   # @return [Array<Symbol, Increase::Models::AccountNumberListParams::Status::In>]
        #   attr_writer :in_

        # @!parse
        #   # @param in_ [Array<Symbol, Increase::Models::AccountNumberListParams::Status::In>]
        #   #
        #   def initialize(in_: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        module In
          extend Increase::Internal::Type::Enum

          # The account number is active.
          ACTIVE = :active

          # The account number is temporarily disabled.
          DISABLED = :disabled

          # The account number is permanently disabled.
          CANCELED = :canceled

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
