# frozen_string_literal: true

module Increase
  module Internal
    module Type
      # @api private
      module RequestParameters
        # @!parse
        #   # Options to specify HTTP behaviour for this request.
        #   # @return [Increase::RequestOptions, Hash{Symbol=>Object}]
        #   attr_accessor :request_options

        # @param mod [Module]
        def self.included(mod)
          return unless mod <= Increase::Internal::Type::BaseModel

          mod.extend(Increase::Internal::Type::RequestParameters::Converter)
          mod.optional(:request_options, Increase::RequestOptions)
        end

        # @api private
        module Converter
          # @api private
          #
          # @param params [Object]
          #
          # @return [Array(Object, Hash{Symbol=>Object})]
          def dump_request(params)
            state = {can_retry: true}
            case (dumped = dump(params, state: state))
            in Hash
              options = Increase::Internal::Util.coerce_hash(dumped[:request_options])
              request_options =
                case [options, state.fetch(:can_retry)]
                in [Hash | nil, false]
                  {**options.to_h, max_retries: 0}
                else
                  options
                end
              [dumped.except(:request_options), request_options]
            else
              [dumped, nil]
            end
          end
        end
      end
    end
  end
end
