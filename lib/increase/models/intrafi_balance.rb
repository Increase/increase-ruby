# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiBalances#intrafi_balance
    class IntrafiBalance < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The identifier of this balance.
      #
      #   @return [String]
      required :id, String

      # @!attribute balances
      #   Each entry represents a balance held at a different bank. IntraFi separates the
      #   total balance across many participating banks in the network.
      #
      #   @return [Array<Increase::Models::IntrafiBalance::Balance>]
      required :balances, -> { Increase::Internal::Type::ArrayOf[Increase::IntrafiBalance::Balance] }

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the account
      #   currency.
      #
      #   @return [Symbol, Increase::Models::IntrafiBalance::Currency]
      required :currency, enum: -> { Increase::IntrafiBalance::Currency }

      # @!attribute effective_date
      #   The date this balance reflects.
      #
      #   @return [Date]
      required :effective_date, Date

      # @!attribute total_balance
      #   The total balance, in minor units of `currency`. Increase reports this balance
      #   to IntraFi daily.
      #
      #   @return [Integer]
      required :total_balance, Integer

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `intrafi_balance`.
      #
      #   @return [Symbol, Increase::Models::IntrafiBalance::Type]
      required :type, enum: -> { Increase::IntrafiBalance::Type }

      # @!method initialize(id:, balances:, currency:, effective_date:, total_balance:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::IntrafiBalance} for more details.
      #
      #   When using IntraFi, each account's balance over the standard FDIC insurance
      #   amount is swept to various other institutions. Funds are rebalanced across banks
      #   as needed once per business day.
      #
      #   @param id [String] The identifier of this balance.
      #
      #   @param balances [Array<Increase::Models::IntrafiBalance::Balance>] Each entry represents a balance held at a different bank. IntraFi separates the
      #
      #   @param currency [Symbol, Increase::Models::IntrafiBalance::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the account curr
      #
      #   @param effective_date [Date] The date this balance reflects.
      #
      #   @param total_balance [Integer] The total balance, in minor units of `currency`. Increase reports this balance t
      #
      #   @param type [Symbol, Increase::Models::IntrafiBalance::Type] A constant representing the object's type. For this resource it will always be `

      class Balance < Increase::Internal::Type::BaseModel
        # @!attribute id
        #   The identifier of this balance.
        #
        #   @return [String]
        required :id, String

        # @!attribute balance
        #   The balance, in minor units of `currency`, held with this bank.
        #
        #   @return [Integer]
        required :balance, Integer

        # @!attribute bank
        #   The name of the bank holding these funds.
        #
        #   @return [String]
        required :bank, String

        # @!attribute bank_location
        #   The primary location of the bank.
        #
        #   @return [Increase::Models::IntrafiBalance::Balance::BankLocation, nil]
        required :bank_location, -> { Increase::IntrafiBalance::Balance::BankLocation }, nil?: true

        # @!attribute fdic_certificate_number
        #   The Federal Deposit Insurance Corporation (FDIC) certificate number of the bank.
        #   Because many banks have the same or similar names, this can be used to uniquely
        #   identify the institution.
        #
        #   @return [String]
        required :fdic_certificate_number, String

        # @!method initialize(id:, balance:, bank:, bank_location:, fdic_certificate_number:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::IntrafiBalance::Balance} for more details.
        #
        #   @param id [String] The identifier of this balance.
        #
        #   @param balance [Integer] The balance, in minor units of `currency`, held with this bank.
        #
        #   @param bank [String] The name of the bank holding these funds.
        #
        #   @param bank_location [Increase::Models::IntrafiBalance::Balance::BankLocation, nil] The primary location of the bank.
        #
        #   @param fdic_certificate_number [String] The Federal Deposit Insurance Corporation (FDIC) certificate number of the bank.

        # @see Increase::Models::IntrafiBalance::Balance#bank_location
        class BankLocation < Increase::Internal::Type::BaseModel
          # @!attribute city
          #   The bank's city.
          #
          #   @return [String]
          required :city, String

          # @!attribute state
          #   The bank's state.
          #
          #   @return [String]
          required :state, String

          # @!method initialize(city:, state:)
          #   The primary location of the bank.
          #
          #   @param city [String] The bank's city.
          #
          #   @param state [String] The bank's state.
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the account
      # currency.
      #
      # @see Increase::Models::IntrafiBalance#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `intrafi_balance`.
      #
      # @see Increase::Models::IntrafiBalance#type
      module Type
        extend Increase::Internal::Type::Enum

        INTRAFI_BALANCE = :intrafi_balance

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
