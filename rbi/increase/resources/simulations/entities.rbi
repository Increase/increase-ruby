# typed: strong

module Increase
  module Resources
    class Simulations
      class Entities
        # Simulates setting an [Entity](#entities)'s validation under the managed
        # compliance regime. Any existing managed compliance validation on the Entity will
        # be marked as no longer current.
        sig do
          params(
            entity_id: String,
            issues:
              T::Array[
                Increase::Simulations::EntityValidationParams::Issue::OrHash
              ],
            status:
              Increase::Simulations::EntityValidationParams::Status::OrSymbol,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::Entity)
        end
        def validation(
          # The identifier of the Entity to set the validation on.
          entity_id,
          # The issues to attach to the new managed compliance validation.
          issues:,
          # The status to set on the new managed compliance validation.
          status:,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Increase::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
