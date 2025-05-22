# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::DigitalCardProfiles#list
    class DigitalCardProfileListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

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
      #   @return [Increase::Models::DigitalCardProfileListParams::Status, nil]
      optional :status, -> { Increase::DigitalCardProfileListParams::Status }

      # @!method initialize(cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::DigitalCardProfileListParams} for more details.
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param status [Increase::Models::DigitalCardProfileListParams::Status]
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute in_
        #   Filter Digital Card Profiles for those with the specified digital wallet status
        #   or statuses. For GET requests, this should be encoded as a comma-delimited
        #   string, such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::DigitalCardProfileListParams::Status::In>, nil]
        optional :in_,
                 -> {
                   Increase::Internal::Type::ArrayOf[enum: Increase::DigitalCardProfileListParams::Status::In]
                 },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::DigitalCardProfileListParams::Status} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::Models::DigitalCardProfileListParams::Status::In>] Filter Digital Card Profiles for those with the specified digital wallet status

        module In
          extend Increase::Internal::Type::Enum

          # The Card Profile is awaiting review from Increase and/or processing by card networks.
          PENDING = :pending

          # There is an issue with the Card Profile preventing it from use.
          REJECTED = :rejected

          # The Card Profile can be assigned to Cards.
          ACTIVE = :active

          # The Card Profile is no longer in use.
          ARCHIVED = :archived

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
