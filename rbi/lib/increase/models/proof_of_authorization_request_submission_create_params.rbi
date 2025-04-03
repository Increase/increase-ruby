# typed: strong

module Increase
  module Models
    class ProofOfAuthorizationRequestSubmissionCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # Terms of authorization.
      sig { returns(String) }
      attr_accessor :authorization_terms

      # Time of authorization.
      sig { returns(Time) }
      attr_accessor :authorized_at

      # Email of the authorizer.
      sig { returns(String) }
      attr_accessor :authorizer_email

      # Name of the authorizer.
      sig { returns(String) }
      attr_accessor :authorizer_name

      # Whether the customer has been offboarded or suspended.
      sig { returns(T::Boolean) }
      attr_accessor :customer_has_been_offboarded

      # ID of the proof of authorization request.
      sig { returns(String) }
      attr_accessor :proof_of_authorization_request_id

      # Whether the account ownership was validated via credential (e.g. Plaid).
      sig { returns(T::Boolean) }
      attr_accessor :validated_account_ownership_via_credential

      # Whether the account ownership was validated with an account statement.
      sig { returns(T::Boolean) }
      attr_accessor :validated_account_ownership_with_account_statement

      # Whether the account ownership was validated with a microdeposit.
      sig { returns(T::Boolean) }
      attr_accessor :validated_account_ownership_with_microdeposit

      # File containing additional evidence.
      sig { returns(T.nilable(String)) }
      attr_reader :additional_evidence_file_id

      sig { params(additional_evidence_file_id: String).void }
      attr_writer :additional_evidence_file_id

      # Company of the authorizer.
      sig { returns(T.nilable(String)) }
      attr_reader :authorizer_company

      sig { params(authorizer_company: String).void }
      attr_writer :authorizer_company

      # IP address of the authorizer.
      sig { returns(T.nilable(String)) }
      attr_reader :authorizer_ip_address

      sig { params(authorizer_ip_address: String).void }
      attr_writer :authorizer_ip_address

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
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        authorization_terms:,
        authorized_at:,
        authorizer_email:,
        authorizer_name:,
        customer_has_been_offboarded:,
        proof_of_authorization_request_id:,
        validated_account_ownership_via_credential:,
        validated_account_ownership_with_account_statement:,
        validated_account_ownership_with_microdeposit:,
        additional_evidence_file_id: nil,
        authorizer_company: nil,
        authorizer_ip_address: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
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
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
