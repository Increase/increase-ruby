# typed: strong

module Increase
  module Resources
    class Simulations
      class Entities
        # Simulate updates to an
        # [Entity's validation](/documentation/api/entities#entity-object.validation). In
        # production, Know Your Customer validations
        # [run automatically](/documentation/entity-validation#entity-validation) for
        # eligible programs. While developing, use this API to simulate issues with
        # information submissions.
        sig do
          params(
            entity_id: String,
            issues:
              T::Array[
                Increase::Simulations::EntityUpdateValidationParams::Issue::OrHash
              ],
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::Entity)
        end
        def update_validation(
          # The identifier of the Entity whose validation status to update.
          entity_id,
          # The validation issues to attach. If no issues are provided, the validation
          # status will be set to `valid`.
          issues:,
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
