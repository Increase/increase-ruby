# typed: strong

module Increase
  module Models
    class IntrafiBalance < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::IntrafiBalance, Increase::Internal::AnyHash)
        end

      # The identifier of this balance.
      sig { returns(String) }
      attr_accessor :id

      # Each entry represents a balance held at a different bank. IntraFi separates the
      # total balance across many participating banks in the network.
      sig { returns(T::Array[Increase::IntrafiBalance::Balance]) }
      attr_accessor :balances

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the account
      # currency.
      sig { returns(Increase::IntrafiBalance::Currency::TaggedSymbol) }
      attr_accessor :currency

      # The date this balance reflects.
      sig { returns(Date) }
      attr_accessor :effective_date

      # The total balance, in minor units of `currency`. Increase reports this balance
      # to IntraFi daily.
      sig { returns(Integer) }
      attr_accessor :total_balance

      # A constant representing the object's type. For this resource it will always be
      # `intrafi_balance`.
      sig { returns(Increase::IntrafiBalance::Type::TaggedSymbol) }
      attr_accessor :type

      # When using IntraFi, each account's balance over the standard FDIC insurance
      # amount is swept to various other institutions. Funds are rebalanced across banks
      # as needed once per business day.
      sig do
        params(
          id: String,
          balances: T::Array[Increase::IntrafiBalance::Balance::OrHash],
          currency: Increase::IntrafiBalance::Currency::OrSymbol,
          effective_date: Date,
          total_balance: Integer,
          type: Increase::IntrafiBalance::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of this balance.
        id:,
        # Each entry represents a balance held at a different bank. IntraFi separates the
        # total balance across many participating banks in the network.
        balances:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the account
        # currency.
        currency:,
        # The date this balance reflects.
        effective_date:,
        # The total balance, in minor units of `currency`. Increase reports this balance
        # to IntraFi daily.
        total_balance:,
        # A constant representing the object's type. For this resource it will always be
        # `intrafi_balance`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            balances: T::Array[Increase::IntrafiBalance::Balance],
            currency: Increase::IntrafiBalance::Currency::TaggedSymbol,
            effective_date: Date,
            total_balance: Integer,
            type: Increase::IntrafiBalance::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Balance < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::IntrafiBalance::Balance,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of this balance.
        sig { returns(String) }
        attr_accessor :id

        # The balance, in minor units of `currency`, held with this bank.
        sig { returns(Integer) }
        attr_accessor :balance

        # The name of the bank holding these funds.
        sig { returns(String) }
        attr_accessor :bank

        # The primary location of the bank.
        sig do
          returns(T.nilable(Increase::IntrafiBalance::Balance::BankLocation))
        end
        attr_reader :bank_location

        sig do
          params(
            bank_location:
              T.nilable(Increase::IntrafiBalance::Balance::BankLocation::OrHash)
          ).void
        end
        attr_writer :bank_location

        # The Federal Deposit Insurance Corporation (FDIC) certificate number of the bank.
        # Because many banks have the same or similar names, this can be used to uniquely
        # identify the institution.
        sig { returns(String) }
        attr_accessor :fdic_certificate_number

        sig do
          params(
            id: String,
            balance: Integer,
            bank: String,
            bank_location:
              T.nilable(
                Increase::IntrafiBalance::Balance::BankLocation::OrHash
              ),
            fdic_certificate_number: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of this balance.
          id:,
          # The balance, in minor units of `currency`, held with this bank.
          balance:,
          # The name of the bank holding these funds.
          bank:,
          # The primary location of the bank.
          bank_location:,
          # The Federal Deposit Insurance Corporation (FDIC) certificate number of the bank.
          # Because many banks have the same or similar names, this can be used to uniquely
          # identify the institution.
          fdic_certificate_number:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              balance: Integer,
              bank: String,
              bank_location:
                T.nilable(Increase::IntrafiBalance::Balance::BankLocation),
              fdic_certificate_number: String
            }
          )
        end
        def to_hash
        end

        class BankLocation < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::IntrafiBalance::Balance::BankLocation,
                Increase::Internal::AnyHash
              )
            end

          # The bank's city.
          sig { returns(String) }
          attr_accessor :city

          # The bank's state.
          sig { returns(String) }
          attr_accessor :state

          # The primary location of the bank.
          sig { params(city: String, state: String).returns(T.attached_class) }
          def self.new(
            # The bank's city.
            city:,
            # The bank's state.
            state:
          )
          end

          sig { override.returns({ city: String, state: String }) }
          def to_hash
          end
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the account
      # currency.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::IntrafiBalance::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # US Dollar (USD)
        USD = T.let(:USD, Increase::IntrafiBalance::Currency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::IntrafiBalance::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `intrafi_balance`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::IntrafiBalance::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INTRAFI_BALANCE =
          T.let(:intrafi_balance, Increase::IntrafiBalance::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::IntrafiBalance::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
