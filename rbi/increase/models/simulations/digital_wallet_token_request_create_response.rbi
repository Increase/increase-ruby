# typed: strong

module Increase
  module Models
    module Simulations
      class DigitalWalletTokenRequestCreateResponse < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # If the simulated tokenization attempt was declined, this field contains details
        # as to why.
        sig do
          returns(
            T.nilable(
              Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::DeclineReason::TaggedSymbol
            )
          )
        end
        attr_accessor :decline_reason

        # If the simulated tokenization attempt was accepted, this field contains the id
        # of the Digital Wallet Token that was created.
        sig { returns(T.nilable(String)) }
        attr_accessor :digital_wallet_token_id

        # A constant representing the object's type. For this resource it will always be
        # `inbound_digital_wallet_token_request_simulation_result`.
        sig do
          returns(
            Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The results of a Digital Wallet Token simulation.
        sig do
          params(
            decline_reason:
              T.nilable(
                Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::DeclineReason::OrSymbol
              ),
            digital_wallet_token_id: T.nilable(String),
            type:
              Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # If the simulated tokenization attempt was declined, this field contains details
          # as to why.
          decline_reason:,
          # If the simulated tokenization attempt was accepted, this field contains the id
          # of the Digital Wallet Token that was created.
          digital_wallet_token_id:,
          # A constant representing the object's type. For this resource it will always be
          # `inbound_digital_wallet_token_request_simulation_result`.
          type:
        )
        end

        sig do
          override.returns(
            {
              decline_reason:
                T.nilable(
                  Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::DeclineReason::TaggedSymbol
                ),
              digital_wallet_token_id: T.nilable(String),
              type:
                Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # If the simulated tokenization attempt was declined, this field contains details
        # as to why.
        module DeclineReason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::DeclineReason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The card is not active.
          CARD_NOT_ACTIVE =
            T.let(
              :card_not_active,
              Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::DeclineReason::TaggedSymbol
            )

          # The card does not have a two-factor authentication method.
          NO_VERIFICATION_METHOD =
            T.let(
              :no_verification_method,
              Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::DeclineReason::TaggedSymbol
            )

          # Your webhook timed out when evaluating the token provisioning attempt.
          WEBHOOK_TIMED_OUT =
            T.let(
              :webhook_timed_out,
              Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::DeclineReason::TaggedSymbol
            )

          # Your webhook declined the token provisioning attempt.
          WEBHOOK_DECLINED =
            T.let(
              :webhook_declined,
              Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::DeclineReason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::DeclineReason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # A constant representing the object's type. For this resource it will always be
        # `inbound_digital_wallet_token_request_simulation_result`.
        module Type
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INBOUND_DIGITAL_WALLET_TOKEN_REQUEST_SIMULATION_RESULT =
            T.let(
              :inbound_digital_wallet_token_request_simulation_result,
              Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::Type::TaggedSymbol
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
