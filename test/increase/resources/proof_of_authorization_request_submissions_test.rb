# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::ProofOfAuthorizationRequestSubmissionsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.proof_of_authorization_request_submissions.create(
        authorization_terms: "I agree to the terms of service.",
        authorized_at: "2020-01-31T23:59:59Z",
        authorizer_email: "user@example.com",
        authorizer_name: "Ian Crease",
        customer_has_been_offboarded: true,
        proof_of_authorization_request_id: "proof_of_authorization_request_iwp8no25h3rjvil6ad3b",
        validated_account_ownership_via_credential: true,
        validated_account_ownership_with_account_statement: true,
        validated_account_ownership_with_microdeposit: true
      )

    assert_pattern do
      response => Increase::Models::ProofOfAuthorizationRequestSubmission
    end

    assert_pattern do
      response => {
        id: String,
        additional_evidence_file_id: String | nil,
        authorization_terms: String,
        authorized_at: Time,
        authorizer_company: String | nil,
        authorizer_email: String | nil,
        authorizer_ip_address: String | nil,
        authorizer_name: String | nil,
        created_at: Time,
        customer_has_been_offboarded: Increase::Internal::Type::BooleanModel | nil,
        idempotency_key: String | nil,
        proof_of_authorization_request_id: String,
        status: Increase::Models::ProofOfAuthorizationRequestSubmission::Status,
        type: Increase::Models::ProofOfAuthorizationRequestSubmission::Type,
        updated_at: Time,
        validated_account_ownership_via_credential: Increase::Internal::Type::BooleanModel | nil,
        validated_account_ownership_with_account_statement: Increase::Internal::Type::BooleanModel | nil,
        validated_account_ownership_with_microdeposit: Increase::Internal::Type::BooleanModel | nil
      }
    end
  end

  def test_retrieve
    response =
      @increase.proof_of_authorization_request_submissions.retrieve(
        "proof_of_authorization_request_submission_id"
      )

    assert_pattern do
      response => Increase::Models::ProofOfAuthorizationRequestSubmission
    end

    assert_pattern do
      response => {
        id: String,
        additional_evidence_file_id: String | nil,
        authorization_terms: String,
        authorized_at: Time,
        authorizer_company: String | nil,
        authorizer_email: String | nil,
        authorizer_ip_address: String | nil,
        authorizer_name: String | nil,
        created_at: Time,
        customer_has_been_offboarded: Increase::Internal::Type::BooleanModel | nil,
        idempotency_key: String | nil,
        proof_of_authorization_request_id: String,
        status: Increase::Models::ProofOfAuthorizationRequestSubmission::Status,
        type: Increase::Models::ProofOfAuthorizationRequestSubmission::Type,
        updated_at: Time,
        validated_account_ownership_via_credential: Increase::Internal::Type::BooleanModel | nil,
        validated_account_ownership_with_account_statement: Increase::Internal::Type::BooleanModel | nil,
        validated_account_ownership_with_microdeposit: Increase::Internal::Type::BooleanModel | nil
      }
    end
  end

  def test_list
    response = @increase.proof_of_authorization_request_submissions.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Models::ProofOfAuthorizationRequestSubmission
    end

    assert_pattern do
      row => {
        id: String,
        additional_evidence_file_id: String | nil,
        authorization_terms: String,
        authorized_at: Time,
        authorizer_company: String | nil,
        authorizer_email: String | nil,
        authorizer_ip_address: String | nil,
        authorizer_name: String | nil,
        created_at: Time,
        customer_has_been_offboarded: Increase::Internal::Type::BooleanModel | nil,
        idempotency_key: String | nil,
        proof_of_authorization_request_id: String,
        status: Increase::Models::ProofOfAuthorizationRequestSubmission::Status,
        type: Increase::Models::ProofOfAuthorizationRequestSubmission::Type,
        updated_at: Time,
        validated_account_ownership_via_credential: Increase::Internal::Type::BooleanModel | nil,
        validated_account_ownership_with_account_statement: Increase::Internal::Type::BooleanModel | nil,
        validated_account_ownership_with_microdeposit: Increase::Internal::Type::BooleanModel | nil
      }
    end
  end
end
