# frozen_string_literal: true

module Increase
  module Resources
    class Lockboxes
      # Create a Lockbox
      #
      # @overload create(account_id:, description: nil, recipient_name: nil, request_options: {})
      #
      # @param account_id [String] The Account checks sent to this Lockbox should be deposited into.
      #
      # @param description [String] The description you choose for the Lockbox, for display purposes.
      #
      # @param recipient_name [String] The name of the recipient that will receive mail at this location.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Lockbox]
      #
      # @see Increase::Models::LockboxCreateParams
      def create(params)
        parsed, options = Increase::LockboxCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "lockboxes",
          body: parsed,
          model: Increase::Lockbox,
          options: options
        )
      end

      # Retrieve a Lockbox
      #
      # @overload retrieve(lockbox_id, request_options: {})
      #
      # @param lockbox_id [String] The identifier of the Lockbox to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Lockbox]
      #
      # @see Increase::Models::LockboxRetrieveParams
      def retrieve(lockbox_id, params = {})
        @client.request(
          method: :get,
          path: ["lockboxes/%1$s", lockbox_id],
          model: Increase::Lockbox,
          options: params[:request_options]
        )
      end

      # Update a Lockbox
      #
      # @overload update(lockbox_id, description: nil, recipient_name: nil, status: nil, request_options: {})
      #
      # @param lockbox_id [String] The identifier of the Lockbox.
      #
      # @param description [String] The description you choose for the Lockbox.
      #
      # @param recipient_name [String] The recipient name you choose for the Lockbox.
      #
      # @param status [Symbol, Increase::Models::LockboxUpdateParams::Status] This indicates if checks can be sent to the Lockbox.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Lockbox]
      #
      # @see Increase::Models::LockboxUpdateParams
      def update(lockbox_id, params = {})
        parsed, options = Increase::LockboxUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["lockboxes/%1$s", lockbox_id],
          body: parsed,
          model: Increase::Lockbox,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::LockboxListParams} for more details.
      #
      # List Lockboxes
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param account_id [String] Filter Lockboxes to those associated with the provided Account.
      #
      # @param created_at [Increase::Models::LockboxListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::Lockbox>]
      #
      # @see Increase::Models::LockboxListParams
      def list(params = {})
        parsed, options = Increase::LockboxListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "lockboxes",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::Lockbox,
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
