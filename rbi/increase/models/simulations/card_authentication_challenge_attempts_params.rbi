# typed: strong

module Increase
  module Models
    module Simulations
      class CardAuthenticationChallengeAttemptsParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CardAuthenticationChallengeAttemptsParams,
              Increase::Internal::AnyHash
            )
          end

        # The one-time code to be validated.
        sig { returns(String) }
        attr_accessor :one_time_code

        sig do
          params(
            one_time_code: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The one-time code to be validated.
          one_time_code:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            { one_time_code: String, request_options: Increase::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
