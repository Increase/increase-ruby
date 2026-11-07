# typed: strong

module Increase
  module Resources
    class Checkbooks
      # Create a Checkbook
      sig do
        params(
          account_number_id: String,
          mailing_address:
            Increase::CheckbookCreateParams::MailingAddress::OrHash,
          payer: T::Array[Increase::CheckbookCreateParams::Payer::OrHash],
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Checkbook)
      end
      def create(
        # The identifier of the Account Number that the checks will draw from. The Account
        # Number must be active.
        account_number_id:,
        # The destination address that the Checkbook will be mailed to.
        mailing_address:,
        # The payer of the checks. This will be printed on the top-left corner of each
        # check. This should be an array of up to 4 elements, each of which represents a
        # line of the payer.
        payer:,
        request_options: {}
      )
      end

      # Retrieve a Checkbook
      sig do
        params(
          checkbook_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Checkbook)
      end
      def retrieve(
        # The identifier of the Checkbook.
        checkbook_id,
        request_options: {}
      )
      end

      # List Checkbooks
      sig do
        params(
          account_number_id: String,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::CheckbookListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::Checkbook])
      end
      def list(
        # Filter Checkbooks to those attached to the specified Account Number.
        account_number_id: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        #
        # Defaults to `100`.
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      # Stop a Checkbook. Stopping a Checkbook stops all of its checks that have not yet
      # been deposited.
      sig do
        params(
          checkbook_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Checkbook)
      end
      def stop(
        # The identifier of the Checkbook to stop.
        checkbook_id,
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
