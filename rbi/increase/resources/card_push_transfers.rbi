# typed: strong

module Increase
  module Resources
    class CardPushTransfers
      # Create a Card Push Transfer
      sig do
        params(
          amount: Integer,
          business_application_identifier:
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::OrSymbol,
          card_token_id: String,
          merchant_category_code: String,
          merchant_city_name: String,
          merchant_name: String,
          merchant_name_prefix: String,
          merchant_postal_code: String,
          merchant_state: String,
          recipient_name: String,
          sender_address_city: String,
          sender_address_line1: String,
          sender_address_postal_code: String,
          sender_address_state: String,
          sender_name: String,
          source_account_number_id: String,
          require_approval: T::Boolean,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardPushTransfer)
      end
      def create(
        # The transfer amount in USD cents. For Card Push transfers, must be positive.
        amount:,
        # The Business Application Identifier describes the type of transaction being
        # performed. Your program must be approved for the specified Business Application
        # Identifier in order to use it.
        business_application_identifier:,
        # The Increase identifier for the Card Token that represents the card number
        # you're pushing funds to.
        card_token_id:,
        # The merchant category code (MCC) of the merchant (generally your business)
        # sending the transfer. This is a four-digit code that describes the type of
        # business or service provided by the merchant. Your program must be approved for
        # the specified MCC in order to use it.
        merchant_category_code:,
        # The city name of the merchant (generally your business) sending the transfer.
        merchant_city_name:,
        # The merchant name shows up as the statement descriptor for the transfer. This is
        # typically the name of your business or organization.
        merchant_name:,
        # For certain Business Application Identifiers, the statement descriptor is
        # `merchant_name_prefix*sender_name`, where the `merchant_name_prefix` is a one to
        # four character prefix that identifies the merchant.
        merchant_name_prefix:,
        # The postal code of the merchant (generally your business) sending the transfer.
        merchant_postal_code:,
        # The state of the merchant (generally your business) sending the transfer.
        merchant_state:,
        # The name of the funds recipient.
        recipient_name:,
        # The city of the sender.
        sender_address_city:,
        # The address line 1 of the sender.
        sender_address_line1:,
        # The postal code of the sender.
        sender_address_postal_code:,
        # The state of the sender.
        sender_address_state:,
        # The name of the funds originator.
        sender_name:,
        # The identifier of the Account Number from which to send the transfer.
        source_account_number_id:,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        request_options: {}
      )
      end

      # Retrieve a Card Push Transfer
      sig do
        params(
          card_push_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardPushTransfer)
      end
      def retrieve(
        # The identifier of the Card Push Transfer.
        card_push_transfer_id,
        request_options: {}
      )
      end

      # List Card Push Transfers
      sig do
        params(
          account_id: String,
          created_at: Increase::CardPushTransferListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::CardPushTransferListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::CardPushTransfer])
      end
      def list(
        # Filter Card Push Transfers to ones belonging to the specified Account.
        account_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      # Approves a Card Push Transfer in a pending_approval state.
      sig do
        params(
          card_push_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardPushTransfer)
      end
      def approve(
        # The identifier of the Card Push Transfer to approve.
        card_push_transfer_id,
        request_options: {}
      )
      end

      # Cancels a Card Push Transfer in a pending_approval state.
      sig do
        params(
          card_push_transfer_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardPushTransfer)
      end
      def cancel(
        # The identifier of the pending Card Push Transfer to cancel.
        card_push_transfer_id,
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
