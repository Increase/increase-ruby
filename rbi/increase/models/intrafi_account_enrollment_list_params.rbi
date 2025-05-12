# typed: strong

module Increase
  module Models
    class IntrafiAccountEnrollmentListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::IntrafiAccountEnrollmentListParams,
            Increase::Internal::AnyHash
          )
        end

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
        returns(T.nilable(Increase::IntrafiAccountEnrollmentListParams::Status))
      end
      attr_reader :status

      sig do
        params(
          status: Increase::IntrafiAccountEnrollmentListParams::Status::OrHash
        ).void
      end
      attr_writer :status

      sig do
        params(
          account_id: String,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::IntrafiAccountEnrollmentListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter IntraFi Account Enrollments to the one belonging to an account.
        account_id: nil,
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
            cursor: String,
            idempotency_key: String,
            limit: Integer,
            status: Increase::IntrafiAccountEnrollmentListParams::Status,
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
              Increase::IntrafiAccountEnrollmentListParams::Status,
              Increase::Internal::AnyHash
            )
          end

        # Filter IntraFi Account Enrollments for those with the specified status or
        # statuses. For GET requests, this should be encoded as a comma-delimited string,
        # such as `?in=one,two,three`.
        sig do
          returns(
            T.nilable(
              T::Array[
                Increase::IntrafiAccountEnrollmentListParams::Status::In::OrSymbol
              ]
            )
          )
        end
        attr_reader :in_

        sig do
          params(
            in_:
              T::Array[
                Increase::IntrafiAccountEnrollmentListParams::Status::In::OrSymbol
              ]
          ).void
        end
        attr_writer :in_

        sig do
          params(
            in_:
              T::Array[
                Increase::IntrafiAccountEnrollmentListParams::Status::In::OrSymbol
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter IntraFi Account Enrollments for those with the specified status or
          # statuses. For GET requests, this should be encoded as a comma-delimited string,
          # such as `?in=one,two,three`.
          in_: nil
        )
        end

        sig do
          override.returns(
            {
              in_:
                T::Array[
                  Increase::IntrafiAccountEnrollmentListParams::Status::In::OrSymbol
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
              T.all(
                Symbol,
                Increase::IntrafiAccountEnrollmentListParams::Status::In
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The account is being added to the IntraFi network.
          PENDING_ENROLLING =
            T.let(
              :pending_enrolling,
              Increase::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol
            )

          # The account has been enrolled with IntraFi.
          ENROLLED =
            T.let(
              :enrolled,
              Increase::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol
            )

          # The account is being unenrolled from IntraFi's deposit sweep.
          PENDING_UNENROLLING =
            T.let(
              :pending_unenrolling,
              Increase::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol
            )

          # The account was once enrolled, but is no longer enrolled at IntraFi.
          UNENROLLED =
            T.let(
              :unenrolled,
              Increase::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol
            )

          # Something unexpected happened with this account. Contact Increase support.
          REQUIRES_ATTENTION =
            T.let(
              :requires_attention,
              Increase::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::IntrafiAccountEnrollmentListParams::Status::In::TaggedSymbol
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
