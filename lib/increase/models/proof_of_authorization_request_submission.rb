# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ProofOfAuthorizationRequestSubmissions#create
    class ProofOfAuthorizationRequestSubmission < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Proof of Authorization Request Submission identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute additional_evidence_file_id
      #   File containing additional evidence.
      #
      #   @return [String, nil]
      required :additional_evidence_file_id, String, nil?: true

      # @!attribute authorization_terms
      #   Terms of authorization.
      #
      #   @return [String]
      required :authorization_terms, String

      # @!attribute authorized_at
      #   Time of authorization.
      #
      #   @return [Time]
      required :authorized_at, Time

      # @!attribute authorizer_company
      #   Company of the authorizer.
      #
      #   @return [String, nil]
      required :authorizer_company, String, nil?: true

      # @!attribute authorizer_email
      #   Email of the authorizer.
      #
      #   @return [String, nil]
      required :authorizer_email, String, nil?: true

      # @!attribute authorizer_ip_address
      #   IP address of the authorizer.
      #
      #   @return [String, nil]
      required :authorizer_ip_address, String, nil?: true

      # @!attribute authorizer_name
      #   Name of the authorizer.
      #
      #   @return [String, nil]
      required :authorizer_name, String, nil?: true

      # @!attribute created_at
      #   The time the Proof of Authorization Request Submission was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute customer_has_been_offboarded
      #   Whether the customer has been offboarded.
      #
      #   @return [Boolean, nil]
      required :customer_has_been_offboarded, Increase::Internal::Type::BooleanModel, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute proof_of_authorization_request_id
      #   ID of the proof of authorization request.
      #
      #   @return [String]
      required :proof_of_authorization_request_id, String

      # @!attribute status
      #   Status of the proof of authorization request submission.
      #
      #   @return [Symbol, Increase::Models::ProofOfAuthorizationRequestSubmission::Status]
      required :status, enum: -> { Increase::Models::ProofOfAuthorizationRequestSubmission::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `proof_of_authorization_request_submission`.
      #
      #   @return [Symbol, Increase::Models::ProofOfAuthorizationRequestSubmission::Type]
      required :type, enum: -> { Increase::Models::ProofOfAuthorizationRequestSubmission::Type }

      # @!attribute updated_at
      #   The time the Proof of Authorization Request Submission was last updated.
      #
      #   @return [Time]
      required :updated_at, Time

      # @!attribute validated_account_ownership_via_credential
      #   Whether account ownership was validated via credential (for instance, Plaid).
      #
      #   @return [Boolean, nil]
      required :validated_account_ownership_via_credential, Increase::Internal::Type::BooleanModel, nil?: true

      # @!attribute validated_account_ownership_with_account_statement
      #   Whether account ownership was validated with an account statement.
      #
      #   @return [Boolean, nil]
      required :validated_account_ownership_with_account_statement,
               Increase::Internal::Type::BooleanModel,
               nil?: true

      # @!attribute validated_account_ownership_with_microdeposit
      #   Whether account ownership was validated with microdeposit.
      #
      #   @return [Boolean, nil]
      required :validated_account_ownership_with_microdeposit,
               Increase::Internal::Type::BooleanModel,
               nil?: true

      # @!parse
      #   # Information submitted in response to a proof of authorization request. Per
      #   #   Nacha's guidance on proof of authorization, the originator must ensure that the
      #   #   authorization complies with applicable legal requirements, is readily
      #   #   identifiable as an authorization, and has clear and readily understandable
      #   #   terms.
      #   #
      #   # @param id [String]
      #   # @param additional_evidence_file_id [String, nil]
      #   # @param authorization_terms [String]
      #   # @param authorized_at [Time]
      #   # @param authorizer_company [String, nil]
      #   # @param authorizer_email [String, nil]
      #   # @param authorizer_ip_address [String, nil]
      #   # @param authorizer_name [String, nil]
      #   # @param created_at [Time]
      #   # @param customer_has_been_offboarded [Boolean, nil]
      #   # @param idempotency_key [String, nil]
      #   # @param proof_of_authorization_request_id [String]
      #   # @param status [Symbol, Increase::Models::ProofOfAuthorizationRequestSubmission::Status]
      #   # @param type [Symbol, Increase::Models::ProofOfAuthorizationRequestSubmission::Type]
      #   # @param updated_at [Time]
      #   # @param validated_account_ownership_via_credential [Boolean, nil]
      #   # @param validated_account_ownership_with_account_statement [Boolean, nil]
      #   # @param validated_account_ownership_with_microdeposit [Boolean, nil]
      #   #
      #   def initialize(
      #     id:,
      #     additional_evidence_file_id:,
      #     authorization_terms:,
      #     authorized_at:,
      #     authorizer_company:,
      #     authorizer_email:,
      #     authorizer_ip_address:,
      #     authorizer_name:,
      #     created_at:,
      #     customer_has_been_offboarded:,
      #     idempotency_key:,
      #     proof_of_authorization_request_id:,
      #     status:,
      #     type:,
      #     updated_at:,
      #     validated_account_ownership_via_credential:,
      #     validated_account_ownership_with_account_statement:,
      #     validated_account_ownership_with_microdeposit:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # Status of the proof of authorization request submission.
      #
      # @see Increase::Models::ProofOfAuthorizationRequestSubmission#status
      module Status
        extend Increase::Internal::Type::Enum

        # The proof of authorization request submission is pending review.
        PENDING_REVIEW = :pending_review

        # The proof of authorization request submission was rejected.
        REJECTED = :rejected

        # The proof of authorization request submission was canceled and replaced with another.
        CANCELED = :canceled

        # The proof of authorization request submission is pending sending.
        PENDING_SENDING = :pending_sending

        # The proof of authorization request submission was sent.
        SENT = :sent

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `proof_of_authorization_request_submission`.
      #
      # @see Increase::Models::ProofOfAuthorizationRequestSubmission#type
      module Type
        extend Increase::Internal::Type::Enum

        PROOF_OF_AUTHORIZATION_REQUEST_SUBMISSION = :proof_of_authorization_request_submission

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
