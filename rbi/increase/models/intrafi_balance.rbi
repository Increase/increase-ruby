# typed: strong

module Increase
  module Models
    class IntrafiBalance < Increase::Internal::Type::BaseModel
      # The identifier of this balance.
      sig { returns(String) }
      attr_accessor :id

      # Each entry represents a balance held at a different bank. IntraFi separates the
      # total balance across many participating banks in the network.
      sig { returns(T::Array[Increase::Models::IntrafiBalance::Balance]) }
      attr_accessor :balances

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the account
      # currency.
      sig { returns(Increase::Models::IntrafiBalance::Currency::TaggedSymbol) }
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
      sig { returns(Increase::Models::IntrafiBalance::Type::TaggedSymbol) }
      attr_accessor :type

      # When using IntraFi, each account's balance over the standard FDIC insurance
      # amount is swept to various other institutions. Funds are rebalanced across banks
      # as needed once per business day.
      sig do
        params(
          id: String,
          balances: T::Array[T.any(Increase::Models::IntrafiBalance::Balance, Increase::Internal::AnyHash)],
          currency: Increase::Models::IntrafiBalance::Currency::OrSymbol,
          effective_date: Date,
          total_balance: Integer,
          type: Increase::Models::IntrafiBalance::Type::OrSymbol
        )
          .returns(T.attached_class)
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
      ); end
      sig do
        override
          .returns(
            {
              id: String,
              balances: T::Array[Increase::Models::IntrafiBalance::Balance],
              currency: Increase::Models::IntrafiBalance::Currency::TaggedSymbol,
              effective_date: Date,
              total_balance: Integer,
              type: Increase::Models::IntrafiBalance::Type::TaggedSymbol
            }
          )
      end
      def to_hash; end

      class Balance < Increase::Internal::Type::BaseModel
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
        sig { returns(T.nilable(Increase::Models::IntrafiBalance::Balance::BankLocation)) }
        attr_reader :bank_location

        sig do
          params(
            bank_location: T.nilable(T.any(Increase::Models::IntrafiBalance::Balance::BankLocation, Increase::Internal::AnyHash))
          )
            .void
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
            bank_location: T.nilable(T.any(Increase::Models::IntrafiBalance::Balance::BankLocation, Increase::Internal::AnyHash)),
            fdic_certificate_number: String
          )
            .returns(T.attached_class)
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
        ); end
        sig do
          override
            .returns(
              {
                id: String,
                balance: Integer,
                bank: String,
                bank_location: T.nilable(Increase::Models::IntrafiBalance::Balance::BankLocation),
                fdic_certificate_number: String
              }
            )
        end
        def to_hash; end

        class BankLocation < Increase::Internal::Type::BaseModel
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
          ); end
          sig { override.returns({city: String, state: String}) }
          def to_hash; end
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the account
      # currency.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::IntrafiBalance::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Canadian Dollar (CAD)
        CAD = T.let(:CAD, Increase::Models::IntrafiBalance::Currency::TaggedSymbol)

        # Swiss Franc (CHF)
        CHF = T.let(:CHF, Increase::Models::IntrafiBalance::Currency::TaggedSymbol)

        # Euro (EUR)
        EUR = T.let(:EUR, Increase::Models::IntrafiBalance::Currency::TaggedSymbol)

        # British Pound (GBP)
        GBP = T.let(:GBP, Increase::Models::IntrafiBalance::Currency::TaggedSymbol)

        # Japanese Yen (JPY)
        JPY = T.let(:JPY, Increase::Models::IntrafiBalance::Currency::TaggedSymbol)

        # US Dollar (USD)
        USD = T.let(:USD, Increase::Models::IntrafiBalance::Currency::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::IntrafiBalance::Currency::TaggedSymbol]) }
        def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      # `intrafi_balance`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::IntrafiBalance::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INTRAFI_BALANCE = T.let(:intrafi_balance, Increase::Models::IntrafiBalance::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::IntrafiBalance::Type::TaggedSymbol]) }
        def self.values; end
      end
    end
  end
end
