# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::LockboxAddresses#update
    class LockboxAddressUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute lockbox_address_id
      #   The identifier of the Lockbox Address.
      #
      #   @return [String]
      required :lockbox_address_id, String

      # @!attribute description
      #   The description you choose for the Lockbox Address.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute status
      #   The status of the Lockbox Address.
      #
      #   @return [Symbol, Increase::Models::LockboxAddressUpdateParams::Status, nil]
      optional :status, enum: -> { Increase::LockboxAddressUpdateParams::Status }

      # @!method initialize(lockbox_address_id:, description: nil, status: nil, request_options: {})
      #   @param lockbox_address_id [String] The identifier of the Lockbox Address.
      #
      #   @param description [String] The description you choose for the Lockbox Address.
      #
      #   @param status [Symbol, Increase::Models::LockboxAddressUpdateParams::Status] The status of the Lockbox Address.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The status of the Lockbox Address.
      module Status
        extend Increase::Internal::Type::Enum

        # This Lockbox Address is active.
        ACTIVE = :active

        # This Lockbox Address is disabled.
        DISABLED = :disabled

        # This Lockbox Address is permanently disabled.
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
