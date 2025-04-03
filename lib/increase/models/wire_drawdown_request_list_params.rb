# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::WireDrawdownRequests#list
    class WireDrawdownRequestListParams < Increase::Internal::Type::BaseModel
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

      # @!attribute [r] status
      #
      #   @return [Increase::Models::WireDrawdownRequestListParams::Status, nil]
      optional :status, -> { Increase::Models::WireDrawdownRequestListParams::Status }

      # @!parse
      #   # @return [Increase::Models::WireDrawdownRequestListParams::Status]
      #   attr_writer :status

      # @!parse
      #   # @param cursor [String]
      #   # @param idempotency_key [String]
      #   # @param limit [Integer]
      #   # @param status [Increase::Models::WireDrawdownRequestListParams::Status]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute [r] in_
        #   Filter Wire Drawdown Requests for those with the specified status. For GET
        #     requests, this should be encoded as a comma-delimited string, such as
        #     `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::WireDrawdownRequestListParams::Status::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::Models::WireDrawdownRequestListParams::Status::In] },
                 api_name: :in

        # @!parse
        #   # @return [Array<Symbol, Increase::Models::WireDrawdownRequestListParams::Status::In>]
        #   attr_writer :in_

        # @!parse
        #   # @param in_ [Array<Symbol, Increase::Models::WireDrawdownRequestListParams::Status::In>]
        #   #
        #   def initialize(in_: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        module In
          extend Increase::Internal::Type::Enum

          # The drawdown request is queued to be submitted to Fedwire.
          PENDING_SUBMISSION = :pending_submission

          # The drawdown request has been sent and the recipient should respond in some way.
          PENDING_RESPONSE = :pending_response

          # The drawdown request has been fulfilled by the recipient.
          FULFILLED = :fulfilled

          # The drawdown request has been refused by the recipient.
          REFUSED = :refused

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
