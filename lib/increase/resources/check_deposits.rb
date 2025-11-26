# frozen_string_literal: true

module Increase
  module Resources
    class CheckDeposits
      # Some parameter documentations has been truncated, see
      # {Increase::Models::CheckDepositCreateParams} for more details.
      #
      # Create a Check Deposit
      #
      # @overload create(account_id:, amount:, back_image_file_id:, front_image_file_id:, description: nil, request_options: {})
      #
      # @param account_id [String] The identifier for the Account to deposit the check in.
      #
      # @param amount [Integer] The deposit amount in USD cents.
      #
      # @param back_image_file_id [String] The File containing the check's back image.
      #
      # @param front_image_file_id [String] The File containing the check's front image.
      #
      # @param description [String] The description you choose to give the Check Deposit, for display purposes only.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CheckDeposit]
      #
      # @see Increase::Models::CheckDepositCreateParams
      def create(params)
        parsed, options = Increase::CheckDepositCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "check_deposits",
          body: parsed,
          model: Increase::CheckDeposit,
          options: options
        )
      end

      # Retrieve a Check Deposit
      #
      # @overload retrieve(check_deposit_id, request_options: {})
      #
      # @param check_deposit_id [String] The identifier of the Check Deposit to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CheckDeposit]
      #
      # @see Increase::Models::CheckDepositRetrieveParams
      def retrieve(check_deposit_id, params = {})
        @client.request(
          method: :get,
          path: ["check_deposits/%1$s", check_deposit_id],
          model: Increase::CheckDeposit,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::CheckDepositListParams} for more details.
      #
      # List Check Deposits
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param account_id [String] Filter Check Deposits to those belonging to the specified Account.
      #
      # @param created_at [Increase::Models::CheckDepositListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CheckDepositListResponse]
      #
      # @see Increase::Models::CheckDepositListParams
      def list(params = {})
        parsed, options = Increase::CheckDepositListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "check_deposits",
          query: parsed,
          model: Increase::Models::CheckDepositListResponse,
          options: options
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
