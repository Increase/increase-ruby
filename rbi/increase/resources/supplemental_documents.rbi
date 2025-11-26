# typed: strong

module Increase
  module Resources
    class SupplementalDocuments
      # Create a supplemental document for an Entity
      sig do
        params(
          entity_id: String,
          file_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::EntitySupplementalDocument)
      end
      def create(
        # The identifier of the Entity to associate with the supplemental document.
        entity_id:,
        # The identifier of the File containing the document.
        file_id:,
        request_options: {}
      )
      end

      # List Entity Supplemental Document Submissions
      sig do
        params(
          entity_id: String,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::SupplementalDocumentListResponse)
      end
      def list(
        # The identifier of the Entity to list supplemental documents for.
        entity_id:,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
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
