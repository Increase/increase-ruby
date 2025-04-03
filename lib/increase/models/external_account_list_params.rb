# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ExternalAccounts#list
    class ExternalAccountListParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

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

      # @!attribute [r] routing_number
      #   Filter External Accounts to those with the specified Routing Number.
      #
      #   @return [String, nil]
      optional :routing_number, String

      # @!parse
      #   # @return [String]
      #   attr_writer :routing_number

      # @!attribute [r] status
      #
      #   @return [Increase::Models::ExternalAccountListParams::Status, nil]
      optional :status, -> { Increase::Models::ExternalAccountListParams::Status }

      # @!parse
      #   # @return [Increase::Models::ExternalAccountListParams::Status]
      #   attr_writer :status

      # @!parse
      #   # @param cursor [String]
      #   # @param idempotency_key [String]
      #   # @param limit [Integer]
      #   # @param routing_number [String]
      #   # @param status [Increase::Models::ExternalAccountListParams::Status]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(cursor: nil, idempotency_key: nil, limit: nil, routing_number: nil, status: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute [r] in_
        #   Filter External Accounts for those with the specified status or statuses. For
        #     GET requests, this should be encoded as a comma-delimited string, such as
        #     `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::ExternalAccountListParams::Status::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::Models::ExternalAccountListParams::Status::In] },
                 api_name: :in

        # @!parse
        #   # @return [Array<Symbol, Increase::Models::ExternalAccountListParams::Status::In>]
        #   attr_writer :in_

        # @!parse
        #   # @param in_ [Array<Symbol, Increase::Models::ExternalAccountListParams::Status::In>]
        #   #
        #   def initialize(in_: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        module In
          extend Increase::Internal::Type::Enum

          # The External Account is active.
          ACTIVE = :active

          # The External Account is archived and won't appear in the dashboard.
          ARCHIVED = :archived

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
