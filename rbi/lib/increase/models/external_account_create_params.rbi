# typed: strong

module Increase
  module Models
    class ExternalAccountCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The account number for the destination account.
      sig { returns(String) }
      attr_accessor :account_number

      # The name you choose for the Account.
      sig { returns(String) }
      attr_accessor :description

      # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      #   destination account.
      sig { returns(String) }
      attr_accessor :routing_number

      # The type of entity that owns the External Account.
      sig { returns(T.nilable(Increase::Models::ExternalAccountCreateParams::AccountHolder::OrSymbol)) }
      attr_reader :account_holder

      sig { params(account_holder: Increase::Models::ExternalAccountCreateParams::AccountHolder::OrSymbol).void }
      attr_writer :account_holder

      # The type of the destination account. Defaults to `checking`.
      sig { returns(T.nilable(Increase::Models::ExternalAccountCreateParams::Funding::OrSymbol)) }
      attr_reader :funding

      sig { params(funding: Increase::Models::ExternalAccountCreateParams::Funding::OrSymbol).void }
      attr_writer :funding

      sig do
        params(
          account_number: String,
          description: String,
          routing_number: String,
          account_holder: Increase::Models::ExternalAccountCreateParams::AccountHolder::OrSymbol,
          funding: Increase::Models::ExternalAccountCreateParams::Funding::OrSymbol,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        account_number:,
        description:,
        routing_number:,
        account_holder: nil,
        funding: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              account_number: String,
              description: String,
              routing_number: String,
              account_holder: Increase::Models::ExternalAccountCreateParams::AccountHolder::OrSymbol,
              funding: Increase::Models::ExternalAccountCreateParams::Funding::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      # The type of entity that owns the External Account.
      module AccountHolder
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Models::ExternalAccountCreateParams::AccountHolder) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::ExternalAccountCreateParams::AccountHolder::TaggedSymbol) }

        # The External Account is owned by a business.
        BUSINESS = T.let(:business, Increase::Models::ExternalAccountCreateParams::AccountHolder::TaggedSymbol)

        # The External Account is owned by an individual.
        INDIVIDUAL =
          T.let(:individual, Increase::Models::ExternalAccountCreateParams::AccountHolder::TaggedSymbol)

        # It's unknown what kind of entity owns the External Account.
        UNKNOWN = T.let(:unknown, Increase::Models::ExternalAccountCreateParams::AccountHolder::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::ExternalAccountCreateParams::AccountHolder::TaggedSymbol]) }
        def self.values
        end
      end

      # The type of the destination account. Defaults to `checking`.
      module Funding
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::ExternalAccountCreateParams::Funding) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::ExternalAccountCreateParams::Funding::TaggedSymbol) }

        # A checking account.
        CHECKING = T.let(:checking, Increase::Models::ExternalAccountCreateParams::Funding::TaggedSymbol)

        # A savings account.
        SAVINGS = T.let(:savings, Increase::Models::ExternalAccountCreateParams::Funding::TaggedSymbol)

        # A different type of account.
        OTHER = T.let(:other, Increase::Models::ExternalAccountCreateParams::Funding::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::ExternalAccountCreateParams::Funding::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
