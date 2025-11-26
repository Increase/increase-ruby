# frozen_string_literal: true

module Increase
  module Resources
    class IntrafiAccountEnrollments
      # Enroll an account in the IntraFi deposit sweep network
      #
      # @overload create(account_id:, email_address:, request_options: {})
      #
      # @param account_id [String] The identifier for the account to be added to IntraFi.
      #
      # @param email_address [String] The contact email for the account owner, to be shared with IntraFi.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::IntrafiAccountEnrollment]
      #
      # @see Increase::Models::IntrafiAccountEnrollmentCreateParams
      def create(params)
        parsed, options = Increase::IntrafiAccountEnrollmentCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "intrafi_account_enrollments",
          body: parsed,
          model: Increase::IntrafiAccountEnrollment,
          options: options
        )
      end

      # Get an IntraFi Account Enrollment
      #
      # @overload retrieve(intrafi_account_enrollment_id, request_options: {})
      #
      # @param intrafi_account_enrollment_id [String] The identifier of the IntraFi Account Enrollment to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::IntrafiAccountEnrollment]
      #
      # @see Increase::Models::IntrafiAccountEnrollmentRetrieveParams
      def retrieve(intrafi_account_enrollment_id, params = {})
        @client.request(
          method: :get,
          path: ["intrafi_account_enrollments/%1$s", intrafi_account_enrollment_id],
          model: Increase::IntrafiAccountEnrollment,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::IntrafiAccountEnrollmentListParams} for more details.
      #
      # List IntraFi Account Enrollments
      #
      # @overload list(account_id: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter IntraFi Account Enrollments to the one belonging to an account.
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::IntrafiAccountEnrollmentListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::IntrafiAccountEnrollment>]
      #
      # @see Increase::Models::IntrafiAccountEnrollmentListParams
      def list(params = {})
        parsed, options = Increase::IntrafiAccountEnrollmentListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "intrafi_account_enrollments",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::IntrafiAccountEnrollment,
          options: options
        )
      end

      # Unenroll an account from IntraFi
      #
      # @overload unenroll(intrafi_account_enrollment_id, request_options: {})
      #
      # @param intrafi_account_enrollment_id [String] The Identifier of the IntraFi Account Enrollment to remove from IntraFi.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::IntrafiAccountEnrollment]
      #
      # @see Increase::Models::IntrafiAccountEnrollmentUnenrollParams
      def unenroll(intrafi_account_enrollment_id, params = {})
        @client.request(
          method: :post,
          path: ["intrafi_account_enrollments/%1$s/unenroll", intrafi_account_enrollment_id],
          model: Increase::IntrafiAccountEnrollment,
          options: params[:request_options]
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
