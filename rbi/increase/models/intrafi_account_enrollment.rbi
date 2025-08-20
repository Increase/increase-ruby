# typed: strong

module Increase
  module Models
    class IntrafiAccountEnrollment < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::IntrafiAccountEnrollment, Increase::Internal::AnyHash)
        end

      # The identifier of this enrollment at IntraFi.
      sig { returns(String) }
      attr_accessor :id

      # The identifier of the Increase Account being swept into the network.
      sig { returns(String) }
      attr_accessor :account_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the enrollment was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The contact email for the account owner, to be shared with IntraFi.
      sig { returns(T.nilable(String)) }
      attr_accessor :email_address

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The identifier of the account in IntraFi's system. This identifier will be
      # printed on any IntraFi statements or documents.
      sig { returns(String) }
      attr_accessor :intrafi_id

      # The status of the account in the network. An account takes about one business
      # day to go from `pending_enrolling` to `enrolled`.
      sig { returns(Increase::IntrafiAccountEnrollment::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `intrafi_account_enrollment`.
      sig { returns(Increase::IntrafiAccountEnrollment::Type::TaggedSymbol) }
      attr_accessor :type

      # IntraFi is a
      # [network of financial institutions](https://www.intrafi.com/network-banks) that
      # allows Increase users to sweep funds to multiple banks. This enables accounts to
      # become eligible for additional Federal Deposit Insurance Corporation (FDIC)
      # insurance. An IntraFi Account Enrollment object represents the status of an
      # account in the network. Sweeping an account to IntraFi doesn't affect funds
      # availability.
      sig do
        params(
          id: String,
          account_id: String,
          created_at: Time,
          email_address: T.nilable(String),
          idempotency_key: T.nilable(String),
          intrafi_id: String,
          status: Increase::IntrafiAccountEnrollment::Status::OrSymbol,
          type: Increase::IntrafiAccountEnrollment::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of this enrollment at IntraFi.
        id:,
        # The identifier of the Increase Account being swept into the network.
        account_id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the enrollment was created.
        created_at:,
        # The contact email for the account owner, to be shared with IntraFi.
        email_address:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The identifier of the account in IntraFi's system. This identifier will be
        # printed on any IntraFi statements or documents.
        intrafi_id:,
        # The status of the account in the network. An account takes about one business
        # day to go from `pending_enrolling` to `enrolled`.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `intrafi_account_enrollment`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            created_at: Time,
            email_address: T.nilable(String),
            idempotency_key: T.nilable(String),
            intrafi_id: String,
            status: Increase::IntrafiAccountEnrollment::Status::TaggedSymbol,
            type: Increase::IntrafiAccountEnrollment::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The status of the account in the network. An account takes about one business
      # day to go from `pending_enrolling` to `enrolled`.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::IntrafiAccountEnrollment::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The account is being added to the IntraFi network.
        PENDING_ENROLLING =
          T.let(
            :pending_enrolling,
            Increase::IntrafiAccountEnrollment::Status::TaggedSymbol
          )

        # The account has been enrolled with IntraFi.
        ENROLLED =
          T.let(
            :enrolled,
            Increase::IntrafiAccountEnrollment::Status::TaggedSymbol
          )

        # The account is being unenrolled from IntraFi's deposit sweep.
        PENDING_UNENROLLING =
          T.let(
            :pending_unenrolling,
            Increase::IntrafiAccountEnrollment::Status::TaggedSymbol
          )

        # The account was once enrolled, but is no longer enrolled at IntraFi.
        UNENROLLED =
          T.let(
            :unenrolled,
            Increase::IntrafiAccountEnrollment::Status::TaggedSymbol
          )

        # Something unexpected happened with this account. Contact Increase support.
        REQUIRES_ATTENTION =
          T.let(
            :requires_attention,
            Increase::IntrafiAccountEnrollment::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::IntrafiAccountEnrollment::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `intrafi_account_enrollment`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::IntrafiAccountEnrollment::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INTRAFI_ACCOUNT_ENROLLMENT =
          T.let(
            :intrafi_account_enrollment,
            Increase::IntrafiAccountEnrollment::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::IntrafiAccountEnrollment::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
