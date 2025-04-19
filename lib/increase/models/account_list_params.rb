# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Accounts#list
    class AccountListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute created_at
      #
      #   @return [Increase::Models::AccountListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::Models::AccountListParams::CreatedAt }

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
      #   @return [Increase::Models::AccountListParams::Status, nil]
      optional :status, -> { Increase::Models::AccountListParams::Status }

      # @!method initialize(created_at: nil, cursor: nil, entity_id: nil, idempotency_key: nil, informational_entity_id: nil, limit: nil, program_id: nil, status: nil, request_options: {})
      #   @param created_at [Increase::Models::AccountListParams::CreatedAt]
      #   @param cursor [String]
      #   @param entity_id [String]
      #   @param idempotency_key [String]
      #   @param informational_entity_id [String]
      #   @param limit [Integer]
      #   @param program_id [String]
      #   @param status [Increase::Models::AccountListParams::Status]
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
        #   @param after [Time]
        #   @param before [Time]
        #   @param on_or_after [Time]
        #   @param on_or_before [Time]
      end

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute in_
        #   Filter Accounts for those with the specified status. For GET requests, this
        #   should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::AccountListParams::Status::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::Models::AccountListParams::Status::In] },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   @param in_ [Array<Symbol, Increase::Models::AccountListParams::Status::In>]

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
