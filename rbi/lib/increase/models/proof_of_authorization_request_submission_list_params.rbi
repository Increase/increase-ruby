# typed: strong

module Increase
  module Models
    class ProofOfAuthorizationRequestSubmissionListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

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

      # ID of the proof of authorization request.
      sig { returns(T.nilable(String)) }
      attr_reader :proof_of_authorization_request_id

      sig { params(proof_of_authorization_request_id: String).void }
      attr_writer :proof_of_authorization_request_id

      sig do
        params(
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          proof_of_authorization_request_id: String,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        cursor: nil,
        idempotency_key: nil,
        limit: nil,
        proof_of_authorization_request_id: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              cursor: String,
              idempotency_key: String,
              limit: Integer,
              proof_of_authorization_request_id: String,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
