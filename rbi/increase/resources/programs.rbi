# typed: strong

module Increase
  module Resources
    class Programs
      # Retrieve a Program
      sig do
        params(
          program_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Program)
      end
      def retrieve(
        # The identifier of the Program to retrieve.
        program_id,
        request_options: {}
      )
      end

      # List Programs
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::Program])
      end
      def list(
        # Return the page of entries after this one.
        cursor: nil,
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
