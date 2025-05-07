# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Accounts#list
    class AccountListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute created_at
      #
      #   @return [Increase::AccountListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::AccountListParams::CreatedAt }

      # @!attribute cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute entity_id
      #   Filter Accounts for those belonging to the specified Entity.
      #
      #   @return [String, nil]
      optional :entity_id, String

      # @!attribute idempotency_key
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute informational_entity_id
      #   Filter Accounts for those belonging to the specified Entity as informational.
      #
      #   @return [String, nil]
      optional :informational_entity_id, String

      # @!attribute limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute program_id
      #   Filter Accounts for those in a specific Program.
      #
      #   @return [String, nil]
      optional :program_id, String

      # @!attribute status
      #
      #   @return [Increase::AccountListParams::Status, nil]
      optional :status, -> { Increase::AccountListParams::Status }

      # @!method initialize(created_at: nil, cursor: nil, entity_id: nil, idempotency_key: nil, informational_entity_id: nil, limit: nil, program_id: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::AccountListParams} for more details.
      #
      #   @param created_at [Increase::AccountListParams::CreatedAt]
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param entity_id [String] Filter Accounts for those belonging to the specified Entity.
      #
      #   @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      #   @param informational_entity_id [String] Filter Accounts for those belonging to the specified Entity as informational.
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param program_id [String] Filter Accounts for those in a specific Program.
      #
      #   @param status [Increase::AccountListParams::Status]
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
        #   {Increase::AccountListParams::CreatedAt} for more details.
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
        #   Filter Accounts for those with the specified status. For GET requests, this
        #   should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::AccountListParams::Status::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::AccountListParams::Status::In] },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::AccountListParams::Status} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::AccountListParams::Status::In>] Filter Accounts for those with the specified status. For GET requests, this shou

        module In
          extend Increase::Internal::Type::Enum

          # Closed Accounts on which no new activity can occur.
          CLOSED = :closed

          # Open Accounts that are ready to use.
          OPEN = :open

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
