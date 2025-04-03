# typed: strong

module Increase
  module Models
    module Simulations
      class CardDisputeActionParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # The status to move the dispute to.
        sig { returns(Increase::Models::Simulations::CardDisputeActionParams::Status::OrSymbol) }
        attr_accessor :status

        # Why the dispute was rejected. Not required for accepting disputes.
        sig { returns(T.nilable(String)) }
        attr_reader :explanation

        sig { params(explanation: String).void }
        attr_writer :explanation

        sig do
          params(
            status: Increase::Models::Simulations::CardDisputeActionParams::Status::OrSymbol,
            explanation: String,
            request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
          )
            .returns(T.attached_class)
        end
        def self.new(status:, explanation: nil, request_options: {})
        end

        sig do
          override
            .returns(
              {
                status: Increase::Models::Simulations::CardDisputeActionParams::Status::OrSymbol,
                explanation: String,
                request_options: Increase::RequestOptions
              }
            )
        end
        def to_hash
        end

        # The status to move the dispute to.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::Simulations::CardDisputeActionParams::Status) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::Simulations::CardDisputeActionParams::Status::TaggedSymbol) }

          # Increase has requested more information related to the Card Dispute from you.
          PENDING_USER_INFORMATION =
            T.let(
              :pending_user_information,
              Increase::Models::Simulations::CardDisputeActionParams::Status::TaggedSymbol
            )

          # The Card Dispute has been accepted and your funds have been returned. The card dispute will eventually transition into `won` or `lost` depending on the outcome.
          ACCEPTED = T.let(:accepted, Increase::Models::Simulations::CardDisputeActionParams::Status::TaggedSymbol)

          # The Card Dispute has been rejected.
          REJECTED = T.let(:rejected, Increase::Models::Simulations::CardDisputeActionParams::Status::TaggedSymbol)

          # The Card Dispute has been lost and funds previously credited from the acceptance have been debited.
          LOST = T.let(:lost, Increase::Models::Simulations::CardDisputeActionParams::Status::TaggedSymbol)

          # The Card Dispute has been won and no further action can be taken.
          WON = T.let(:won, Increase::Models::Simulations::CardDisputeActionParams::Status::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::Simulations::CardDisputeActionParams::Status::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end
  end
end
