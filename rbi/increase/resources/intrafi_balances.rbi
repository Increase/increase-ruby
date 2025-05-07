# typed: strong

module Increase
  module Resources
    class IntrafiBalances
      # Returns the IntraFi balance for the given account. IntraFi may sweep funds to
      # multiple banks. This endpoint will include both the total balance and the amount
      # swept to each institution.
      sig do
        params(
          account_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::IntrafiBalance)
      end
      def intrafi_balance(
        # The identifier of the Account to get balances for.
        account_id,
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
