# frozen_string_literal: true

module Increase
  module Resources
    class ACHPrenotifications
      # Some parameter documentations has been truncated, see
      # {Increase::Models::ACHPrenotificationCreateParams} for more details.
      #
      # Create an ACH Prenotification
      #
      # @overload create(account_id:, account_number:, routing_number:, addendum: nil, company_descriptive_date: nil, company_discretionary_data: nil, company_entry_description: nil, company_name: nil, credit_debit_indicator: nil, effective_date: nil, individual_id: nil, individual_name: nil, standard_entry_class_code: nil, request_options: {})
      #
      # @param account_id [String] The Increase identifier for the account that will send the ACH Prenotification.
      #
      # @param account_number [String] The account number for the destination account.
      #
      # @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN) for the des
      #
      # @param addendum [String] Additional information that will be sent to the recipient.
      #
      # @param company_descriptive_date [String] The description of the date of the ACH Prenotification.
      #
      # @param company_discretionary_data [String] The data you choose to associate with the ACH Prenotification.
      #
      # @param company_entry_description [String] The description you wish to be shown to the recipient.
      #
      # @param company_name [String] The name by which the recipient knows you.
      #
      # @param credit_debit_indicator [Symbol, Increase::Models::ACHPrenotificationCreateParams::CreditDebitIndicator] Whether the Prenotification is for a future debit or credit.
      #
      # @param effective_date [Date] The ACH Prenotification effective date in [ISO 8601](https://en.wikipedia.org/wi
      #
      # @param individual_id [String] Your identifier for the recipient.
      #
      # @param individual_name [String] The name of therecipient. This value is informational and not verified by the re
      #
      # @param standard_entry_class_code [Symbol, Increase::Models::ACHPrenotificationCreateParams::StandardEntryClassCode] The Standard Entry Class (SEC) code to use for the ACH Prenotification.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::ACHPrenotification]
      #
      # @see Increase::Models::ACHPrenotificationCreateParams
      def create(params)
        parsed, options = Increase::ACHPrenotificationCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "ach_prenotifications",
          body: parsed,
          model: Increase::ACHPrenotification,
          options: options
        )
      end

      # Retrieve an ACH Prenotification
      #
      # @overload retrieve(ach_prenotification_id, request_options: {})
      #
      # @param ach_prenotification_id [String] The identifier of the ACH Prenotification to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::ACHPrenotification]
      #
      # @see Increase::Models::ACHPrenotificationRetrieveParams
      def retrieve(ach_prenotification_id, params = {})
        @client.request(
          method: :get,
          path: ["ach_prenotifications/%1$s", ach_prenotification_id],
          model: Increase::ACHPrenotification,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::ACHPrenotificationListParams} for more details.
      #
      # List ACH Prenotifications
      #
      # @overload list(created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, request_options: {})
      #
      # @param created_at [Increase::Models::ACHPrenotificationListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::ACHPrenotification>]
      #
      # @see Increase::Models::ACHPrenotificationListParams
      def list(params = {})
        parsed, options = Increase::ACHPrenotificationListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "ach_prenotifications",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::ACHPrenotification,
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
