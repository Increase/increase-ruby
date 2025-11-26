# typed: strong

module Increase
  module Resources
    class IntrafiAccountEnrollments
      # Enroll an account in the IntraFi deposit sweep network
      sig do
        params(
          account_id: String,
          email_address: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::IntrafiAccountEnrollment)
      end
      def create(
        # The identifier for the account to be added to IntraFi.
        account_id:,
        # The contact email for the account owner, to be shared with IntraFi.
        email_address:,
        request_options: {}
      )
      end

      # Get an IntraFi Account Enrollment
      sig do
        params(
          intrafi_account_enrollment_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::IntrafiAccountEnrollment)
      end
      def retrieve(
        # The identifier of the IntraFi Account Enrollment to retrieve.
        intrafi_account_enrollment_id,
        request_options: {}
      )
      end

      # List IntraFi Account Enrollments
      sig do
        params(
          account_id: String,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::IntrafiAccountEnrollmentListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::IntrafiAccountEnrollment])
      end
      def list(
        # Filter IntraFi Account Enrollments to the one belonging to an account.
        account_id: nil,
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

      # Unenroll an account from IntraFi
      sig do
        params(
          intrafi_account_enrollment_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::IntrafiAccountEnrollment)
      end
      def unenroll(
        # The Identifier of the IntraFi Account Enrollment to remove from IntraFi.
        intrafi_account_enrollment_id,
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
