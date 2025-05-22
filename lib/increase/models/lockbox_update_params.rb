# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Lockboxes#update
    class LockboxUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute description
      #   The description you choose for the Lockbox.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute recipient_name
      #   The recipient name you choose for the Lockbox.
      #
      #   @return [String, nil]
      optional :recipient_name, String

      # @!attribute status
      #   This indicates if checks can be sent to the Lockbox.
      #
      #   @return [Symbol, Increase::Models::LockboxUpdateParams::Status, nil]
      optional :status, enum: -> { Increase::LockboxUpdateParams::Status }

      # @!method initialize(description: nil, recipient_name: nil, status: nil, request_options: {})
      #   @param description [String] The description you choose for the Lockbox.
      #
      #   @param recipient_name [String] The recipient name you choose for the Lockbox.
      #
      #   @param status [Symbol, Increase::Models::LockboxUpdateParams::Status] This indicates if checks can be sent to the Lockbox.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # This indicates if checks can be sent to the Lockbox.
      module Status
        extend Increase::Internal::Type::Enum

        # This Lockbox is active. Checks mailed to it will be deposited automatically.
        ACTIVE = :active

        # This Lockbox is inactive. Checks mailed to it will not be deposited.
        INACTIVE = :inactive

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
