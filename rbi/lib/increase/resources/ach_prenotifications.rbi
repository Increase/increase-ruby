# typed: strong

module Increase
  module Resources
    class ACHPrenotifications
      # Create an ACH Prenotification
      sig do
        params(
          account_id: String,
          account_number: String,
          routing_number: String,
          addendum: String,
          company_descriptive_date: String,
          company_discretionary_data: String,
          company_entry_description: String,
          company_name: String,
          credit_debit_indicator: Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator::OrSymbol,
          effective_date: Date,
          individual_id: String,
          individual_name: String,
          standard_entry_class_code: Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode::OrSymbol,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::ACHPrenotification)
      end
      def create(
        # The Increase identifier for the account that will send the transfer.
        account_id:,
        # The account number for the destination account.
        account_number:,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
        #   destination account.
        routing_number:,
        # Additional information that will be sent to the recipient.
        addendum: nil,
        # The description of the date of the transfer.
        company_descriptive_date: nil,
        # The data you choose to associate with the transfer.
        company_discretionary_data: nil,
        # The description of the transfer you wish to be shown to the recipient.
        company_entry_description: nil,
        # The name by which the recipient knows you.
        company_name: nil,
        # Whether the Prenotification is for a future debit or credit.
        credit_debit_indicator: nil,
        # The transfer effective date in
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        effective_date: nil,
        # Your identifier for the transfer recipient.
        individual_id: nil,
        # The name of the transfer recipient. This value is information and not verified
        #   by the recipient's bank.
        individual_name: nil,
        # The Standard Entry Class (SEC) code to use for the ACH Prenotification.
        standard_entry_class_code: nil,
        request_options: {}
      )
      end

      # Retrieve an ACH Prenotification
      sig do
        params(
          ach_prenotification_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::ACHPrenotification)
      end
      def retrieve(
        # The identifier of the ACH Prenotification to retrieve.
        ach_prenotification_id,
        request_options: {}
      )
      end

      # List ACH Prenotifications
      sig do
        params(
          created_at: T.any(Increase::Models::ACHPrenotificationListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::ACHPrenotification])
      end
      def list(
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        #   that object. This value is unique across Increase and is used to ensure that a
        #   request is only processed once. Learn more about
        #   [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
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
