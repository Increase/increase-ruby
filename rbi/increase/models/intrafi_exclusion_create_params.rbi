# typed: strong

module Increase
  module Models
    class IntrafiExclusionCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::IntrafiExclusionCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Entity whose deposits will be excluded.
      sig { returns(String) }
      attr_accessor :entity_id

      # The FDIC certificate number of the financial institution to be excluded. An FDIC
      # certificate number uniquely identifies a financial institution, and is different
      # than a routing number. To find one, we recommend searching by Bank Name using
      # the [FDIC's bankfind tool](https://banks.data.fdic.gov/bankfind-suite/bankfind).
      sig { returns(String) }
      attr_accessor :fdic_certificate_number

      sig do
        params(
          entity_id: String,
          fdic_certificate_number: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Entity whose deposits will be excluded.
        entity_id:,
        # The FDIC certificate number of the financial institution to be excluded. An FDIC
        # certificate number uniquely identifies a financial institution, and is different
        # than a routing number. To find one, we recommend searching by Bank Name using
        # the [FDIC's bankfind tool](https://banks.data.fdic.gov/bankfind-suite/bankfind).
        fdic_certificate_number:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            entity_id: String,
            fdic_certificate_number: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
