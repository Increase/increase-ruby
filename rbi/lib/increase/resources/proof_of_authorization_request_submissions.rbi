# typed: strong

module Increase
  module Resources
    class ProofOfAuthorizationRequestSubmissions
      # Submit Proof of Authorization
      sig do
        params(
          authorization_terms: String,
          authorized_at: Time,
          authorizer_email: String,
          authorizer_name: String,
          customer_has_been_offboarded: T::Boolean,
          proof_of_authorization_request_id: String,
          validated_account_ownership_via_credential: T::Boolean,
          validated_account_ownership_with_account_statement: T::Boolean,
          validated_account_ownership_with_microdeposit: T::Boolean,
          additional_evidence_file_id: String,
          authorizer_company: String,
          authorizer_ip_address: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::ProofOfAuthorizationRequestSubmission)
      end
      def create(
        # Terms of authorization.
        authorization_terms:,
        # Time of authorization.
        authorized_at:,
        # Email of the authorizer.
        authorizer_email:,
        # Name of the authorizer.
        authorizer_name:,
        # Whether the customer has been offboarded or suspended.
        customer_has_been_offboarded:,
        # ID of the proof of authorization request.
        proof_of_authorization_request_id:,
        # Whether the account ownership was validated via credential (e.g. Plaid).
        validated_account_ownership_via_credential:,
        # Whether the account ownership was validated with an account statement.
        validated_account_ownership_with_account_statement:,
        # Whether the account ownership was validated with a microdeposit.
        validated_account_ownership_with_microdeposit:,
        # File containing additional evidence.
        additional_evidence_file_id: nil,
        # Company of the authorizer.
        authorizer_company: nil,
        # IP address of the authorizer.
        authorizer_ip_address: nil,
        request_options: {}
      )
      end

      # Retrieve a Proof of Authorization Request Submission
      sig do
        params(
          proof_of_authorization_request_submission_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::ProofOfAuthorizationRequestSubmission)
      end
      def retrieve(
        # The identifier of the Proof of Authorization Request Submission.
        proof_of_authorization_request_submission_id,
        request_options: {}
      )
      end

      # List Proof of Authorization Request Submissions
      sig do
        params(
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          proof_of_authorization_request_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::ProofOfAuthorizationRequestSubmission])
      end
      def list(
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        #   that object. This value is unique across Increase and is used to ensure that a
        #   request is only processed once. Learn more about
        #   [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
        limit: nil,
        # ID of the proof of authorization request.
        proof_of_authorization_request_id: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
