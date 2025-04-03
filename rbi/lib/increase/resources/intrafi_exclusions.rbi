# typed: strong

module Increase
  module Resources
    class IntrafiExclusions
      # Create an IntraFi Exclusion
      sig do
        params(
          bank_name: String,
          entity_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::IntrafiExclusion)
      end
      def create(
        # The name of the financial institution to be excluded.
        bank_name:,
        # The identifier of the Entity whose deposits will be excluded.
        entity_id:,
        request_options: {}
      )
      end

      # Get an IntraFi Exclusion
      sig do
        params(
          intrafi_exclusion_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::IntrafiExclusion)
      end
      def retrieve(
        # The identifier of the IntraFi Exclusion to retrieve.
        intrafi_exclusion_id,
        request_options: {}
      )
      end

      # List IntraFi Exclusions
      sig do
        params(
          cursor: String,
          entity_id: String,
          idempotency_key: String,
          limit: Integer,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::IntrafiExclusion])
      end
      def list(
        # Return the page of entries after this one.
        cursor: nil,
        # Filter IntraFi Exclusions for those belonging to the specified Entity.
        entity_id: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        #   that object. This value is unique across Increase and is used to ensure that a
        #   request is only processed once. Learn more about
        #   [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
        limit: nil,
        request_options: {}
      )
      end

      # Archive an IntraFi Exclusion
      sig do
        params(
          intrafi_exclusion_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::IntrafiExclusion)
      end
      def archive(
        # The identifier of the IntraFi Exclusion request to archive. It may take 5
        #   business days for an exclusion removal to be processed. Removing an exclusion
        #   does not guarantee that funds will be swept to the previously-excluded bank.
        intrafi_exclusion_id,
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
