# typed: strong

module Increase
  module Resources
    class CheckDeposits
      # Create a Check Deposit
      sig do
        params(
          account_id: String,
          amount: Integer,
          back_image_file_id: String,
          front_image_file_id: String,
          description: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CheckDeposit)
      end
      def create(
        # The identifier for the Account to deposit the check in.
        account_id:,
        # The deposit amount in USD cents.
        amount:,
        # The File containing the check's back image.
        back_image_file_id:,
        # The File containing the check's front image.
        front_image_file_id:,
        # The description you choose to give the Check Deposit, for display purposes only.
        description: nil,
        request_options: {}
      )
      end

      # Retrieve a Check Deposit
      sig do
        params(
          check_deposit_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CheckDeposit)
      end
      def retrieve(
        # The identifier of the Check Deposit to retrieve.
        check_deposit_id,
        request_options: {}
      )
      end

      # List Check Deposits
      sig do
        params(
          account_id: String,
          created_at: Increase::CheckDepositListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::CheckDeposit])
      end
      def list(
        # Filter Check Deposits to those belonging to the specified Account.
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
