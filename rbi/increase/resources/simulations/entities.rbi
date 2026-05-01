# typed: strong

module Increase
  module Resources
    class Simulations
      class Entities
        # Set the status for an
        # [Entity's validation](/documentation/api/entities#entity-object.validation). In
        # production, Know Your Customer validations
        # [run automatically](/documentation/entity-validation#entity-validation). While
        # developing, it can be helpful to override the behavior in Sandbox.
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
