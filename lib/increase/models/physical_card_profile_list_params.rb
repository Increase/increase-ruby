# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCardProfiles#list
    class PhysicalCardProfileListParams < Increase::Internal::Type::BaseModel
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
      #   @return [Increase::PhysicalCardProfileListParams::Status, nil]
      optional :status, -> { Increase::PhysicalCardProfileListParams::Status }

      # @!method initialize(cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::PhysicalCardProfileListParams} for more details.
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param status [Increase::PhysicalCardProfileListParams::Status]
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute in_
        #   Filter Physical Card Profiles for those with the specified statuses. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::PhysicalCardProfileListParams::Status::In>, nil]
        optional :in_,
                 -> {
                   Increase::Internal::Type::ArrayOf[enum: Increase::PhysicalCardProfileListParams::Status::In]
                 },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::PhysicalCardProfileListParams::Status} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::PhysicalCardProfileListParams::Status::In>] Filter Physical Card Profiles for those with the specified statuses. For GET req

        module In
          extend Increase::Internal::Type::Enum

          # The Card Profile has not yet been processed by Increase.
          PENDING_CREATING = :pending_creating

          # The card profile is awaiting review by Increase.
          PENDING_REVIEWING = :pending_reviewing

          # There is an issue with the Physical Card Profile preventing it from use.
          REJECTED = :rejected

          # The card profile is awaiting submission to the fulfillment provider.
          PENDING_SUBMITTING = :pending_submitting

          # The Physical Card Profile has been submitted to the fulfillment provider and is ready to use.
          ACTIVE = :active

          # The Physical Card Profile has been archived.
          ARCHIVED = :archived

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
