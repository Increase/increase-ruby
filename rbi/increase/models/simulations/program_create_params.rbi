# typed: strong

module Increase
  module Models
    module Simulations
      class ProgramCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::ProgramCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The name of the program being added.
        sig { returns(String) }
        attr_accessor :name

        # The identifier of the Account the Program should be added to is for.
        sig { returns(T.nilable(String)) }
        attr_reader :reserve_account_id

        sig { params(reserve_account_id: String).void }
        attr_writer :reserve_account_id

        sig do
          params(
            name: String,
            reserve_account_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The name of the program being added.
          name:,
          # The identifier of the Account the Program should be added to is for.
          reserve_account_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              name: String,
              reserve_account_id: String,
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
