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
      #     total balance across many participating banks in the network.
      #
      #   @return [Array<Increase::Models::IntrafiBalance::Balance>]
      required :balances, -> { Increase::Internal::Type::ArrayOf[Increase::Models::IntrafiBalance::Balance] }

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the account
      #     currency.
      #
      #   @return [Symbol, Increase::Models::IntrafiBalance::Currency]
      required :currency, enum: -> { Increase::Models::IntrafiBalance::Currency }

      # @!attribute effective_date
      #   The date this balance reflects.
      #
      #   @return [Date]
      required :effective_date, Date

      # @!attribute total_balance
      #   The total balance, in minor units of `currency`. Increase reports this balance
      #     to IntraFi daily.
      #
      #   @return [Integer]
      required :total_balance, Integer

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `intrafi_balance`.
      #
      #   @return [Symbol, Increase::Models::IntrafiBalance::Type]
      required :type, enum: -> { Increase::Models::IntrafiBalance::Type }

      # @!parse
      #   # When using IntraFi, each account's balance over the standard FDIC insurance
      #   #   amount are swept to various other institutions. Funds are rebalanced across
      #   #   banks as needed once per business day.
      #   #
      #   # @param id [String]
      #   # @param balances [Array<Increase::Models::IntrafiBalance::Balance>]
      #   # @param currency [Symbol, Increase::Models::IntrafiBalance::Currency]
      #   # @param effective_date [Date]
      #   # @param total_balance [Integer]
      #   # @param type [Symbol, Increase::Models::IntrafiBalance::Type]
      #   #
      #   def initialize(id:, balances:, currency:, effective_date:, total_balance:, type:, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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
        required :bank_location, -> { Increase::Models::IntrafiBalance::Balance::BankLocation }, nil?: true

        # @!attribute fdic_certificate_number
        #   The Federal Deposit Insurance Corporation (FDIC) certificate number of the bank.
        #     Because many banks have the same or similar names, this can be used to uniquely
        #     identify the institution.
        #
        #   @return [String]
        required :fdic_certificate_number, String

        # @!parse
        #   # @param id [String]
        #   # @param balance [Integer]
        #   # @param bank [String]
        #   # @param bank_location [Increase::Models::IntrafiBalance::Balance::BankLocation, nil]
        #   # @param fdic_certificate_number [String]
        #   #
        #   def initialize(id:, balance:, bank:, bank_location:, fdic_certificate_number:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

          # @!parse
          #   # The primary location of the bank.
          #   #
          #   # @param city [String]
          #   # @param state [String]
          #   #
          #   def initialize(city:, state:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the account
      #   currency.
      #
      # @see Increase::Models::IntrafiBalance#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # Canadian Dollar (CAD)
        CAD = :CAD

        # Swiss Franc (CHF)
        CHF = :CHF

        # Euro (EUR)
        EUR = :EUR

        # British Pound (GBP)
        GBP = :GBP

        # Japanese Yen (JPY)
        JPY = :JPY

        # US Dollar (USD)
        USD = :USD

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `intrafi_balance`.
      #
      # @see Increase::Models::IntrafiBalance#type
      module Type
        extend Increase::Internal::Type::Enum

        INTRAFI_BALANCE = :intrafi_balance

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
