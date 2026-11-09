# typed: strong

module Increase
  module Models
    class CheckbookListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CheckbookListParams, Increase::Internal::AnyHash)
        end

      # Filter Checkbooks to those attached to the specified Account Number.
      sig { returns(T.nilable(String)) }
      attr_reader :account_number_id

      sig { params(account_number_id: String).void }
      attr_writer :account_number_id

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
      #
      # Defaults to `100`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(Increase::CheckbookListParams::Status)) }
      attr_reader :status

      sig { params(status: Increase::CheckbookListParams::Status::OrHash).void }
      attr_writer :status

      sig do
        params(
          account_number_id: String,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::CheckbookListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter Checkbooks to those attached to the specified Account Number.
        account_number_id: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        #
        # Defaults to `100`.
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_number_id: String,
            cursor: String,
            idempotency_key: String,
            limit: Integer,
            status: Increase::CheckbookListParams::Status,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Status < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckbookListParams::Status,
              Increase::Internal::AnyHash
            )
          end

        # Filter Checkbooks for those with the specified status or statuses. For GET
        # requests, this should be encoded as a comma-delimited string, such as
        # `?in=one,two,three`.
        sig do
          returns(
            T.nilable(
              T::Array[Increase::CheckbookListParams::Status::In::OrSymbol]
            )
          )
        end
        attr_reader :in_

        sig do
          params(
            in_: T::Array[Increase::CheckbookListParams::Status::In::OrSymbol]
          ).void
        end
        attr_writer :in_

        sig do
          params(
            in_: T::Array[Increase::CheckbookListParams::Status::In::OrSymbol]
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter Checkbooks for those with the specified status or statuses. For GET
          # requests, this should be encoded as a comma-delimited string, such as
          # `?in=one,two,three`.
          in_: nil
        )
        end

        sig do
          override.returns(
            {
              in_: T::Array[Increase::CheckbookListParams::Status::In::OrSymbol]
            }
          )
        end
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CheckbookListParams::Status::In)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The Checkbook is pending submission to the printer.
          PENDING_SUBMISSION =
            T.let(
              :pending_submission,
              Increase::CheckbookListParams::Status::In::TaggedSymbol
            )

          # The Checkbook has been submitted to the printer and is pending mailing.
          PENDING_MAILING =
            T.let(
              :pending_mailing,
              Increase::CheckbookListParams::Status::In::TaggedSymbol
            )

          # The Checkbook has been mailed.
          MAILED =
            T.let(
              :mailed,
              Increase::CheckbookListParams::Status::In::TaggedSymbol
            )

          # The Checkbook has been stopped and its checks can no longer be deposited.
          STOPPED =
            T.let(
              :stopped,
              Increase::CheckbookListParams::Status::In::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Increase::CheckbookListParams::Status::In::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
