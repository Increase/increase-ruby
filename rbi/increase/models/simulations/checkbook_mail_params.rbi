# typed: strong

module Increase
  module Models
    module Simulations
      class CheckbookMailParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CheckbookMailParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Checkbook you wish to mail.
        sig { returns(String) }
        attr_accessor :checkbook_id

        sig do
          params(
            checkbook_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Checkbook you wish to mail.
          checkbook_id:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            { checkbook_id: String, request_options: Increase::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
