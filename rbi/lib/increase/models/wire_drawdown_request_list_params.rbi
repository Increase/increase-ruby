# typed: strong

module Increase
  module Models
    class WireDrawdownRequestListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      # Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(Increase::Models::WireDrawdownRequestListParams::Status)) }
      attr_reader :status

      sig do
        params(
          status: T.any(Increase::Models::WireDrawdownRequestListParams::Status, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :status

      sig do
        params(
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: T.any(Increase::Models::WireDrawdownRequestListParams::Status, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              cursor: String,
              idempotency_key: String,
              limit: Integer,
              status: Increase::Models::WireDrawdownRequestListParams::Status,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class Status < Increase::Internal::Type::BaseModel
        # Filter Wire Drawdown Requests for those with the specified status. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        sig { returns(T.nilable(T::Array[Increase::Models::WireDrawdownRequestListParams::Status::In::OrSymbol])) }
        attr_reader :in_

        sig { params(in_: T::Array[Increase::Models::WireDrawdownRequestListParams::Status::In::OrSymbol]).void }
        attr_writer :in_

        sig do
          params(in_: T::Array[Increase::Models::WireDrawdownRequestListParams::Status::In::OrSymbol])
            .returns(T.attached_class)
        end
        def self.new(in_: nil)
        end

        sig { override.returns({in_: T::Array[Increase::Models::WireDrawdownRequestListParams::Status::In::OrSymbol]}) }
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::WireDrawdownRequestListParams::Status::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::WireDrawdownRequestListParams::Status::In::TaggedSymbol) }

          # The drawdown request is queued to be submitted to Fedwire.
          PENDING_SUBMISSION =
            T.let(:pending_submission, Increase::Models::WireDrawdownRequestListParams::Status::In::TaggedSymbol)

          # The drawdown request has been sent and the recipient should respond in some way.
          PENDING_RESPONSE =
            T.let(:pending_response, Increase::Models::WireDrawdownRequestListParams::Status::In::TaggedSymbol)

          # The drawdown request has been fulfilled by the recipient.
          FULFILLED = T.let(:fulfilled, Increase::Models::WireDrawdownRequestListParams::Status::In::TaggedSymbol)

          # The drawdown request has been refused by the recipient.
          REFUSED = T.let(:refused, Increase::Models::WireDrawdownRequestListParams::Status::In::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::WireDrawdownRequestListParams::Status::In::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end
  end
end
