# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::DigitalWalletTokenRequests#create
      class DigitalWalletTokenRequestCreateResponse < Increase::Internal::Type::BaseModel
        # @!attribute decline_reason
        #   If the simulated tokenization attempt was declined, this field contains details
        #   as to why.
        #
        #   @return [Symbol, Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::DeclineReason, nil]
        required :decline_reason,
                 enum: -> { Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::DeclineReason },
                 nil?: true

        # @!attribute digital_wallet_token_id
        #   If the simulated tokenization attempt was accepted, this field contains the id
        #   of the Digital Wallet Token that was created.
        #
        #   @return [String, nil]
        required :digital_wallet_token_id, String, nil?: true

        # @!attribute type
        #   A constant representing the object's type. For this resource it will always be
        #   `inbound_digital_wallet_token_request_simulation_result`.
        #
        #   @return [Symbol, Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::Type]
        required :type, enum: -> { Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::Type }

        # @!method initialize(decline_reason:, digital_wallet_token_id:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse} for
        #   more details.
        #
        #   The results of a Digital Wallet Token simulation.
        #
        #   @param decline_reason [Symbol, Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::DeclineReason, nil] If the simulated tokenization attempt was declined, this field contains details
        #
        #   @param digital_wallet_token_id [String, nil] If the simulated tokenization attempt was accepted, this field contains the id o
        #
        #   @param type [Symbol, Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse::Type] A constant representing the object's type. For this resource it will always be `

        # If the simulated tokenization attempt was declined, this field contains details
        # as to why.
        #
        # @see Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse#decline_reason
        module DeclineReason
          extend Increase::Internal::Type::Enum

          # The card is not active.
          CARD_NOT_ACTIVE = :card_not_active

          # The card does not have a two-factor authentication method.
          NO_VERIFICATION_METHOD = :no_verification_method

          # Your webhook timed out when evaluating the token provisioning attempt.
          WEBHOOK_TIMED_OUT = :webhook_timed_out

          # Your webhook declined the token provisioning attempt.
          WEBHOOK_DECLINED = :webhook_declined

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # A constant representing the object's type. For this resource it will always be
        # `inbound_digital_wallet_token_request_simulation_result`.
        #
        # @see Increase::Models::Simulations::DigitalWalletTokenRequestCreateResponse#type
        module Type
          extend Increase::Internal::Type::Enum

          INBOUND_DIGITAL_WALLET_TOKEN_REQUEST_SIMULATION_RESULT =
            :inbound_digital_wallet_token_request_simulation_result

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
