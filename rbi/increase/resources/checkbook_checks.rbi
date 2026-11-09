# typed: strong

module Increase
  module Resources
    class CheckbookChecks
      # Retrieve a Checkbook Check
      sig do
        params(
          checkbook_check_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CheckbookCheck)
      end
      def retrieve(
        # The identifier of the Checkbook Check.
        checkbook_check_id,
        request_options: {}
      )
      end

      # List Checkbook Checks
      sig do
        params(
          account_number_id: String,
          check_number: Integer,
          checkbook_id: String,
          cursor: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::CheckbookCheck])
      end
      def list(
        # Filter Checkbook Checks to those drawn on the specified Account Number.
        account_number_id: nil,
        # Filter Checkbook Checks to the one with the specified check number.
        check_number: nil,
        # Filter Checkbook Checks to those belonging to the specified Checkbook.
        checkbook_id: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        #
        # Defaults to `100`.
        limit: nil,
        request_options: {}
      )
      end

      # Stop a Checkbook Check. A stopped check cannot be deposited.
      sig do
        params(
          checkbook_check_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CheckbookCheck)
      end
      def stop(
        # The identifier of the Checkbook Check to stop.
        checkbook_check_id,
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
