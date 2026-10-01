# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCheckBatches#cancel
    class PhysicalCheckBatchCancelParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute physical_check_batch_id
      #   The identifier of the pending Physical Check Batch to cancel.
      #
      #   @return [String]
      required :physical_check_batch_id, String

      # @!method initialize(physical_check_batch_id:, request_options: {})
      #   @param physical_check_batch_id [String] The identifier of the pending Physical Check Batch to cancel.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
