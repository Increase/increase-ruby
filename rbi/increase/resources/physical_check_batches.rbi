# typed: strong

module Increase
  module Resources
    class PhysicalCheckBatches
      # Create a Physical Check Batch
      sig do
        params(
          mailing_address:
            Increase::PhysicalCheckBatchCreateParams::MailingAddress::OrHash,
          return_address:
            Increase::PhysicalCheckBatchCreateParams::ReturnAddress::OrHash,
          shipping_method:
            Increase::PhysicalCheckBatchCreateParams::ShippingMethod::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PhysicalCheckBatch)
      end
      def create(
        # Details for where the parcel will be mailed.
        mailing_address:,
        # Details for where the parcel should return if it is unable to be delivered.
        return_address:,
        # How to ship the batch.
        #
        # Defaults to `usps_first_class`.
        shipping_method: nil,
        request_options: {}
      )
      end

      # Cancel a pending Physical Check Batch, which cancels all of its related checks.
      sig do
        params(
          physical_check_batch_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PhysicalCheckBatch)
      end
      def cancel(
        # The identifier of the pending Physical Check Batch to cancel.
        physical_check_batch_id,
        request_options: {}
      )
      end

      # Completing a Physical Check Batch closes it to new Physical Checks and begins
      # the process of printing and mailing it.
      sig do
        params(
          physical_check_batch_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PhysicalCheckBatch)
      end
      def complete(
        # The identifier of the Physical Check Batch to complete.
        physical_check_batch_id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
