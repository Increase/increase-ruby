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
          # The identifier of the Entity whose validation status to update.
          entity_id,
          # The validation issues to attach. Only allowed when `status` is `invalid`.
          issues:,
          # The validation status to set on the Entity.
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
