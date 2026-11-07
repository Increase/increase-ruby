# typed: strong

module Increase
  module Resources
    class Simulations
      class Checkbooks
        # Simulates the mailing of a [Checkbook](#checkbooks), which happens periodically
        # throughout the day in production but can be sped up in sandbox. This Checkbook
        # must have a `status` of `pending_submission` or `pending_mailing`.
        sig do
          params(
            checkbook_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::Checkbook)
        end
        def mail(
          # The identifier of the Checkbook you wish to mail.
          checkbook_id,
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
end
