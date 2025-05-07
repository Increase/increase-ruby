# typed: strong

module Increase
  module Models
    module Simulations
      class InboundMailItemCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # The amount of the check to be simulated, in cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The identifier of the Lockbox to simulate inbound mail to.
        sig { returns(String) }
        attr_accessor :lockbox_id

        # The file containing the PDF contents. If not present, a default check image file
        # will be used.
        sig { returns(T.nilable(String)) }
        attr_reader :contents_file_id

        sig { params(contents_file_id: String).void }
        attr_writer :contents_file_id

        sig do
          params(
            amount: Integer,
            lockbox_id: String,
            contents_file_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The amount of the check to be simulated, in cents.
          amount:,
          # The identifier of the Lockbox to simulate inbound mail to.
          lockbox_id:,
          # The file containing the PDF contents. If not present, a default check image file
          # will be used.
          contents_file_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              amount: Integer,
              lockbox_id: String,
              contents_file_id: String,
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
