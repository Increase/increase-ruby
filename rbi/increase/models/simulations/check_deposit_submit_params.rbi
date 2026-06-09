# typed: strong

module Increase
  module Models
    module Simulations
      class CheckDepositSubmitParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CheckDepositSubmitParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Check Deposit you wish to submit.
        sig { returns(String) }
        attr_accessor :check_deposit_id

        # If set, the simulation will use these values for the check's scanned MICR data.
        # If not set, the simulation will use random values.
        sig do
          returns(
            T.nilable(Increase::Simulations::CheckDepositSubmitParams::Scan)
          )
        end
        attr_reader :scan

        sig do
          params(
            scan: Increase::Simulations::CheckDepositSubmitParams::Scan::OrHash
          ).void
        end
        attr_writer :scan

        sig do
          params(
            check_deposit_id: String,
            scan: Increase::Simulations::CheckDepositSubmitParams::Scan::OrHash,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Check Deposit you wish to submit.
          check_deposit_id:,
          # If set, the simulation will use these values for the check's scanned MICR data.
          # If not set, the simulation will use random values.
          scan: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              check_deposit_id: String,
              scan: Increase::Simulations::CheckDepositSubmitParams::Scan,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Scan < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Simulations::CheckDepositSubmitParams::Scan,
                Increase::Internal::AnyHash
              )
            end

          # The account number to be returned in the check deposit's scan data.
          sig { returns(String) }
          attr_accessor :account_number

          # The routing number to be returned in the check deposit's scan data.
          sig { returns(String) }
          attr_accessor :routing_number

          # The auxiliary on-us data to be returned in the check deposit's scan data.
          # Auxiliary on-us is typically the check number for business checks.
          sig { returns(T.nilable(String)) }
          attr_reader :auxiliary_on_us

          sig { params(auxiliary_on_us: String).void }
          attr_writer :auxiliary_on_us

          # The serial number to be returned in the check deposit's scan data. Serial number
          # is typically the check number for consumer checks.
          sig { returns(T.nilable(String)) }
          attr_reader :serial_number

          sig { params(serial_number: String).void }
          attr_writer :serial_number

          # If set, the simulation will use these values for the check's scanned MICR data.
          # If not set, the simulation will use random values.
          sig do
            params(
              account_number: String,
              routing_number: String,
              auxiliary_on_us: String,
              serial_number: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The account number to be returned in the check deposit's scan data.
            account_number:,
            # The routing number to be returned in the check deposit's scan data.
            routing_number:,
            # The auxiliary on-us data to be returned in the check deposit's scan data.
            # Auxiliary on-us is typically the check number for business checks.
            auxiliary_on_us: nil,
            # The serial number to be returned in the check deposit's scan data. Serial number
            # is typically the check number for consumer checks.
            serial_number: nil
          )
          end

          sig do
            override.returns(
              {
                account_number: String,
                routing_number: String,
                auxiliary_on_us: String,
                serial_number: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
