# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Lockboxes#update
    class LockboxUpdateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute [r] description
      #   The description you choose for the Lockbox.
      #
      #   @return [String, nil]
      optional :description, String

      # @!parse
      #   # @return [String]
      #   attr_writer :description

      # @!attribute [r] recipient_name
      #   The recipient name you choose for the Lockbox.
      #
      #   @return [String, nil]
      optional :recipient_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :recipient_name

      # @!attribute [r] status
      #   This indicates if checks can be sent to the Lockbox.
      #
      #   @return [Symbol, Increase::Models::LockboxUpdateParams::Status, nil]
      optional :status, enum: -> { Increase::Models::LockboxUpdateParams::Status }

      # @!parse
      #   # @return [Symbol, Increase::Models::LockboxUpdateParams::Status]
      #   attr_writer :status

      # @!parse
      #   # @param description [String]
      #   # @param recipient_name [String]
      #   # @param status [Symbol, Increase::Models::LockboxUpdateParams::Status]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(description: nil, recipient_name: nil, status: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # This indicates if checks can be sent to the Lockbox.
      module Status
        extend Increase::Internal::Type::Enum

        # This Lockbox is active. Checks mailed to it will be deposited automatically.
        ACTIVE = :active

        # This Lockbox is inactive. Checks mailed to it will not be deposited.
        INACTIVE = :inactive

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
