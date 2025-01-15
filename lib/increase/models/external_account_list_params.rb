# frozen_string_literal: true

module Increase
  module Models
    class ExternalAccountListParams < Increase::BaseModel
      # @!attribute cursor
      #   Return the page of entries after this one.
      #
      #   @return [String]
      optional :cursor, String

      # @!attribute idempotency_key
      #   Filter records to the one with the specified `idempotency_key` you chose for that object. This value is unique across Increase and is used to ensure that a request is only processed once. Learn more about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String]
      optional :idempotency_key, String

      # @!attribute limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100 objects.
      #
      #   @return [Integer]
      optional :limit, Integer

      # @!attribute routing_number
      #   Filter External Accounts to those with the specified Routing Number.
      #
      #   @return [String]
      optional :routing_number, String

      # @!attribute status
      #
      #   @return [Increase::Models::ExternalAccountListParams::Status]
      optional :status, -> { Increase::Models::ExternalAccountListParams::Status }

      # @!parse
      #   # @param cursor [String] Return the page of entries after this one.
      #   #
      #   # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for
      #   #   that object. This value is unique across Increase and is used to ensure that a
      #   #   request is only processed once. Learn more about
      #   #   [idempotency](https://increase.com/documentation/idempotency-keys).
      #   #
      #   # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100
      #   #   objects.
      #   #
      #   # @param routing_number [String] Filter External Accounts to those with the specified Routing Number.
      #   #
      #   # @param status [Increase::Models::ExternalAccountListParams::Status]
      #   #
      #   def initialize(cursor: nil, idempotency_key: nil, limit: nil, routing_number: nil, status: nil, **) = super

      # def initialize: (Hash | Increase::BaseModel) -> void

      # @example
      #
      # ```ruby
      # status => {
      #   in_: -> { Increase::ArrayOf[enum: Increase::Models::ExternalAccountListParams::Status::In] === _1 }
      # }
      # ```
      class Status < Increase::BaseModel
        # @!attribute in_
        #   Filter External Accounts for those with the specified status or statuses. For GET requests, this should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::ExternalAccountListParams::Status::In>]
        optional :in_,
                 -> { Increase::ArrayOf[enum: Increase::Models::ExternalAccountListParams::Status::In] },
                 api_name: :in

        # @!parse
        #   # @param in_ [Array<String>] Filter External Accounts for those with the specified status or statuses. For
        #   #   GET requests, this should be encoded as a comma-delimited string, such as
        #   #   `?in=one,two,three`.
        #   #
        #   def initialize(in_: nil, **) = super

        # def initialize: (Hash | Increase::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case in
        # in :active
        #   # ...
        # in :archived
        #   # ...
        # end
        # ```
        class In < Increase::Enum
          # The External Account is active.
          ACTIVE = :active

          # The External Account is archived and won't appear in the dashboard.
          ARCHIVED = :archived

          finalize!
        end
      end
    end
  end
end
