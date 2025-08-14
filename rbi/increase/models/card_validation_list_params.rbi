# typed: strong

module Increase
  module Models
    class CardValidationListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CardValidationListParams, Increase::Internal::AnyHash)
        end

      # Filter Card Validations to ones belonging to the specified Account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      sig { returns(T.nilable(Increase::CardValidationListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(
          created_at: Increase::CardValidationListParams::CreatedAt::OrHash
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

      sig { returns(T.nilable(Increase::CardValidationListParams::Status)) }
      attr_reader :status

      sig do
        params(status: Increase::CardValidationListParams::Status::OrHash).void
      end
      attr_writer :status

      sig do
        params(
          account_id: String,
          created_at: Increase::CardValidationListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::CardValidationListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter Card Validations to ones belonging to the specified Account.
        account_id: nil,
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
            account_id: String,
            created_at: Increase::CardValidationListParams::CreatedAt,
            cursor: String,
            idempotency_key: String,
            limit: Integer,
            status: Increase::CardValidationListParams::Status,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardValidationListParams::CreatedAt,
              Increase::Internal::AnyHash
            )
          end

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
          T.type_alias do
            T.any(
              Increase::CardValidationListParams::Status,
              Increase::Internal::AnyHash
            )
          end

        # Filter Card Validations by status. For GET requests, this should be encoded as a
        # comma-delimited string, such as `?in=one,two,three`.
        sig do
          returns(
            T.nilable(
              T::Array[Increase::CardValidationListParams::Status::In::OrSymbol]
            )
          )
        end
        attr_reader :in_

        sig do
          params(
            in_:
              T::Array[Increase::CardValidationListParams::Status::In::OrSymbol]
          ).void
        end
        attr_writer :in_

        sig do
          params(
            in_:
              T::Array[Increase::CardValidationListParams::Status::In::OrSymbol]
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter Card Validations by status. For GET requests, this should be encoded as a
          # comma-delimited string, such as `?in=one,two,three`.
          in_: nil
        )
        end

        sig do
          override.returns(
            {
              in_:
                T::Array[
                  Increase::CardValidationListParams::Status::In::OrSymbol
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
              T.all(Symbol, Increase::CardValidationListParams::Status::In)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The validation requires attention from an Increase operator.
          REQUIRES_ATTENTION =
            T.let(
              :requires_attention,
              Increase::CardValidationListParams::Status::In::TaggedSymbol
            )

          # The validation is queued to be submitted to the card network.
          PENDING_SUBMISSION =
            T.let(
              :pending_submission,
              Increase::CardValidationListParams::Status::In::TaggedSymbol
            )

          # The validation has been submitted and is pending a response from the card network.
          SUBMITTED =
            T.let(
              :submitted,
              Increase::CardValidationListParams::Status::In::TaggedSymbol
            )

          # The validation has been sent successfully and is complete.
          COMPLETE =
            T.let(
              :complete,
              Increase::CardValidationListParams::Status::In::TaggedSymbol
            )

          # The validation was declined by the network or the recipient's bank.
          DECLINED =
            T.let(
              :declined,
              Increase::CardValidationListParams::Status::In::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardValidationListParams::Status::In::TaggedSymbol
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
