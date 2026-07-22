# frozen_string_literal: true

module Increase
  module Resources
    class LockboxAddresses
      # The Lockbox Address starts with a `pending` status and a null `address`. Shortly
      # after creation, Increase generates the mailing address and the status becomes
      # `active`. You can only create Lockbox Recipients for an `active` Lockbox
      # Address.
      #
      # @overload create(description: nil, request_options: {})
      #
      # @param description [String] The description you choose for the Lockbox Address.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::LockboxAddress]
      #
      # @see Increase::Models::LockboxAddressCreateParams
      def create(params = {})
        parsed, options = Increase::LockboxAddressCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "lockbox_addresses",
          body: parsed,
          model: Increase::LockboxAddress,
          options: options
        )
      end

      # Retrieve a Lockbox Address
      #
      # @overload retrieve(lockbox_address_id, request_options: {})
      #
      # @param lockbox_address_id [String] The identifier of the Lockbox Address to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::LockboxAddress]
      #
      # @see Increase::Models::LockboxAddressRetrieveParams
      def retrieve(lockbox_address_id, params = {})
        @client.request(
          method: :get,
          path: ["lockbox_addresses/%1$s", lockbox_address_id],
          model: Increase::LockboxAddress,
          options: params[:request_options]
        )
      end

      # Update a Lockbox Address
      #
      # @overload update(lockbox_address_id, description: nil, status: nil, request_options: {})
      #
      # @param lockbox_address_id [String] The identifier of the Lockbox Address.
      #
      # @param description [String] The description you choose for the Lockbox Address.
      #
      # @param status [Symbol, Increase::Models::LockboxAddressUpdateParams::Status]
      #   The status of the Lockbox Address.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::LockboxAddress]
      #
      # @see Increase::Models::LockboxAddressUpdateParams
      def update(lockbox_address_id, params = {})
        parsed, options = Increase::LockboxAddressUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["lockbox_addresses/%1$s", lockbox_address_id],
          body: parsed,
          model: Increase::LockboxAddress,
          options: options
        )
      end

      # List Lockbox Addresses
      #
      # @overload list(created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param created_at [Increase::Models::LockboxAddressListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String]
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   Defaults to `100`.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::LockboxAddress>]
      #
      # @see Increase::Models::LockboxAddressListParams
      def list(params = {})
        parsed, options = Increase::LockboxAddressListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "lockbox_addresses",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::LockboxAddress,
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
