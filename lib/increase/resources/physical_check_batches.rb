# frozen_string_literal: true

module Increase
  module Resources
    class PhysicalCheckBatches
      # Create a Physical Check Batch
      #
      # @overload create(mailing_address:, return_address:, shipping_method: nil, request_options: {})
      #
      # @param mailing_address [Increase::Models::PhysicalCheckBatchCreateParams::MailingAddress]
      #   Details for where the parcel will be mailed.
      #
      # @param return_address [Increase::Models::PhysicalCheckBatchCreateParams::ReturnAddress]
      #   Details for where the parcel should return if it is unable to be delivered.
      #
      # @param shipping_method [Symbol, Increase::Models::PhysicalCheckBatchCreateParams::ShippingMethod]
      #   How to ship the batch.
      #
      #   Defaults to `usps_first_class`.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCheckBatch]
      #
      # @see Increase::Models::PhysicalCheckBatchCreateParams
      def create(params)
        parsed, options = Increase::PhysicalCheckBatchCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "physical_check_batches",
          body: parsed,
          model: Increase::PhysicalCheckBatch,
          options: options
        )
      end

      # Cancel a pending Physical Check Batch, which cancels all of its related checks.
      #
      # @overload cancel(physical_check_batch_id, request_options: {})
      #
      # @param physical_check_batch_id [String] The identifier of the pending Physical Check Batch to cancel.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCheckBatch]
      #
      # @see Increase::Models::PhysicalCheckBatchCancelParams
      def cancel(physical_check_batch_id, params = {})
        @client.request(
          method: :post,
          path: ["physical_check_batches/%1$s/cancel", physical_check_batch_id],
          model: Increase::PhysicalCheckBatch,
          options: params[:request_options]
        )
      end

      # Completing a Physical Check Batch closes it to new Physical Checks and begins
      # the process of printing and mailing it.
      #
      # @overload complete(physical_check_batch_id, request_options: {})
      #
      # @param physical_check_batch_id [String] The identifier of the Physical Check Batch to complete.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCheckBatch]
      #
      # @see Increase::Models::PhysicalCheckBatchCompleteParams
      def complete(physical_check_batch_id, params = {})
        @client.request(
          method: :post,
          path: ["physical_check_batches/%1$s/complete", physical_check_batch_id],
          model: Increase::PhysicalCheckBatch,
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
