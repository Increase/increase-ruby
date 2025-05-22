# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class InboundACHTransfers
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::InboundACHTransferCreateParams} for more
        # details.
        #
        # Simulates an inbound ACH transfer to your account. This imitates initiating a
        # transfer to an Increase account from a different financial institution. The
        # transfer may be either a credit or a debit depending on if the `amount` is
        # positive or negative. The result of calling this API will contain the created
        # transfer. You can pass a `resolve_at` parameter to allow for a window to
        # [action on the Inbound ACH Transfer](https://increase.com/documentation/receiving-ach-transfers).
        # Alternatively, if you don't pass the `resolve_at` parameter the result will
        # contain either a [Transaction](#transactions) or a
        # [Declined Transaction](#declined-transactions) depending on whether or not the
        # transfer is allowed.
        #
        # @overload create(account_number_id:, amount:, company_descriptive_date: nil, company_discretionary_data: nil, company_entry_description: nil, company_id: nil, company_name: nil, receiver_id_number: nil, receiver_name: nil, resolve_at: nil, standard_entry_class_code: nil, request_options: {})
        #
        # @param account_number_id [String] The identifier of the Account Number the inbound ACH Transfer is for.
        #
        # @param amount [Integer] The transfer amount in cents. A positive amount originates a credit transfer pus
        #
        # @param company_descriptive_date [String] The description of the date of the transfer.
        #
        # @param company_discretionary_data [String] Data associated with the transfer set by the sender.
        #
        # @param company_entry_description [String] The description of the transfer set by the sender.
        #
        # @param company_id [String] The sender's company ID.
        #
        # @param company_name [String] The name of the sender.
        #
        # @param receiver_id_number [String] The ID of the receiver of the transfer.
        #
        # @param receiver_name [String] The name of the receiver of the transfer.
        #
        # @param resolve_at [Time] The time at which the transfer should be resolved. If not provided will resolve
        #
        # @param standard_entry_class_code [Symbol, Increase::Models::Simulations::InboundACHTransferCreateParams::StandardEntryClassCode] The standard entry class code for the transfer.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::InboundACHTransfer]
        #
        # @see Increase::Models::Simulations::InboundACHTransferCreateParams
        def create(params)
          parsed, options = Increase::Simulations::InboundACHTransferCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/inbound_ach_transfers",
            body: parsed,
            model: Increase::InboundACHTransfer,
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
end
