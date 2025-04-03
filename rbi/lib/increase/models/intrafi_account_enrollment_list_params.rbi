# typed: strong

module Increase
  module Models
    class IntrafiAccountEnrollmentListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # Filter IntraFi Account Enrollments to the one belonging to an account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

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

      sig { returns(T.nilable(Increase::Models::IntrafiAccountEnrollmentListParams::Status)) }
      attr_reader :status

      sig do
        params(
          status: T.any(Increase::Models::IntrafiAccountEnrollmentListParams::Status, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :status

      sig do
        params(
          account_id: String,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: T.any(Increase::Models::IntrafiAccountEnrollmentListParams::Status, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        account_id: nil,
        cursor: nil,
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
              cursor: String,
              idempotency_key: String,
              limit: Integer,
              status: Increase::Models::IntrafiAccountEnrollmentListParams::Status,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class Status < Increase::Internal::Type::BaseModel
        # Filter IntraFi Account Enrollments for those with the specified status or
        #   statuses. For GET requests, this should be encoded as a comma-delimited string,
        #   such as `?in=one,two,three`.
        sig { returns(T.nilable(T::Array[Increase::Models::IntrafiAccountEnrollmentListParams::Status::In::OrSymbol])) }
        attr_reader :in_

        sig { params(in_: T::Array[Increase::Models::IntrafiAccountEnrollmentListParams::Status::In::OrSymbol]).void }
        attr_writer :in_

        sig do
          params(in_: T::Array[Increase::Models::IntrafiAccountEnrollmentListParams::Status::In::OrSymbol])
            .returns(T.attached_class)
        end
        def self.new(in_: nil)
        end

        sig do
          override
            .returns({in_: T::Array[Increase::Models::IntrafiAccountEnrollmentListParams::Status::In::OrSymbol]})
        end
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::IntrafiAccountEnrollmentListParams::Status::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol) }

          # The account is being added to the IntraFi network.
          PENDING_ENROLLING =
            T.let(:pending_enrolling, Increase::Models::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol)

          # The account has been enrolled with IntraFi.
          ENROLLED =
            T.let(:enrolled, Increase::Models::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol)

          # The account is being unenrolled from IntraFi's deposit sweep.
          PENDING_UNENROLLING =
            T.let(
              :pending_unenrolling,
              Increase::Models::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol
            )

          # The account was once enrolled, but is no longer enrolled at IntraFi.
          UNENROLLED =
            T.let(:unenrolled, Increase::Models::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol)

          # Something unexpected happened with this account. Contact Increase support.
          REQUIRES_ATTENTION =
            T.let(:requires_attention, Increase::Models::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end
  end
end
