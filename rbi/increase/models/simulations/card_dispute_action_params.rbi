# typed: strong

module Increase
  module Models
    module Simulations
      class CardDisputeActionParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # The status to move the dispute to.
        sig do
          returns(
            Increase::Simulations::CardDisputeActionParams::Status::OrSymbol
          )
        end
        attr_accessor :status

        # Why the dispute was rejected. Not required for accepting disputes.
        sig { returns(T.nilable(String)) }
        attr_reader :explanation

        sig { params(explanation: String).void }
        attr_writer :explanation

        sig do
          params(
            status:
              Increase::Simulations::CardDisputeActionParams::Status::OrSymbol,
            explanation: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The status to move the dispute to.
          status:,
          # Why the dispute was rejected. Not required for accepting disputes.
          explanation: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              status:
                Increase::Simulations::CardDisputeActionParams::Status::OrSymbol,
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
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::CardDisputeActionParams::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Increase has requested more information related to the Card Dispute from you.
          PENDING_USER_INFORMATION =
            T.let(
              :pending_user_information,
              Increase::Simulations::CardDisputeActionParams::Status::TaggedSymbol
            )

          # The Card Dispute has been accepted and your funds have been returned. The card dispute will eventually transition into `won` or `lost` depending on the outcome.
          ACCEPTED =
            T.let(
              :accepted,
              Increase::Simulations::CardDisputeActionParams::Status::TaggedSymbol
            )

          # The Card Dispute has been rejected.
          REJECTED =
            T.let(
              :rejected,
              Increase::Simulations::CardDisputeActionParams::Status::TaggedSymbol
            )

          # The Card Dispute has been lost and funds previously credited from the acceptance have been debited.
          LOST =
            T.let(
              :lost,
              Increase::Simulations::CardDisputeActionParams::Status::TaggedSymbol
            )

          # The Card Dispute has been won and no further action can be taken.
          WON =
            T.let(
              :won,
              Increase::Simulations::CardDisputeActionParams::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::CardDisputeActionParams::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
