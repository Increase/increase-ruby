# frozen_string_literal: true

module Increase
  module Resources
    class RealTimeDecisions
      # Retrieve a Real-Time Decision
      #
      # @overload retrieve(real_time_decision_id, request_options: {})
      #
      # @param real_time_decision_id [String] The identifier of the Real-Time Decision.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::RealTimeDecision]
      #
      # @see Increase::Models::RealTimeDecisionRetrieveParams
      def retrieve(real_time_decision_id, params = {})
        @client.request(
          method: :get,
          path: ["real_time_decisions/%1$s", real_time_decision_id],
          model: Increase::RealTimeDecision,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::RealTimeDecisionActionParams} for more details.
      #
      # Action a Real-Time Decision
      #
      # @overload action(real_time_decision_id, card_authentication: nil, card_authentication_challenge: nil, card_authorization: nil, card_balance_inquiry: nil, digital_wallet_authentication: nil, digital_wallet_token: nil, request_options: {})
      #
      # @param real_time_decision_id [String] The identifier of the Real-Time Decision.
      #
      # @param card_authentication [Increase::Models::RealTimeDecisionActionParams::CardAuthentication] If the Real-Time Decision relates to a 3DS card authentication attempt, this obj
      #
      # @param card_authentication_challenge [Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge] If the Real-Time Decision relates to 3DS card authentication challenge delivery,
      #
      # @param card_authorization [Increase::Models::RealTimeDecisionActionParams::CardAuthorization] If the Real-Time Decision relates to a card authorization attempt, this object c
      #
      # @param card_balance_inquiry [Increase::Models::RealTimeDecisionActionParams::CardBalanceInquiry] If the Real-Time Decision relates to a card balance inquiry attempt, this object
      #
      # @param digital_wallet_authentication [Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication] If the Real-Time Decision relates to a digital wallet authentication attempt, th
      #
      # @param digital_wallet_token [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken] If the Real-Time Decision relates to a digital wallet token provisioning attempt
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::RealTimeDecision]
      #
      # @see Increase::Models::RealTimeDecisionActionParams
      def action(real_time_decision_id, params = {})
        parsed, options = Increase::RealTimeDecisionActionParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["real_time_decisions/%1$s/action", real_time_decision_id],
          body: parsed,
          model: Increase::RealTimeDecision,
          options: options
        )
      end

      # @api private
      #
      # @param client [Increase::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
