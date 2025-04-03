# typed: strong

module Increase
  module Resources
    class Groups
      # Returns details for the currently authenticated Group.
      sig do
        params(request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash)))
          .returns(Increase::Models::Group)
      end
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
