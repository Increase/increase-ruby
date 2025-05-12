# typed: strong

module Increase
  module Models
    class IntrafiAccountEnrollmentCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::IntrafiAccountEnrollmentCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier for the account to be added to IntraFi.
      sig { returns(String) }
      attr_accessor :account_id

      # The contact email for the account owner, to be shared with IntraFi.
      sig { returns(String) }
      attr_accessor :email_address

      sig do
        params(
          account_id: String,
          email_address: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier for the account to be added to IntraFi.
        account_id:,
        # The contact email for the account owner, to be shared with IntraFi.
        email_address:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            email_address: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
