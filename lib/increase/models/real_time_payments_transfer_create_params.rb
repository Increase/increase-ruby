# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RealTimePaymentsTransfers#create
    class RealTimePaymentsTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute amount
      #   The transfer amount in USD cents. For Real-Time Payments transfers, must be
      #   positive.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute creditor_name
      #   The name of the transfer's recipient.
      #
      #   @return [String]
      required :creditor_name, String

      # @!attribute remittance_information
      #   Unstructured information that will show on the recipient's bank statement.
      #
      #   @return [String]
      required :remittance_information, String

      # @!attribute source_account_number_id
      #   The identifier of the Account Number from which to send the transfer.
      #
      #   @return [String]
      required :source_account_number_id, String

      # @!attribute debtor_name
      #   The name of the transfer's sender. If not provided, defaults to the name of the
      #   account's entity.
      #
      #   @return [String, nil]
      optional :debtor_name, String

      # @!attribute destination_account_number
      #   The destination account number.
      #
      #   @return [String, nil]
      optional :destination_account_number, String

      # @!attribute destination_routing_number
      #   The destination American Bankers' Association (ABA) Routing Transit Number
      #   (RTN).
      #
      #   @return [String, nil]
      optional :destination_routing_number, String

      # @!attribute external_account_id
      #   The ID of an External Account to initiate a transfer to. If this parameter is
      #   provided, `destination_account_number` and `destination_routing_number` must be
      #   absent.
      #
      #   @return [String, nil]
      optional :external_account_id, String

      # @!attribute require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::Boolean

      # @!attribute ultimate_creditor_name
      #   The name of the ultimate recipient of the transfer. Set this if the creditor is
      #   an intermediary receiving the payment for someone else.
      #
      #   @return [String, nil]
      optional :ultimate_creditor_name, String

      # @!attribute ultimate_debtor_name
      #   The name of the ultimate sender of the transfer. Set this if the funds are being
      #   sent on behalf of someone who is not the account holder at Increase.
      #
      #   @return [String, nil]
      optional :ultimate_debtor_name, String

      # @!method initialize(amount:, creditor_name:, remittance_information:, source_account_number_id:, debtor_name: nil, destination_account_number: nil, destination_routing_number: nil, external_account_id: nil, require_approval: nil, ultimate_creditor_name: nil, ultimate_debtor_name: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::RealTimePaymentsTransferCreateParams} for more details.
      #
      #   @param amount [Integer] The transfer amount in USD cents. For Real-Time Payments transfers, must be posi
      #
      #   @param creditor_name [String] The name of the transfer's recipient.
      #
      #   @param remittance_information [String] Unstructured information that will show on the recipient's bank statement.
      #
      #   @param source_account_number_id [String] The identifier of the Account Number from which to send the transfer.
      #
      #   @param debtor_name [String] The name of the transfer's sender. If not provided, defaults to the name of the
      #
      #   @param destination_account_number [String] The destination account number.
      #
      #   @param destination_routing_number [String] The destination American Bankers' Association (ABA) Routing Transit Number (RTN)
      #
      #   @param external_account_id [String] The ID of an External Account to initiate a transfer to. If this parameter is pr
      #
      #   @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @param ultimate_creditor_name [String] The name of the ultimate recipient of the transfer. Set this if the creditor is
      #
      #   @param ultimate_debtor_name [String] The name of the ultimate sender of the transfer. Set this if the funds are being
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
