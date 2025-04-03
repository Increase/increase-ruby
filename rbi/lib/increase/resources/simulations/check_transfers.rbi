# typed: strong

module Increase
  module Resources
    class Simulations
      class CheckTransfers
        # Simulates the mailing of a [Check Transfer](#check-transfers), which happens
        #   periodically throughout the day in production but can be sped up in sandbox.
        #   This transfer must first have a `status` of `pending_approval` or
        #   `pending_submission`.
        sig do
          params(
            check_transfer_id: String,
            request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
          )
            .returns(Increase::Models::CheckTransfer)
        end
        def mail(
          # The identifier of the Check Transfer you wish to mail.
          check_transfer_id,
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
