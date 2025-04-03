# typed: strong

module Increase
  module Resources
    class Documents
      # Retrieve a Document
      sig do
        params(
          document_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::Document)
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
          category: T.any(Increase::Models::DocumentListParams::Category, Increase::Internal::AnyHash),
          created_at: T.any(Increase::Models::DocumentListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          entity_id: String,
          limit: Integer,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::Document])
      end
      def list(
        category: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter Documents to ones belonging to the specified Entity.
        entity_id: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
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
