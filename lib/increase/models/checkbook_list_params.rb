# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Checkbooks#list
    class CheckbookListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_number_id
      #   Filter Checkbooks to those attached to the specified Account Number.
      #
      #   @return [String, nil]
      optional :account_number_id, String

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
      #   Defaults to `100`.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #
      #   @return [Increase::Models::CheckbookListParams::Status, nil]
      optional :status, -> { Increase::CheckbookListParams::Status }

      # @!method initialize(account_number_id: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #   @param account_number_id [String] Filter Checkbooks to those attached to the specified Account Number.
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param idempotency_key [String]
      #     Filter records to the one with the specified `idempotency_key` you chose for
      #     that object. This value is unique across Increase and is used to ensure that a
      #     request is only processed once. Learn more about
      #     [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @param limit [Integer]
      #     Limit the size of the list that is returned. The default (and maximum) is 100
      #     objects.
      #
      #     Defaults to `100`.
      #
      #   @param status [Increase::Models::CheckbookListParams::Status]
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute in_
        #   Filter Checkbooks for those with the specified status or statuses. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::CheckbookListParams::Status::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::CheckbookListParams::Status::In] },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   @param in_ [Array<Symbol, Increase::Models::CheckbookListParams::Status::In>]
        #     Filter Checkbooks for those with the specified status or statuses. For GET
        #     requests, this should be encoded as a comma-delimited string, such as
        #     `?in=one,two,three`.

        module In
          extend Increase::Internal::Type::Enum

          # The Checkbook is pending submission to the printer.
          PENDING_SUBMISSION = :pending_submission

          # The Checkbook has been submitted to the printer and is pending mailing.
          PENDING_MAILING = :pending_mailing

          # The Checkbook has been mailed.
          MAILED = :mailed

          # The Checkbook has been stopped and its checks can no longer be deposited.
          STOPPED = :stopped

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
