# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckTransfers#stop_payment
    class CheckTransferStopPaymentParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute [r] reason
      #   The reason why this transfer should be stopped.
      #
      #   @return [Symbol, Increase::Models::CheckTransferStopPaymentParams::Reason, nil]
      optional :reason, enum: -> { Increase::Models::CheckTransferStopPaymentParams::Reason }

      # @!parse
      #   # @return [Symbol, Increase::Models::CheckTransferStopPaymentParams::Reason]
      #   attr_writer :reason

      # @!parse
      #   # @param reason [Symbol, Increase::Models::CheckTransferStopPaymentParams::Reason]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(reason: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # The reason why this transfer should be stopped.
      module Reason
        extend Increase::Internal::Type::Enum

        # The check could not be delivered.
        MAIL_DELIVERY_FAILED = :mail_delivery_failed

        # The check was not authorized.
        NOT_AUTHORIZED = :not_authorized

        # The check was stopped for another reason.
        UNKNOWN = :unknown

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
