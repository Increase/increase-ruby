# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiAccountEnrollments#list
    class IntrafiAccountEnrollmentListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   Filter IntraFi Account Enrollments to the one belonging to an account.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute idempotency_key
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #
      #   @return [Increase::Models::IntrafiAccountEnrollmentListParams::Status, nil]
      optional :status, -> { Increase::IntrafiAccountEnrollmentListParams::Status }

      # @!method initialize(account_id: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::IntrafiAccountEnrollmentListParams} for more details.
      #
      #   @param account_id [String] Filter IntraFi Account Enrollments to the one belonging to an account.
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param status [Increase::Models::IntrafiAccountEnrollmentListParams::Status]
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute in_
        #   Filter IntraFi Account Enrollments for those with the specified status or
        #   statuses. For GET requests, this should be encoded as a comma-delimited string,
        #   such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::IntrafiAccountEnrollmentListParams::Status::In>, nil]
        optional :in_,
                 -> {
                   Increase::Internal::Type::ArrayOf[enum: Increase::IntrafiAccountEnrollmentListParams::Status::In]
                 },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::IntrafiAccountEnrollmentListParams::Status} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::Models::IntrafiAccountEnrollmentListParams::Status::In>] Filter IntraFi Account Enrollments for those with the specified status or status

        module In
          extend Increase::Internal::Type::Enum

          # The account is being added to the IntraFi network.
          PENDING_ENROLLING = :pending_enrolling

          # The account has been enrolled with IntraFi.
          ENROLLED = :enrolled

          # The account is being unenrolled from IntraFi's deposit sweep.
          PENDING_UNENROLLING = :pending_unenrolling

          # The account was once enrolled, but is no longer enrolled at IntraFi.
          UNENROLLED = :unenrolled

          # Something unexpected happened with this account. Contact Increase support.
          REQUIRES_ATTENTION = :requires_attention

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
