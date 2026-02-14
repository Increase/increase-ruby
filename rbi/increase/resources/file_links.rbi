# typed: strong

module Increase
  module Resources
    class FileLinks
      # Create a File Link
      sig do
        params(
          file_id: String,
          expires_at: Time,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::FileLink)
      end
      def create(
        # The File to create a File Link for.
        file_id:,
        # The time at which the File Link will expire. The default is 1 hour from the time
        # of the request. The maximum is 1 day from the time of the request.
        expires_at: nil,
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
