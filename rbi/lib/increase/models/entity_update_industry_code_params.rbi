# typed: strong

module Increase
  module Models
    class EntityUpdateIndustryCodeParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The North American Industry Classification System (NAICS) code for the
      #   corporation's primary line of business. This is a number, like `5132` for
      #   `Software Publishers`. A full list of classification codes is available
      #   [here](https://increase.com/documentation/data-dictionary#north-american-industry-classification-system-codes).
      sig { returns(String) }
      attr_accessor :industry_code

      sig do
        params(
          industry_code: String,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(industry_code:, request_options: {})
      end

      sig { override.returns({industry_code: String, request_options: Increase::RequestOptions}) }
      def to_hash
      end
    end
  end
end
