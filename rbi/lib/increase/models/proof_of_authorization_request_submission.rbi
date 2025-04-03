# typed: strong

module Increase
  module Models
    class ProofOfAuthorizationRequestSubmission < Increase::Internal::Type::BaseModel
      # The Proof of Authorization Request Submission identifier.
      sig { returns(String) }
      attr_accessor :id

      # File containing additional evidence.
      sig { returns(T.nilable(String)) }
      attr_accessor :additional_evidence_file_id

      # Terms of authorization.
      sig { returns(String) }
      attr_accessor :authorization_terms

      # Time of authorization.
      sig { returns(Time) }
      attr_accessor :authorized_at

      # Company of the authorizer.
      sig { returns(T.nilable(String)) }
      attr_accessor :authorizer_company

      # Email of the authorizer.
      sig { returns(T.nilable(String)) }
      attr_accessor :authorizer_email

      # IP address of the authorizer.
      sig { returns(T.nilable(String)) }
      attr_accessor :authorizer_ip_address

      # Name of the authorizer.
      sig { returns(T.nilable(String)) }
      attr_accessor :authorizer_name

      # The time the Proof of Authorization Request Submission was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # Whether the customer has been offboarded.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :customer_has_been_offboarded

      # The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # ID of the proof of authorization request.
      sig { returns(String) }
      attr_accessor :proof_of_authorization_request_id

      # Status of the proof of authorization request submission.
      sig { returns(Increase::Models::ProofOfAuthorizationRequestSubmission::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      #   `proof_of_authorization_request_submission`.
      sig { returns(Increase::Models::ProofOfAuthorizationRequestSubmission::Type::TaggedSymbol) }
      attr_accessor :type

      # The time the Proof of Authorization Request Submission was last updated.
      sig { returns(Time) }
      attr_accessor :updated_at

      # Whether account ownership was validated via credential (for instance, Plaid).
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :validated_account_ownership_via_credential

      # Whether account ownership was validated with an account statement.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :validated_account_ownership_with_account_statement

      # Whether account ownership was validated with microdeposit.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :validated_account_ownership_with_microdeposit

      # Information submitted in response to a proof of authorization request. Per
      #   Nacha's guidance on proof of authorization, the originator must ensure that the
      #   authorization complies with applicable legal requirements, is readily
      #   identifiable as an authorization, and has clear and readily understandable
      #   terms.
      sig do
        params(
          id: String,
          additional_evidence_file_id: T.nilable(String),
          authorization_terms: String,
          authorized_at: Time,
          authorizer_company: T.nilable(String),
          authorizer_email: T.nilable(String),
          authorizer_ip_address: T.nilable(String),
          authorizer_name: T.nilable(String),
          created_at: Time,
          customer_has_been_offboarded: T.nilable(T::Boolean),
          idempotency_key: T.nilable(String),
          proof_of_authorization_request_id: String,
          status: Increase::Models::ProofOfAuthorizationRequestSubmission::Status::OrSymbol,
          type: Increase::Models::ProofOfAuthorizationRequestSubmission::Type::OrSymbol,
          updated_at: Time,
          validated_account_ownership_via_credential: T.nilable(T::Boolean),
          validated_account_ownership_with_account_statement: T.nilable(T::Boolean),
          validated_account_ownership_with_microdeposit: T.nilable(T::Boolean)
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        additional_evidence_file_id:,
        authorization_terms:,
        authorized_at:,
        authorizer_company:,
        authorizer_email:,
        authorizer_ip_address:,
        authorizer_name:,
        created_at:,
        customer_has_been_offboarded:,
        idempotency_key:,
        proof_of_authorization_request_id:,
        status:,
        type:,
        updated_at:,
        validated_account_ownership_via_credential:,
        validated_account_ownership_with_account_statement:,
        validated_account_ownership_with_microdeposit:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              additional_evidence_file_id: T.nilable(String),
              authorization_terms: String,
              authorized_at: Time,
              authorizer_company: T.nilable(String),
              authorizer_email: T.nilable(String),
              authorizer_ip_address: T.nilable(String),
              authorizer_name: T.nilable(String),
              created_at: Time,
              customer_has_been_offboarded: T.nilable(T::Boolean),
              idempotency_key: T.nilable(String),
              proof_of_authorization_request_id: String,
              status: Increase::Models::ProofOfAuthorizationRequestSubmission::Status::TaggedSymbol,
              type: Increase::Models::ProofOfAuthorizationRequestSubmission::Type::TaggedSymbol,
              updated_at: Time,
              validated_account_ownership_via_credential: T.nilable(T::Boolean),
              validated_account_ownership_with_account_statement: T.nilable(T::Boolean),
              validated_account_ownership_with_microdeposit: T.nilable(T::Boolean)
            }
          )
      end
      def to_hash
      end

      # Status of the proof of authorization request submission.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Models::ProofOfAuthorizationRequestSubmission::Status) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::ProofOfAuthorizationRequestSubmission::Status::TaggedSymbol) }

        # The proof of authorization request submission is pending review.
        PENDING_REVIEW =
          T.let(:pending_review, Increase::Models::ProofOfAuthorizationRequestSubmission::Status::TaggedSymbol)

        # The proof of authorization request submission was rejected.
        REJECTED =
          T.let(:rejected, Increase::Models::ProofOfAuthorizationRequestSubmission::Status::TaggedSymbol)

        # The proof of authorization request submission was canceled and replaced with another.
        CANCELED =
          T.let(:canceled, Increase::Models::ProofOfAuthorizationRequestSubmission::Status::TaggedSymbol)

        # The proof of authorization request submission is pending sending.
        PENDING_SENDING =
          T.let(:pending_sending, Increase::Models::ProofOfAuthorizationRequestSubmission::Status::TaggedSymbol)

        # The proof of authorization request submission was sent.
        SENT = T.let(:sent, Increase::Models::ProofOfAuthorizationRequestSubmission::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::ProofOfAuthorizationRequestSubmission::Status::TaggedSymbol]) }
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `proof_of_authorization_request_submission`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Models::ProofOfAuthorizationRequestSubmission::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::ProofOfAuthorizationRequestSubmission::Type::TaggedSymbol) }

        PROOF_OF_AUTHORIZATION_REQUEST_SUBMISSION =
          T.let(
            :proof_of_authorization_request_submission,
            Increase::Models::ProofOfAuthorizationRequestSubmission::Type::TaggedSymbol
          )

        sig { override.returns(T::Array[Increase::Models::ProofOfAuthorizationRequestSubmission::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
