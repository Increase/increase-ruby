# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CheckDeposits#submit
      class CheckDepositSubmitParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute check_deposit_id
        #   The identifier of the Check Deposit you wish to submit.
        #
        #   @return [String]
        required :check_deposit_id, String

        # @!attribute scan
        #   If set, the simulation will use these values for the check's scanned MICR data.
        #
        #   @return [Increase::Models::Simulations::CheckDepositSubmitParams::Scan, nil]
        optional :scan, -> { Increase::Simulations::CheckDepositSubmitParams::Scan }

        # @!method initialize(check_deposit_id:, scan: nil, request_options: {})
        #   @param check_deposit_id [String] The identifier of the Check Deposit you wish to submit.
        #
        #   @param scan [Increase::Models::Simulations::CheckDepositSubmitParams::Scan] If set, the simulation will use these values for the check's scanned MICR data.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        class Scan < Increase::Internal::Type::BaseModel
          # @!attribute account_number
          #   The account number to be returned in the check deposit's scan data.
          #
          #   @return [String]
          required :account_number, String

          # @!attribute routing_number
          #   The routing number to be returned in the check deposit's scan data.
          #
          #   @return [String]
          required :routing_number, String

          # @!attribute auxiliary_on_us
          #   The auxiliary on-us data to be returned in the check deposit's scan data.
          #
          #   @return [String, nil]
          optional :auxiliary_on_us, String

          # @!method initialize(account_number:, routing_number:, auxiliary_on_us: nil)
          #   If set, the simulation will use these values for the check's scanned MICR data.
          #
          #   @param account_number [String] The account number to be returned in the check deposit's scan data.
          #
          #   @param routing_number [String] The routing number to be returned in the check deposit's scan data.
          #
          #   @param auxiliary_on_us [String] The auxiliary on-us data to be returned in the check deposit's scan data.
        end
      end
    end
  end
end
