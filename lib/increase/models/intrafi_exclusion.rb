# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiExclusions#create
    class IntrafiExclusion < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The identifier of this exclusion request.
      #
      #   @return [String]
      required :id, String

      # @!attribute bank_name
      #   The name of the excluded institution.
      #
      #   @return [String]
      required :bank_name, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the exclusion was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute entity_id
      #   The entity for which this institution is excluded.
      #
      #   @return [String]
      required :entity_id, String

      # @!attribute excluded_at
      #   When this was exclusion was confirmed by IntraFi.
      #
      #   @return [Time, nil]
      required :excluded_at, Time, nil?: true

      # @!attribute fdic_certificate_number
      #   The Federal Deposit Insurance Corporation's certificate number for the
      #     institution.
      #
      #   @return [String, nil]
      required :fdic_certificate_number, String, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute status
      #   The status of the exclusion request.
      #
      #   @return [Symbol, Increase::Models::IntrafiExclusion::Status]
      required :status, enum: -> { Increase::Models::IntrafiExclusion::Status }

      # @!attribute submitted_at
      #   When this was exclusion was submitted to IntraFi by Increase.
      #
      #   @return [Time, nil]
      required :submitted_at, Time, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `intrafi_exclusion`.
      #
      #   @return [Symbol, Increase::Models::IntrafiExclusion::Type]
      required :type, enum: -> { Increase::Models::IntrafiExclusion::Type }

      # @!parse
      #   # Certain institutions may be excluded per Entity when sweeping funds into the
      #   #   IntraFi network. This is useful when an Entity already has deposits at a
      #   #   particular bank, and does not want to sweep additional funds to it. It may take
      #   #   5 business days for an exclusion to be processed.
      #   #
      #   # @param id [String]
      #   # @param bank_name [String]
      #   # @param created_at [Time]
      #   # @param entity_id [String]
      #   # @param excluded_at [Time, nil]
      #   # @param fdic_certificate_number [String, nil]
      #   # @param idempotency_key [String, nil]
      #   # @param status [Symbol, Increase::Models::IntrafiExclusion::Status]
      #   # @param submitted_at [Time, nil]
      #   # @param type [Symbol, Increase::Models::IntrafiExclusion::Type]
      #   #
      #   def initialize(
      #     id:,
      #     bank_name:,
      #     created_at:,
      #     entity_id:,
      #     excluded_at:,
      #     fdic_certificate_number:,
      #     idempotency_key:,
      #     status:,
      #     submitted_at:,
      #     type:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # The status of the exclusion request.
      #
      # @see Increase::Models::IntrafiExclusion#status
      module Status
        extend Increase::Internal::Type::Enum

        # The exclusion is being added to the IntraFi network.
        PENDING = :pending

        # The exclusion has been added to the IntraFi network.
        COMPLETED = :completed

        # The exclusion has been removed from the IntraFi network.
        ARCHIVED = :archived

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `intrafi_exclusion`.
      #
      # @see Increase::Models::IntrafiExclusion#type
      module Type
        extend Increase::Internal::Type::Enum

        INTRAFI_EXCLUSION = :intrafi_exclusion

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
