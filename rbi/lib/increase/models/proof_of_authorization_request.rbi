# typed: strong

module Increase
  module Models
    class ProofOfAuthorizationRequest < Increase::Internal::Type::BaseModel
      # The Proof of Authorization Request identifier.
      sig { returns(String) }
      attr_accessor :id

      # The ACH Transfers associated with the request.
      sig { returns(T::Array[Increase::Models::ProofOfAuthorizationRequest::ACHTransfer]) }
      attr_accessor :ach_transfers

      # The time the Proof of Authorization Request was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The time the Proof of Authorization Request is due.
      sig { returns(Time) }
      attr_accessor :due_on

      # A constant representing the object's type. For this resource it will always be
      #   `proof_of_authorization_request`.
      sig { returns(Increase::Models::ProofOfAuthorizationRequest::Type::TaggedSymbol) }
      attr_accessor :type

      # The time the Proof of Authorization Request was last updated.
      sig { returns(Time) }
      attr_accessor :updated_at

      # A request for proof of authorization for one or more ACH debit transfers.
      sig do
        params(
          id: String,
          ach_transfers: T::Array[T.any(Increase::Models::ProofOfAuthorizationRequest::ACHTransfer, Increase::Internal::AnyHash)],
          created_at: Time,
          due_on: Time,
          type: Increase::Models::ProofOfAuthorizationRequest::Type::OrSymbol,
          updated_at: Time
        )
          .returns(T.attached_class)
      end
      def self.new(id:, ach_transfers:, created_at:, due_on:, type:, updated_at:)
      end

      sig do
        override
          .returns(
            {
              id: String,
              ach_transfers: T::Array[Increase::Models::ProofOfAuthorizationRequest::ACHTransfer],
              created_at: Time,
              due_on: Time,
              type: Increase::Models::ProofOfAuthorizationRequest::Type::TaggedSymbol,
              updated_at: Time
            }
          )
      end
      def to_hash
      end

      class ACHTransfer < Increase::Internal::Type::BaseModel
        # The ACH Transfer identifier.
        sig { returns(String) }
        attr_accessor :id

        sig { params(id: String).returns(T.attached_class) }
        def self.new(id:)
        end

        sig { override.returns({id: String}) }
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `proof_of_authorization_request`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::ProofOfAuthorizationRequest::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::ProofOfAuthorizationRequest::Type::TaggedSymbol) }

        PROOF_OF_AUTHORIZATION_REQUEST =
          T.let(:proof_of_authorization_request, Increase::Models::ProofOfAuthorizationRequest::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::ProofOfAuthorizationRequest::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
