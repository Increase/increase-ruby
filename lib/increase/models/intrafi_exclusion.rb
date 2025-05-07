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
      #   the exclusion was created.
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
      #   institution.
      #
      #   @return [String, nil]
      required :fdic_certificate_number, String, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute status
      #   The status of the exclusion request.
      #
      #   @return [Symbol, Increase::IntrafiExclusion::Status]
      required :status, enum: -> { Increase::IntrafiExclusion::Status }

      # @!attribute submitted_at
      #   When this was exclusion was submitted to IntraFi by Increase.
      #
      #   @return [Time, nil]
      required :submitted_at, Time, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `intrafi_exclusion`.
      #
      #   @return [Symbol, Increase::IntrafiExclusion::Type]
      required :type, enum: -> { Increase::IntrafiExclusion::Type }

      # @!method initialize(id:, bank_name:, created_at:, entity_id:, excluded_at:, fdic_certificate_number:, idempotency_key:, status:, submitted_at:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::IntrafiExclusion} for more details.
      #
      #   Certain institutions may be excluded per Entity when sweeping funds into the
      #   IntraFi network. This is useful when an Entity already has deposits at a
      #   particular bank, and does not want to sweep additional funds to it. It may take
      #   5 business days for an exclusion to be processed.
      #
      #   @param id [String] The identifier of this exclusion request.
      #
      #   @param bank_name [String] The name of the excluded institution.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param entity_id [String] The entity for which this institution is excluded.
      #
      #   @param excluded_at [Time, nil] When this was exclusion was confirmed by IntraFi.
      #
      #   @param fdic_certificate_number [String, nil] The Federal Deposit Insurance Corporation's certificate number for the instituti
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param status [Symbol, Increase::IntrafiExclusion::Status] The status of the exclusion request.
      #
      #   @param submitted_at [Time, nil] When this was exclusion was submitted to IntraFi by Increase.
      #
      #   @param type [Symbol, Increase::IntrafiExclusion::Type] A constant representing the object's type. For this resource it will always be `

      # The status of the exclusion request.
      #
      # @see Increase::IntrafiExclusion#status
      module Status
        extend Increase::Internal::Type::Enum

        # The exclusion is being added to the IntraFi network.
        PENDING = :pending

        # The exclusion has been added to the IntraFi network.
        COMPLETED = :completed

        # The exclusion has been removed from the IntraFi network.
        ARCHIVED = :archived

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `intrafi_exclusion`.
      #
      # @see Increase::IntrafiExclusion#type
      module Type
        extend Increase::Internal::Type::Enum

        INTRAFI_EXCLUSION = :intrafi_exclusion

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
