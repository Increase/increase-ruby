# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class ACHTransfers
        # Simulates the acknowledgement of an [ACH Transfer](#ach-transfers) by the
        # Federal Reserve. This transfer must first have a `status` of `submitted` . In
        # production, the Federal Reserve generally acknowledges submitted ACH files
        # within 30 minutes. Since sandbox ACH Transfers are not submitted to the Federal
        # Reserve, this endpoint allows you to skip that delay and add the acknowledgment
        # subresource to the ACH Transfer.
        #
        # @overload acknowledge(ach_transfer_id, request_options: {})
        #
        # @param ach_transfer_id [String] The identifier of the ACH Transfer you wish to become acknowledged.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::ACHTransfer]
        #
        # @see Increase::Models::Simulations::ACHTransferAcknowledgeParams
        def acknowledge(ach_transfer_id, params = {})
          @client.request(
            method: :post,
            path: ["simulations/ach_transfers/%1$s/acknowledge", ach_transfer_id],
            model: Increase::ACHTransfer,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::ACHTransferCreateNotificationOfChangeParams} for
        # more details.
        #
        # Simulates receiving a Notification of Change for an
        # [ACH Transfer](#ach-transfers).
        #
        # @overload create_notification_of_change(ach_transfer_id, change_code:, corrected_data:, request_options: {})
        #
        # @param ach_transfer_id [String] The identifier of the ACH Transfer you wish to create a notification of change f
        #
        # @param change_code [Symbol, Increase::Models::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode] The reason for the notification of change.
        #
        # @param corrected_data [String] The corrected data for the notification of change (e.g., a new routing number).
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::ACHTransfer]
        #
        # @see Increase::Models::Simulations::ACHTransferCreateNotificationOfChangeParams
        def create_notification_of_change(ach_transfer_id, params)
          parsed, options = Increase::Simulations::ACHTransferCreateNotificationOfChangeParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/ach_transfers/%1$s/create_notification_of_change", ach_transfer_id],
            body: parsed,
            model: Increase::ACHTransfer,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::ACHTransferReturnParams} for more details.
        #
        # Simulates the return of an [ACH Transfer](#ach-transfers) by the Federal Reserve
        # due to an error condition. This will also create a Transaction to account for
        # the returned funds. This transfer must first have a `status` of `submitted`.
        #
        # @overload return_(ach_transfer_id, reason: nil, request_options: {})
        #
        # @param ach_transfer_id [String] The identifier of the ACH Transfer you wish to return.
        #
        # @param reason [Symbol, Increase::Models::Simulations::ACHTransferReturnParams::Reason] The reason why the Federal Reserve or destination bank returned this transfer. D
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::ACHTransfer]
        #
        # @see Increase::Models::Simulations::ACHTransferReturnParams
        def return_(ach_transfer_id, params = {})
          parsed, options = Increase::Simulations::ACHTransferReturnParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/ach_transfers/%1$s/return", ach_transfer_id],
            body: parsed,
            model: Increase::ACHTransfer,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::ACHTransferSettleParams} for more details.
        #
        # Simulates the settlement of an [ACH Transfer](#ach-transfers) by the Federal
        # Reserve. This transfer must first have a `status` of `pending_submission` or
        # `submitted`. For convenience, if the transfer is in `status`:
        # `pending_submission`, the simulation will also submit the transfer. Without this
        # simulation the transfer will eventually settle on its own following the same
        # Federal Reserve timeline as in production. Additionally, you can specify the
        # behavior of the inbound funds hold that is created when the ACH Transfer is
        # settled. If no behavior is specified, the inbound funds hold will be released
        # immediately in order for the funds to be available for use.
        #
        # @overload settle(ach_transfer_id, inbound_funds_hold_behavior: nil, request_options: {})
        #
        # @param ach_transfer_id [String] The identifier of the ACH Transfer you wish to become settled.
        #
        # @param inbound_funds_hold_behavior [Symbol, Increase::Models::Simulations::ACHTransferSettleParams::InboundFundsHoldBehavior] The behavior of the inbound funds hold that is created when the ACH Transfer is
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::ACHTransfer]
        #
        # @see Increase::Models::Simulations::ACHTransferSettleParams
        def settle(ach_transfer_id, params = {})
          parsed, options = Increase::Simulations::ACHTransferSettleParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["simulations/ach_transfers/%1$s/settle", ach_transfer_id],
            body: parsed,
            model: Increase::ACHTransfer,
            options: options
          )
        end

        # Simulates the submission of an [ACH Transfer](#ach-transfers) to the Federal
        # Reserve. This transfer must first have a `status` of `pending_approval` or
        # `pending_submission`. In production, Increase submits ACH Transfers to the
        # Federal Reserve three times per day on weekdays. Since sandbox ACH Transfers are
        # not submitted to the Federal Reserve, this endpoint allows you to skip that
        # delay and transition the ACH Transfer to a status of `submitted`.
        #
        # @overload submit(ach_transfer_id, request_options: {})
        #
        # @param ach_transfer_id [String] The identifier of the ACH Transfer you wish to submit.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::ACHTransfer]
        #
        # @see Increase::Models::Simulations::ACHTransferSubmitParams
        def submit(ach_transfer_id, params = {})
          @client.request(
            method: :post,
            path: ["simulations/ach_transfers/%1$s/submit", ach_transfer_id],
            model: Increase::ACHTransfer,
            options: params[:request_options]
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
