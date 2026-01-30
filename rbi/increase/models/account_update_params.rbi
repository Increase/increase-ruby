# typed: strong

module Increase
  module Models
    class AccountUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::AccountUpdateParams, Increase::Internal::AnyHash)
        end

      # The loan details for the account.
      sig { returns(T.nilable(Increase::AccountUpdateParams::Loan)) }
      attr_reader :loan

      sig { params(loan: Increase::AccountUpdateParams::Loan::OrHash).void }
      attr_writer :loan

      # The new name of the Account.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig do
        params(
          loan: Increase::AccountUpdateParams::Loan::OrHash,
          name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The loan details for the account.
        loan: nil,
        # The new name of the Account.
        name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            loan: Increase::AccountUpdateParams::Loan,
            name: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Loan < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::AccountUpdateParams::Loan,
              Increase::Internal::AnyHash
            )
          end

        # The maximum amount of money that can be drawn from the Account.
        sig { returns(Integer) }
        attr_accessor :credit_limit

        # The loan details for the account.
        sig { params(credit_limit: Integer).returns(T.attached_class) }
        def self.new(
          # The maximum amount of money that can be drawn from the Account.
          credit_limit:
        )
        end

        sig { override.returns({ credit_limit: Integer }) }
        def to_hash
        end
      end
    end
  end
end
