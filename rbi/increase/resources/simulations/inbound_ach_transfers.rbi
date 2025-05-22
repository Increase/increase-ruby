# typed: strong

module Increase
  module Resources
    class Simulations
      class InboundACHTransfers
        # Simulates an inbound ACH transfer to your account. This imitates initiating a
        # transfer to an Increase account from a different financial institution. The
        # transfer may be either a credit or a debit depending on if the `amount` is
        # positive or negative. The result of calling this API will contain the created
        # transfer. You can pass a `resolve_at` parameter to allow for a window to
        # [action on the Inbound ACH Transfer](https://increase.com/documentation/receiving-ach-transfers).
        # Alternatively, if you don't pass the `resolve_at` parameter the result will
        # contain either a [Transaction](#transactions) or a
        # [Declined Transaction](#declined-transactions) depending on whether or not the
        # transfer is allowed.
        sig do
          params(
            account_number_id: String,
            amount: Integer,
            addenda:
              Increase::Simulations::InboundACHTransferCreateParams::Addenda::OrHash,
            company_descriptive_date: String,
            company_discretionary_data: String,
            company_entry_description: String,
            company_id: String,
            company_name: String,
            receiver_id_number: String,
            receiver_name: String,
            resolve_at: Time,
            standard_entry_class_code:
              Increase::Simulations::InboundACHTransferCreateParams::StandardEntryClassCode::OrSymbol,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::InboundACHTransfer)
        end
        def create(
          # The identifier of the Account Number the inbound ACH Transfer is for.
          account_number_id:,
          # The transfer amount in cents. A positive amount originates a credit transfer
          # pushing funds to the receiving account. A negative amount originates a debit
          # transfer pulling funds from the receiving account.
          amount:,
          # Additional information to include in the transfer.
          addenda: nil,
          # The description of the date of the transfer.
          company_descriptive_date: nil,
          # Data associated with the transfer set by the sender.
          company_discretionary_data: nil,
          # The description of the transfer set by the sender.
          company_entry_description: nil,
          # The sender's company ID.
          company_id: nil,
          # The name of the sender.
          company_name: nil,
          # The ID of the receiver of the transfer.
          receiver_id_number: nil,
          # The name of the receiver of the transfer.
          receiver_name: nil,
          # The time at which the transfer should be resolved. If not provided will resolve
          # immediately.
          resolve_at: nil,
          # The standard entry class code for the transfer.
          standard_entry_class_code: nil,
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
