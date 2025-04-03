# typed: strong

module Increase
  module Resources
    class InboundMailItems
      # Retrieve an Inbound Mail Item
      sig do
        params(
          inbound_mail_item_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::InboundMailItem)
      end
      def retrieve(
        # The identifier of the Inbound Mail Item to retrieve.
        inbound_mail_item_id,
        request_options: {}
      )
      end

      # List Inbound Mail Items
      sig do
        params(
          created_at: T.any(Increase::Models::InboundMailItemListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          limit: Integer,
          lockbox_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::InboundMailItem])
      end
      def list(
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
        limit: nil,
        # Filter Inbound Mail Items to ones sent to the provided Lockbox.
        lockbox_id: nil,
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
