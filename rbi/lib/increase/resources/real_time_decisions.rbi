# typed: strong

module Increase
  module Resources
    class RealTimeDecisions
      # Retrieve a Real-Time Decision
      sig do
        params(
          real_time_decision_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::RealTimeDecision)
      end
      def retrieve(
        # The identifier of the Real-Time Decision.
        real_time_decision_id,
        request_options: {}
      )
      end

      # Action a Real-Time Decision
      sig do
        params(
          real_time_decision_id: String,
          card_authentication: T.any(Increase::Models::RealTimeDecisionActionParams::CardAuthentication, Increase::Internal::AnyHash),
          card_authentication_challenge: T.any(
            Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge,
            Increase::Internal::AnyHash
          ),
          card_authorization: T.any(Increase::Models::RealTimeDecisionActionParams::CardAuthorization, Increase::Internal::AnyHash),
          digital_wallet_authentication: T.any(
            Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication,
            Increase::Internal::AnyHash
          ),
          digital_wallet_token: T.any(Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken, Increase::Internal::AnyHash),
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::RealTimeDecision)
      end
      def action(
        # The identifier of the Real-Time Decision.
        real_time_decision_id,
        # If the Real-Time Decision relates to a 3DS card authentication attempt, this
        #   object contains your response to the authentication.
        card_authentication: nil,
        # If the Real-Time Decision relates to 3DS card authentication challenge delivery,
        #   this object contains your response.
        card_authentication_challenge: nil,
        # If the Real-Time Decision relates to a card authorization attempt, this object
        #   contains your response to the authorization.
        card_authorization: nil,
        # If the Real-Time Decision relates to a digital wallet authentication attempt,
        #   this object contains your response to the authentication.
        digital_wallet_authentication: nil,
        # If the Real-Time Decision relates to a digital wallet token provisioning
        #   attempt, this object contains your response to the attempt.
        digital_wallet_token: nil,
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
