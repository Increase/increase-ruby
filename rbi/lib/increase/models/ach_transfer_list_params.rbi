# typed: strong

module Increase
  module Models
    class ACHTransferListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # Filter ACH Transfers to those that originated from the specified Account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      sig { returns(T.nilable(Increase::Models::ACHTransferListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(created_at: T.any(Increase::Models::ACHTransferListParams::CreatedAt, Increase::Internal::AnyHash))
          .void
      end
      attr_writer :created_at

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Filter ACH Transfers to those made to the specified External Account.
      sig { returns(T.nilable(String)) }
      attr_reader :external_account_id

      sig { params(external_account_id: String).void }
      attr_writer :external_account_id

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

      sig { returns(T.nilable(Increase::Models::ACHTransferListParams::Status)) }
      attr_reader :status

      sig { params(status: T.any(Increase::Models::ACHTransferListParams::Status, Increase::Internal::AnyHash)).void }
      attr_writer :status

      sig do
        params(
          account_id: String,
          created_at: T.any(Increase::Models::ACHTransferListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          external_account_id: String,
          idempotency_key: String,
          limit: Integer,
          status: T.any(Increase::Models::ACHTransferListParams::Status, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        account_id: nil,
        created_at: nil,
        cursor: nil,
        external_account_id: nil,
        idempotency_key: nil,
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              account_id: String,
              created_at: Increase::Models::ACHTransferListParams::CreatedAt,
              cursor: String,
              external_account_id: String,
              idempotency_key: String,
              limit: Integer,
              status: Increase::Models::ACHTransferListParams::Status,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :after

        sig { params(after: Time).void }
        attr_writer :after

        # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :before

        sig { params(before: Time).void }
        attr_writer :before

        # Return results on or after this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_after

        sig { params(on_or_after: Time).void }
        attr_writer :on_or_after

        # Return results on or before this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_before

        sig { params(on_or_before: Time).void }
        attr_writer :on_or_before

        sig do
          params(after: Time, before: Time, on_or_after: Time, on_or_before: Time).returns(T.attached_class)
        end
        def self.new(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
        end

        sig { override.returns({after: Time, before: Time, on_or_after: Time, on_or_before: Time}) }
        def to_hash
        end
      end

      class Status < Increase::Internal::Type::BaseModel
        # Return results whose value is in the provided list. For GET requests, this
        #   should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        sig { returns(T.nilable(T::Array[Increase::Models::ACHTransferListParams::Status::In::OrSymbol])) }
        attr_reader :in_

        sig { params(in_: T::Array[Increase::Models::ACHTransferListParams::Status::In::OrSymbol]).void }
        attr_writer :in_

        sig do
          params(in_: T::Array[Increase::Models::ACHTransferListParams::Status::In::OrSymbol])
            .returns(T.attached_class)
        end
        def self.new(in_: nil)
        end

        sig { override.returns({in_: T::Array[Increase::Models::ACHTransferListParams::Status::In::OrSymbol]}) }
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::ACHTransferListParams::Status::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::ACHTransferListParams::Status::In::TaggedSymbol) }

          # The transfer is pending approval.
          PENDING_APPROVAL =
            T.let(:pending_approval, Increase::Models::ACHTransferListParams::Status::In::TaggedSymbol)

          # The transfer belongs to a Transfer Session that is pending confirmation.
          PENDING_TRANSFER_SESSION_CONFIRMATION =
            T.let(
              :pending_transfer_session_confirmation,
              Increase::Models::ACHTransferListParams::Status::In::TaggedSymbol
            )

          # The transfer has been canceled.
          CANCELED = T.let(:canceled, Increase::Models::ACHTransferListParams::Status::In::TaggedSymbol)

          # The transfer is pending submission to the Federal Reserve.
          PENDING_SUBMISSION =
            T.let(:pending_submission, Increase::Models::ACHTransferListParams::Status::In::TaggedSymbol)

          # The transfer is pending review by Increase.
          PENDING_REVIEWING =
            T.let(:pending_reviewing, Increase::Models::ACHTransferListParams::Status::In::TaggedSymbol)

          # The transfer requires attention from an Increase operator.
          REQUIRES_ATTENTION =
            T.let(:requires_attention, Increase::Models::ACHTransferListParams::Status::In::TaggedSymbol)

          # The transfer has been rejected.
          REJECTED = T.let(:rejected, Increase::Models::ACHTransferListParams::Status::In::TaggedSymbol)

          # The transfer is complete.
          SUBMITTED = T.let(:submitted, Increase::Models::ACHTransferListParams::Status::In::TaggedSymbol)

          # The transfer has been returned.
          RETURNED = T.let(:returned, Increase::Models::ACHTransferListParams::Status::In::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::ACHTransferListParams::Status::In::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end
  end
end
