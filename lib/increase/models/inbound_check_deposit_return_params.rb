# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundCheckDeposits#return_
    class InboundCheckDepositReturnParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute reason
      #   The reason to return the Inbound Check Deposit.
      #
      #   @return [Symbol, Increase::Models::InboundCheckDepositReturnParams::Reason]
      required :reason, enum: -> { Increase::InboundCheckDepositReturnParams::Reason }

      # @!method initialize(reason:, request_options: {})
      #   @param reason [Symbol, Increase::Models::InboundCheckDepositReturnParams::Reason] The reason to return the Inbound Check Deposit.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The reason to return the Inbound Check Deposit.
      module Reason
        extend Increase::Internal::Type::Enum

        # The check was altered or fictitious.
        ALTERED_OR_FICTITIOUS = :altered_or_fictitious

        # The check was not authorized.
        NOT_AUTHORIZED = :not_authorized

        # The check was a duplicate presentment.
        DUPLICATE_PRESENTMENT = :duplicate_presentment

        # The check was not endorsed.
        ENDORSEMENT_MISSING = :endorsement_missing

        # The check was not endorsed by the payee.
        ENDORSEMENT_IRREGULAR = :endorsement_irregular

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
