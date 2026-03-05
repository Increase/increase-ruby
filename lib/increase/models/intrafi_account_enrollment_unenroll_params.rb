# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiAccountEnrollments#unenroll
    class IntrafiAccountEnrollmentUnenrollParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute intrafi_account_enrollment_id
      #   The Identifier of the IntraFi Account Enrollment to remove from IntraFi.
      #
      #   @return [String]
      required :intrafi_account_enrollment_id, String

      # @!method initialize(intrafi_account_enrollment_id:, request_options: {})
      #   @param intrafi_account_enrollment_id [String] The Identifier of the IntraFi Account Enrollment to remove from IntraFi.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
