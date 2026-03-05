# typed: strong

module Increase
  module Models
    class IntrafiAccountEnrollmentRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::IntrafiAccountEnrollmentRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the IntraFi Account Enrollment to retrieve.
      sig { returns(String) }
      attr_accessor :intrafi_account_enrollment_id

      sig do
        params(
          intrafi_account_enrollment_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the IntraFi Account Enrollment to retrieve.
        intrafi_account_enrollment_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            intrafi_account_enrollment_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
