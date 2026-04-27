# typed: strong

module Increase
  module Models
    module Simulations
      class InboundMailItemCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::InboundMailItemCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The amount of the check to be simulated, in cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The file containing the PDF contents. If not present, a default check image file
        # will be used.
        sig { returns(T.nilable(String)) }
        attr_reader :contents_file_id

        sig { params(contents_file_id: String).void }
        attr_writer :contents_file_id

        # The identifier of the Lockbox Address to simulate inbound mail to.
        sig { returns(T.nilable(String)) }
        attr_reader :lockbox_address_id

        sig { params(lockbox_address_id: String).void }
        attr_writer :lockbox_address_id

        # The identifier of the Lockbox Recipient to simulate inbound mail to.
        sig { returns(T.nilable(String)) }
        attr_reader :lockbox_recipient_id

        sig { params(lockbox_recipient_id: String).void }
        attr_writer :lockbox_recipient_id

        sig do
          params(
            amount: Integer,
            contents_file_id: String,
            lockbox_address_id: String,
            lockbox_recipient_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The amount of the check to be simulated, in cents.
          amount:,
          # The file containing the PDF contents. If not present, a default check image file
          # will be used.
          contents_file_id: nil,
          # The identifier of the Lockbox Address to simulate inbound mail to.
          lockbox_address_id: nil,
          # The identifier of the Lockbox Recipient to simulate inbound mail to.
          lockbox_recipient_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              amount: Integer,
              contents_file_id: String,
              lockbox_address_id: String,
              lockbox_recipient_id: String,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
