# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiAccountEnrollments#retrieve
    class IntrafiAccountEnrollmentRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute intrafi_account_enrollment_id
      #   The identifier of the IntraFi Account Enrollment to retrieve.
      #
      #   @return [String]
      required :intrafi_account_enrollment_id, String

      # @!method initialize(intrafi_account_enrollment_id:, request_options: {})
      #   @param intrafi_account_enrollment_id [String] The identifier of the IntraFi Account Enrollment to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
