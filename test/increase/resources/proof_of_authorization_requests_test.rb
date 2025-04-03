# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::ProofOfAuthorizationRequestsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.proof_of_authorization_requests.retrieve("proof_of_authorization_request_id")

    assert_pattern do
      response => Increase::Models::ProofOfAuthorizationRequest
    end

    assert_pattern do
      response => {
        id: String,
        ach_transfers: ^(Increase::Internal::Type::ArrayOf[Increase::Models::ProofOfAuthorizationRequest::ACHTransfer]),
        created_at: Time,
        due_on: Time,
        type: Increase::Models::ProofOfAuthorizationRequest::Type,
        updated_at: Time
      }
    end
  end

  def test_list
    response = @increase.proof_of_authorization_requests.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Models::ProofOfAuthorizationRequest
    end

    assert_pattern do
      row => {
        id: String,
        ach_transfers: ^(Increase::Internal::Type::ArrayOf[Increase::Models::ProofOfAuthorizationRequest::ACHTransfer]),
        created_at: Time,
        due_on: Time,
        type: Increase::Models::ProofOfAuthorizationRequest::Type,
        updated_at: Time
      }
    end
  end
end
