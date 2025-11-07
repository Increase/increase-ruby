# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckTransfers#stop_payment
    class CheckTransferStopPaymentParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute reason
      #   The reason why this transfer should be stopped.
      #
      #   @return [Symbol, Increase::Models::CheckTransferStopPaymentParams::Reason, nil]
      optional :reason, enum: -> { Increase::CheckTransferStopPaymentParams::Reason }

      # @!method initialize(reason: nil, request_options: {})
      #   @param reason [Symbol, Increase::Models::CheckTransferStopPaymentParams::Reason] The reason why this transfer should be stopped.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The reason why this transfer should be stopped.
      module Reason
        extend Increase::Internal::Type::Enum

        # The check could not be delivered.
        MAIL_DELIVERY_FAILED = :mail_delivery_failed

        # The check was not authorized.
        NOT_AUTHORIZED = :not_authorized

        # The check was stopped for `valid_until_date` being in the past.
        VALID_UNTIL_DATE_PASSED = :valid_until_date_passed

        # The check was stopped for another reason.
        UNKNOWN = :unknown

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
