# typed: strong

module Increase
  module Models
    class CardDisputeListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      sig { returns(T.nilable(Increase::CardDisputeListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(
          created_at: Increase::CardDisputeListParams::CreatedAt::OrHash
        ).void
      end
      attr_writer :created_at

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

      sig { returns(T.nilable(Increase::CardDisputeListParams::Status)) }
      attr_reader :status

      sig do
        params(status: Increase::CardDisputeListParams::Status::OrHash).void
      end
      attr_writer :status

      sig do
        params(
          created_at: Increase::CardDisputeListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::CardDisputeListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        created_at: nil,
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
            created_at: Increase::CardDisputeListParams::CreatedAt,
            cursor: String,
            idempotency_key: String,
            limit: Integer,
            status: Increase::CardDisputeListParams::Status,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        # timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :after

        sig { params(after: Time).void }
        attr_writer :after

        # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        # timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :before

        sig { params(before: Time).void }
        attr_writer :before

        # Return results on or after this
        # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_after

        sig { params(on_or_after: Time).void }
        attr_writer :on_or_after

        # Return results on or before this
        # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_before

        sig { params(on_or_before: Time).void }
        attr_writer :on_or_before

        sig do
          params(
            after: Time,
            before: Time,
            on_or_after: Time,
            on_or_before: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          after: nil,
          # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          before: nil,
          # Return results on or after this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          on_or_after: nil,
          # Return results on or before this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          on_or_before: nil
        )
        end

        sig do
          override.returns(
            { after: Time, before: Time, on_or_after: Time, on_or_before: Time }
          )
        end
        def to_hash
        end
      end

      class Status < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # Filter Card Disputes for those with the specified status or statuses. For GET
        # requests, this should be encoded as a comma-delimited string, such as
        # `?in=one,two,three`.
        sig do
          returns(
            T.nilable(
              T::Array[Increase::CardDisputeListParams::Status::In::OrSymbol]
            )
          )
        end
        attr_reader :in_

        sig do
          params(
            in_: T::Array[Increase::CardDisputeListParams::Status::In::OrSymbol]
          ).void
        end
        attr_writer :in_

        sig do
          params(
            in_: T::Array[Increase::CardDisputeListParams::Status::In::OrSymbol]
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter Card Disputes for those with the specified status or statuses. For GET
          # requests, this should be encoded as a comma-delimited string, such as
          # `?in=one,two,three`.
          in_: nil
        )
        end

        sig do
          override.returns(
            {
              in_:
                T::Array[Increase::CardDisputeListParams::Status::In::OrSymbol]
            }
          )
        end
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CardDisputeListParams::Status::In)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The Card Dispute is pending review.
          PENDING_REVIEWING =
            T.let(
              :pending_reviewing,
              Increase::CardDisputeListParams::Status::In::TaggedSymbol
            )

          # Increase has requested more information related to the Card Dispute from you.
          PENDING_USER_INFORMATION =
            T.let(
              :pending_user_information,
              Increase::CardDisputeListParams::Status::In::TaggedSymbol
            )

          # The Card Dispute has been accepted and your funds have been returned. The card dispute will eventually transition into `won` or `lost` depending on the outcome.
          ACCEPTED =
            T.let(
              :accepted,
              Increase::CardDisputeListParams::Status::In::TaggedSymbol
            )

          # The Card Dispute has been rejected.
          REJECTED =
            T.let(
              :rejected,
              Increase::CardDisputeListParams::Status::In::TaggedSymbol
            )

          # The Card Dispute has been lost and funds previously credited from the acceptance have been debited.
          LOST =
            T.let(
              :lost,
              Increase::CardDisputeListParams::Status::In::TaggedSymbol
            )

          # The Card Dispute has been won and no further action can be taken.
          WON =
            T.let(
              :won,
              Increase::CardDisputeListParams::Status::In::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardDisputeListParams::Status::In::TaggedSymbol
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
