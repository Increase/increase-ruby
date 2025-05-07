# typed: strong

module Increase
  module Models
    class WireDrawdownRequestListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Filter records to the one with the specified `idempotency_key` you chose for
      # that object. This value is unique across Increase and is used to ensure that a
      # request is only processed once. Learn more about
      # [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      # Limit the size of the list that is returned. The default (and maximum) is 100
      # objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        returns(T.nilable(Increase::WireDrawdownRequestListParams::Status))
      end
      attr_reader :status

      sig do
        params(
          status: Increase::WireDrawdownRequestListParams::Status::OrHash
        ).void
      end
      attr_writer :status

      sig do
        params(
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::WireDrawdownRequestListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            idempotency_key: String,
            limit: Integer,
            status: Increase::WireDrawdownRequestListParams::Status,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Status < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # Filter Wire Drawdown Requests for those with the specified status. For GET
        # requests, this should be encoded as a comma-delimited string, such as
        # `?in=one,two,three`.
        sig do
          returns(
            T.nilable(
              T::Array[
                Increase::WireDrawdownRequestListParams::Status::In::OrSymbol
              ]
            )
          )
        end
        attr_reader :in_

        sig do
          params(
            in_:
              T::Array[
                Increase::WireDrawdownRequestListParams::Status::In::OrSymbol
              ]
          ).void
        end
        attr_writer :in_

        sig do
          params(
            in_:
              T::Array[
                Increase::WireDrawdownRequestListParams::Status::In::OrSymbol
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter Wire Drawdown Requests for those with the specified status. For GET
          # requests, this should be encoded as a comma-delimited string, such as
          # `?in=one,two,three`.
          in_: nil
        )
        end

        sig do
          override.returns(
            {
              in_:
                T::Array[
                  Increase::WireDrawdownRequestListParams::Status::In::OrSymbol
                ]
            }
          )
        end
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::WireDrawdownRequestListParams::Status::In)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The drawdown request is queued to be submitted to Fedwire.
          PENDING_SUBMISSION =
            T.let(
              :pending_submission,
              Increase::WireDrawdownRequestListParams::Status::In::TaggedSymbol
            )

          # The drawdown request has been sent and the recipient should respond in some way.
          PENDING_RESPONSE =
            T.let(
              :pending_response,
              Increase::WireDrawdownRequestListParams::Status::In::TaggedSymbol
            )

          # The drawdown request has been fulfilled by the recipient.
          FULFILLED =
            T.let(
              :fulfilled,
              Increase::WireDrawdownRequestListParams::Status::In::TaggedSymbol
            )

          # The drawdown request has been refused by the recipient.
          REFUSED =
            T.let(
              :refused,
              Increase::WireDrawdownRequestListParams::Status::In::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::WireDrawdownRequestListParams::Status::In::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
