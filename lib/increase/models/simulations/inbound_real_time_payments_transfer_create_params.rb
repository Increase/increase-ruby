# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::InboundRealTimePaymentsTransfers#create
      class InboundRealTimePaymentsTransferCreateParams < Increase::Internal::Type::BaseModel
        # @!parse
        #   extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute account_number_id
        #   The identifier of the Account Number the inbound Real-Time Payments Transfer is
        #     for.
        #
        #   @return [String]
        required :account_number_id, String

        # @!attribute amount
        #   The transfer amount in USD cents. Must be positive.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute [r] debtor_account_number
        #   The account number of the account that sent the transfer.
        #
        #   @return [String, nil]
        optional :debtor_account_number, String

        # @!parse
        #   # @return [String]
        #   attr_writer :debtor_account_number

        # @!attribute [r] debtor_name
        #   The name provided by the sender of the transfer.
        #
        #   @return [String, nil]
        optional :debtor_name, String

        # @!parse
        #   # @return [String]
        #   attr_writer :debtor_name

        # @!attribute [r] debtor_routing_number
        #   The routing number of the account that sent the transfer.
        #
        #   @return [String, nil]
        optional :debtor_routing_number, String

        # @!parse
        #   # @return [String]
        #   attr_writer :debtor_routing_number

        # @!attribute [r] remittance_information
        #   Additional information included with the transfer.
        #
        #   @return [String, nil]
        optional :remittance_information, String

        # @!parse
        #   # @return [String]
        #   attr_writer :remittance_information

        # @!attribute [r] request_for_payment_id
        #   The identifier of a pending Request for Payment that this transfer will fulfill.
        #
        #   @return [String, nil]
        optional :request_for_payment_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :request_for_payment_id

        # @!parse
        #   # @param account_number_id [String]
        #   # @param amount [Integer]
        #   # @param debtor_account_number [String]
        #   # @param debtor_name [String]
        #   # @param debtor_routing_number [String]
        #   # @param remittance_information [String]
        #   # @param request_for_payment_id [String]
        #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(
        #     account_number_id:,
        #     amount:,
        #     debtor_account_number: nil,
        #     debtor_name: nil,
        #     debtor_routing_number: nil,
        #     remittance_information: nil,
        #     request_for_payment_id: nil,
        #     request_options: {},
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end
    end
  end
end
