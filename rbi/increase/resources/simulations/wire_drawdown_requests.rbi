# typed: strong

module Increase
  module Resources
    class Simulations
      class WireDrawdownRequests
        # Simulates a Wire Drawdown Request being refused by the debtor.
        sig do
          params(
            wire_drawdown_request_id: String,
            refusal_reason_additional_information: String,
            refusal_reason_code:
              Increase::Simulations::WireDrawdownRequestRefuseParams::RefusalReasonCode::OrSymbol,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::WireDrawdownRequest)
        end
        def refuse(
          # The identifier of the Wire Drawdown Request you wish to refuse.
          wire_drawdown_request_id,
          # Additional information about the refusal that the simulated refusal will have.
          refusal_reason_additional_information: nil,
          # The reason code that the simulated refusal will have.
          #
          # Defaults to `other`.
          refusal_reason_code: nil,
          request_options: {}
        )
        end

        # Simulates a Wire Drawdown Request being submitted to Fedwire.
        sig do
          params(
            wire_drawdown_request_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::WireDrawdownRequest)
        end
        def submit(
          # The identifier of the Wire Drawdown Request you wish to submit.
          wire_drawdown_request_id,
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
