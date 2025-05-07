# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ExternalAccounts#list
    class ExternalAccountListParams < Increase::Internal::Type::BaseModel
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

      # @!attribute routing_number
      #   Filter External Accounts to those with the specified Routing Number.
      #
      #   @return [String, nil]
      optional :routing_number, String

      # @!attribute status
      #
      #   @return [Increase::ExternalAccountListParams::Status, nil]
      optional :status, -> { Increase::ExternalAccountListParams::Status }

      # @!method initialize(cursor: nil, idempotency_key: nil, limit: nil, routing_number: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::ExternalAccountListParams} for more details.
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param routing_number [String] Filter External Accounts to those with the specified Routing Number.
      #
      #   @param status [Increase::ExternalAccountListParams::Status]
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute in_
        #   Filter External Accounts for those with the specified status or statuses. For
        #   GET requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::ExternalAccountListParams::Status::In>, nil]
        optional :in_,
                 -> {
                   Increase::Internal::Type::ArrayOf[enum: Increase::ExternalAccountListParams::Status::In]
                 },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::ExternalAccountListParams::Status} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::ExternalAccountListParams::Status::In>] Filter External Accounts for those with the specified status or statuses. For GE

        module In
          extend Increase::Internal::Type::Enum

          # The External Account is active.
          ACTIVE = :active

          # The External Account is archived and won't appear in the dashboard.
          ARCHIVED = :archived

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
