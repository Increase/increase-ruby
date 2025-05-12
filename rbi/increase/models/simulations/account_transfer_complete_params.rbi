# typed: strong

module Increase
  module Models
    module Simulations
      class AccountTransferCompleteParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::AccountTransferCompleteParams,
              Increase::Internal::AnyHash
            )
          end

        sig do
          params(request_options: Increase::RequestOptions::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(request_options: {})
        end

        sig { override.returns({ request_options: Increase::RequestOptions }) }
        def to_hash
        end
      end
    end
  end
end
