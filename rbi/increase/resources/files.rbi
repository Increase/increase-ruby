# typed: strong

module Increase
  module Resources
    class Files
      # To upload a file to Increase, you'll need to send a request of Content-Type
      # `multipart/form-data`. The request should contain the file you would like to
      # upload, as well as the parameters for creating a file.
      sig do
        params(
          file: Increase::Internal::FileInput,
          purpose: Increase::FileCreateParams::Purpose::OrSymbol,
          description: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::File)
      end
      def create(
        # The file contents. This should follow the specifications of
        # [RFC 7578](https://datatracker.ietf.org/doc/html/rfc7578) which defines file
        # transfers for the multipart/form-data protocol.
        file:,
        # What the File will be used for in Increase's systems.
        purpose:,
        # The description you choose to give the File.
        description: nil,
        request_options: {}
      )
      end

      # Retrieve a File
      sig do
        params(
          file_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::File)
      end
      def retrieve(
        # The identifier of the File.
        file_id,
        request_options: {}
      )
      end

      # List Files
      sig do
        params(
          created_at: Increase::FileListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          purpose: Increase::FileListParams::Purpose::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::File])
      end
      def list(
        created_at: nil,
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
        purpose: nil,
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
