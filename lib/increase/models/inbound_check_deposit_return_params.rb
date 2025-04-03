# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundCheckDeposits#return_
    class InboundCheckDepositReturnParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute reason
      #   The reason to return the Inbound Check Deposit.
      #
      #   @return [Symbol, Increase::Models::InboundCheckDepositReturnParams::Reason]
      required :reason, enum: -> { Increase::Models::InboundCheckDepositReturnParams::Reason }

      # @!parse
      #   # @param reason [Symbol, Increase::Models::InboundCheckDepositReturnParams::Reason]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(reason:, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
