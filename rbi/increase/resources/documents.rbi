# typed: strong

module Increase
  module Resources
    class Documents
      # Retrieve a Document
      sig do
        params(
          document_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Document)
      end
      def retrieve(
        # The identifier of the Document to retrieve.
        document_id,
        request_options: {}
      )
      end

      # List Documents
      sig do
        params(
          category: Increase::DocumentListParams::Category::OrHash,
          created_at: Increase::DocumentListParams::CreatedAt::OrHash,
          cursor: String,
          entity_id: String,
          idempotency_key: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::Document])
      end
      def list(
        category: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter Documents to ones belonging to the specified Entity.
        entity_id: nil,
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
