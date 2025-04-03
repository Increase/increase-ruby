# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiAccountEnrollments#create
    class IntrafiAccountEnrollment < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The identifier of this enrollment at IntraFi.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The identifier of the Increase Account being swept into the network.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the enrollment was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute intrafi_id
      #   The identifier of the account in IntraFi's system. This identifier will be
      #     printed on any IntraFi statements or documents.
      #
      #   @return [String]
      required :intrafi_id, String

      # @!attribute status
      #   The status of the account in the network. An account takes about one business
      #     day to go from `pending_enrolling` to `enrolled`.
      #
      #   @return [Symbol, Increase::Models::IntrafiAccountEnrollment::Status]
      required :status, enum: -> { Increase::Models::IntrafiAccountEnrollment::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `intrafi_account_enrollment`.
      #
      #   @return [Symbol, Increase::Models::IntrafiAccountEnrollment::Type]
      required :type, enum: -> { Increase::Models::IntrafiAccountEnrollment::Type }

      # @!parse
      #   # IntraFi is a
      #   #   [network of financial institutions](https://www.intrafi.com/network-banks) that
      #   #   allows Increase users to sweep funds to multiple banks, in addition to
      #   #   Increase's main bank partners. This enables accounts to become eligible for
      #   #   additional Federal Deposit Insurance Corporation (FDIC) insurance. An IntraFi
      #   #   Account Enrollment object represents the status of an account in the network.
      #   #   Sweeping an account to IntraFi doesn't affect funds availability.
      #   #
      #   # @param id [String]
      #   # @param account_id [String]
      #   # @param created_at [Time]
      #   # @param idempotency_key [String, nil]
      #   # @param intrafi_id [String]
      #   # @param status [Symbol, Increase::Models::IntrafiAccountEnrollment::Status]
      #   # @param type [Symbol, Increase::Models::IntrafiAccountEnrollment::Type]
      #   #
      #   def initialize(id:, account_id:, created_at:, idempotency_key:, intrafi_id:, status:, type:, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # The status of the account in the network. An account takes about one business
      #   day to go from `pending_enrolling` to `enrolled`.
      #
      # @see Increase::Models::IntrafiAccountEnrollment#status
      module Status
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

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `intrafi_account_enrollment`.
      #
      # @see Increase::Models::IntrafiAccountEnrollment#type
      module Type
        extend Increase::Internal::Type::Enum

        INTRAFI_ACCOUNT_ENROLLMENT = :intrafi_account_enrollment

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
