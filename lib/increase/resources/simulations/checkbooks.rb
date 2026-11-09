# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class Checkbooks
        # Simulates the mailing of a [Checkbook](#checkbooks), which happens periodically
        # throughout the day in production but can be sped up in sandbox. This Checkbook
        # must have a `status` of `pending_submission` or `pending_mailing`.
        #
        # @overload mail(checkbook_id, request_options: {})
        #
        # @param checkbook_id [String] The identifier of the Checkbook you wish to mail.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::Checkbook]
        #
        # @see Increase::Models::Simulations::CheckbookMailParams
        def mail(checkbook_id, params = {})
          @client.request(
            method: :post,
            path: ["simulations/checkbooks/%1$s/mail", checkbook_id],
            model: Increase::Checkbook,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Increase::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
