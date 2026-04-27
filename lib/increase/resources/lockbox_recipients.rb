# frozen_string_literal: true

module Increase
  module Resources
    class LockboxRecipients
      # Some parameter documentations has been truncated, see
      # {Increase::Models::LockboxRecipientCreateParams} for more details.
      #
      # Create a Lockbox Recipient
      #
      # @overload create(account_id:, lockbox_address_id:, description: nil, recipient_name: nil, request_options: {})
      #
      # @param account_id [String] The Account that checks sent to this Lockbox Recipient should be deposited into.
      #
      # @param lockbox_address_id [String] The Lockbox Address where this Lockbox Recipient may receive mail.
      #
      # @param description [String] The description you choose for the Lockbox Recipient.
      #
      # @param recipient_name [String] The name of the Lockbox Recipient
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::LockboxRecipient]
      #
      # @see Increase::Models::LockboxRecipientCreateParams
      def create(params)
        parsed, options = Increase::LockboxRecipientCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "lockbox_recipients",
          body: parsed,
          model: Increase::LockboxRecipient,
          options: options
        )
      end

      # Retrieve a Lockbox Recipient
      #
      # @overload retrieve(lockbox_recipient_id, request_options: {})
      #
      # @param lockbox_recipient_id [String] The identifier of the Lockbox Recipient to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::LockboxRecipient]
      #
      # @see Increase::Models::LockboxRecipientRetrieveParams
      def retrieve(lockbox_recipient_id, params = {})
        @client.request(
          method: :get,
          path: ["lockbox_recipients/%1$s", lockbox_recipient_id],
          model: Increase::LockboxRecipient,
          options: params[:request_options]
        )
      end

      # Update a Lockbox Recipient
      #
      # @overload update(lockbox_recipient_id, description: nil, recipient_name: nil, status: nil, request_options: {})
      #
      # @param lockbox_recipient_id [String] The identifier of the Lockbox Recipient.
      #
      # @param description [String] The description you choose for the Lockbox Recipient.
      #
      # @param recipient_name [String] The name of the Lockbox Recipient.
      #
      # @param status [Symbol, Increase::Models::LockboxRecipientUpdateParams::Status] The status of the Lockbox Recipient.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::LockboxRecipient]
      #
      # @see Increase::Models::LockboxRecipientUpdateParams
      def update(lockbox_recipient_id, params = {})
        parsed, options = Increase::LockboxRecipientUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["lockbox_recipients/%1$s", lockbox_recipient_id],
          body: parsed,
          model: Increase::LockboxRecipient,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::LockboxRecipientListParams} for more details.
      #
      # List Lockbox Recipients
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, lockbox_address_id: nil, request_options: {})
      #
      # @param account_id [String] Filter Lockbox Recipients to those associated with the provided Account.
      #
      # @param created_at [Increase::Models::LockboxRecipientListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param lockbox_address_id [String] Filter Lockbox Recipients to those associated with the provided Lockbox Address.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::LockboxRecipient>]
      #
      # @see Increase::Models::LockboxRecipientListParams
      def list(params = {})
        parsed, options = Increase::LockboxRecipientListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "lockbox_recipients",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::LockboxRecipient,
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
