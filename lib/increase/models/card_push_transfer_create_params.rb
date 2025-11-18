# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardPushTransfers#create
    class CardPushTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute business_application_identifier
      #   The Business Application Identifier describes the type of transaction being
      #   performed. Your program must be approved for the specified Business Application
      #   Identifier in order to use it.
      #
      #   @return [Symbol, Increase::Models::CardPushTransferCreateParams::BusinessApplicationIdentifier]
      required :business_application_identifier,
               enum: -> { Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier }

      # @!attribute card_token_id
      #   The Increase identifier for the Card Token that represents the card number
      #   you're pushing funds to.
      #
      #   @return [String]
      required :card_token_id, String

      # @!attribute merchant_category_code
      #   The merchant category code (MCC) of the merchant (generally your business)
      #   sending the transfer. This is a four-digit code that describes the type of
      #   business or service provided by the merchant. Your program must be approved for
      #   the specified MCC in order to use it.
      #
      #   @return [String]
      required :merchant_category_code, String

      # @!attribute merchant_city_name
      #   The city name of the merchant (generally your business) sending the transfer.
      #
      #   @return [String]
      required :merchant_city_name, String

      # @!attribute merchant_name
      #   The merchant name shows up as the statement descriptor for the transfer. This is
      #   typically the name of your business or organization.
      #
      #   @return [String]
      required :merchant_name, String

      # @!attribute merchant_name_prefix
      #   For certain Business Application Identifiers, the statement descriptor is
      #   `merchant_name_prefix*sender_name`, where the `merchant_name_prefix` is a one to
      #   four character prefix that identifies the merchant.
      #
      #   @return [String]
      required :merchant_name_prefix, String

      # @!attribute merchant_postal_code
      #   The postal code of the merchant (generally your business) sending the transfer.
      #
      #   @return [String]
      required :merchant_postal_code, String

      # @!attribute merchant_state
      #   The state of the merchant (generally your business) sending the transfer.
      #
      #   @return [String]
      required :merchant_state, String

      # @!attribute presentment_amount
      #   The amount to transfer. The receiving bank will convert this to the cardholder's
      #   currency. The amount that is applied to your Increase account matches the
      #   currency of your account.
      #
      #   @return [Increase::Models::CardPushTransferCreateParams::PresentmentAmount]
      required :presentment_amount, -> { Increase::CardPushTransferCreateParams::PresentmentAmount }

      # @!attribute recipient_name
      #   The name of the funds recipient.
      #
      #   @return [String]
      required :recipient_name, String

      # @!attribute sender_address_city
      #   The city of the sender.
      #
      #   @return [String]
      required :sender_address_city, String

      # @!attribute sender_address_line1
      #   The address line 1 of the sender.
      #
      #   @return [String]
      required :sender_address_line1, String

      # @!attribute sender_address_postal_code
      #   The postal code of the sender.
      #
      #   @return [String]
      required :sender_address_postal_code, String

      # @!attribute sender_address_state
      #   The state of the sender.
      #
      #   @return [String]
      required :sender_address_state, String

      # @!attribute sender_name
      #   The name of the funds originator.
      #
      #   @return [String]
      required :sender_name, String

      # @!attribute source_account_number_id
      #   The identifier of the Account Number from which to send the transfer.
      #
      #   @return [String]
      required :source_account_number_id, String

      # @!attribute require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::Boolean

      # @!method initialize(business_application_identifier:, card_token_id:, merchant_category_code:, merchant_city_name:, merchant_name:, merchant_name_prefix:, merchant_postal_code:, merchant_state:, presentment_amount:, recipient_name:, sender_address_city:, sender_address_line1:, sender_address_postal_code:, sender_address_state:, sender_name:, source_account_number_id:, require_approval: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardPushTransferCreateParams} for more details.
      #
      #   @param business_application_identifier [Symbol, Increase::Models::CardPushTransferCreateParams::BusinessApplicationIdentifier] The Business Application Identifier describes the type of transaction being perf
      #
      #   @param card_token_id [String] The Increase identifier for the Card Token that represents the card number you'r
      #
      #   @param merchant_category_code [String] The merchant category code (MCC) of the merchant (generally your business) sendi
      #
      #   @param merchant_city_name [String] The city name of the merchant (generally your business) sending the transfer.
      #
      #   @param merchant_name [String] The merchant name shows up as the statement descriptor for the transfer. This is
      #
      #   @param merchant_name_prefix [String] For certain Business Application Identifiers, the statement descriptor is `merch
      #
      #   @param merchant_postal_code [String] The postal code of the merchant (generally your business) sending the transfer.
      #
      #   @param merchant_state [String] The state of the merchant (generally your business) sending the transfer.
      #
      #   @param presentment_amount [Increase::Models::CardPushTransferCreateParams::PresentmentAmount] The amount to transfer. The receiving bank will convert this to the cardholder's
      #
      #   @param recipient_name [String] The name of the funds recipient.
      #
      #   @param sender_address_city [String] The city of the sender.
      #
      #   @param sender_address_line1 [String] The address line 1 of the sender.
      #
      #   @param sender_address_postal_code [String] The postal code of the sender.
      #
      #   @param sender_address_state [String] The state of the sender.
      #
      #   @param sender_name [String] The name of the funds originator.
      #
      #   @param source_account_number_id [String] The identifier of the Account Number from which to send the transfer.
      #
      #   @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The Business Application Identifier describes the type of transaction being
      # performed. Your program must be approved for the specified Business Application
      # Identifier in order to use it.
      module BusinessApplicationIdentifier
        extend Increase::Internal::Type::Enum

        # Account to Account
        ACCOUNT_TO_ACCOUNT = :account_to_account

        # Business to Business
        BUSINESS_TO_BUSINESS = :business_to_business

        # Money Transfer Bank Initiated
        MONEY_TRANSFER_BANK_INITIATED = :money_transfer_bank_initiated

        # Non-Card Bill Payment
        NON_CARD_BILL_PAYMENT = :non_card_bill_payment

        # Consumer Bill Payment
        CONSUMER_BILL_PAYMENT = :consumer_bill_payment

        # Card Bill Payment
        CARD_BILL_PAYMENT = :card_bill_payment

        # Funds Disbursement
        FUNDS_DISBURSEMENT = :funds_disbursement

        # Funds Transfer
        FUNDS_TRANSFER = :funds_transfer

        # Loyalty and Offers
        LOYALTY_AND_OFFERS = :loyalty_and_offers

        # Merchant Disbursement
        MERCHANT_DISBURSEMENT = :merchant_disbursement

        # Merchant Payment
        MERCHANT_PAYMENT = :merchant_payment

        # Person to Person
        PERSON_TO_PERSON = :person_to_person

        # Top Up
        TOP_UP = :top_up

        # Wallet Transfer
        WALLET_TRANSFER = :wallet_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class PresentmentAmount < Increase::Internal::Type::BaseModel
        # @!attribute currency
        #   The ISO 4217 currency code representing the currency of the amount.
        #
        #   @return [Symbol, Increase::Models::CardPushTransferCreateParams::PresentmentAmount::Currency]
        required :currency, enum: -> { Increase::CardPushTransferCreateParams::PresentmentAmount::Currency }

        # @!attribute value
        #   The amount value as a decimal string in the currency's major unit. For example,
        #   for USD, '1234.56' represents 1234 dollars and 56 cents. For JPY, '1234'
        #   represents 1234 yen. A currency with minor units requires at least one decimal
        #   place and supports up to the number of decimal places defined by the currency's
        #   minor units. A currency without minor units does not support any decimal places.
        #
        #   @return [String]
        required :value, String

        # @!method initialize(currency:, value:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardPushTransferCreateParams::PresentmentAmount} for more
        #   details.
        #
        #   The amount to transfer. The receiving bank will convert this to the cardholder's
        #   currency. The amount that is applied to your Increase account matches the
        #   currency of your account.
        #
        #   @param currency [Symbol, Increase::Models::CardPushTransferCreateParams::PresentmentAmount::Currency] The ISO 4217 currency code representing the currency of the amount.
        #
        #   @param value [String] The amount value as a decimal string in the currency's major unit. For example,

        # The ISO 4217 currency code representing the currency of the amount.
        #
        # @see Increase::Models::CardPushTransferCreateParams::PresentmentAmount#currency
        module Currency
          extend Increase::Internal::Type::Enum

          # AFN
          AFN = :AFN

          # EUR
          EUR = :EUR

          # ALL
          ALL = :ALL

          # DZD
          DZD = :DZD

          # USD
          USD = :USD

          # AOA
          AOA = :AOA

          # ARS
          ARS = :ARS

          # AMD
          AMD = :AMD

          # AWG
          AWG = :AWG

          # AUD
          AUD = :AUD

          # AZN
          AZN = :AZN

          # BSD
          BSD = :BSD

          # BHD
          BHD = :BHD

          # BDT
          BDT = :BDT

          # BBD
          BBD = :BBD

          # BYN
          BYN = :BYN

          # BZD
          BZD = :BZD

          # BMD
          BMD = :BMD

          # INR
          INR = :INR

          # BTN
          BTN = :BTN

          # BOB
          BOB = :BOB

          # BOV
          BOV = :BOV

          # BAM
          BAM = :BAM

          # BWP
          BWP = :BWP

          # NOK
          NOK = :NOK

          # BRL
          BRL = :BRL

          # BND
          BND = :BND

          # BGN
          BGN = :BGN

          # BIF
          BIF = :BIF

          # CVE
          CVE = :CVE

          # KHR
          KHR = :KHR

          # CAD
          CAD = :CAD

          # KYD
          KYD = :KYD

          # CLP
          CLP = :CLP

          # CLF
          CLF = :CLF

          # CNY
          CNY = :CNY

          # COP
          COP = :COP

          # COU
          COU = :COU

          # KMF
          KMF = :KMF

          # CDF
          CDF = :CDF

          # NZD
          NZD = :NZD

          # CRC
          CRC = :CRC

          # CUP
          CUP = :CUP

          # CZK
          CZK = :CZK

          # DKK
          DKK = :DKK

          # DJF
          DJF = :DJF

          # DOP
          DOP = :DOP

          # EGP
          EGP = :EGP

          # SVC
          SVC = :SVC

          # ERN
          ERN = :ERN

          # SZL
          SZL = :SZL

          # ETB
          ETB = :ETB

          # FKP
          FKP = :FKP

          # FJD
          FJD = :FJD

          # GMD
          GMD = :GMD

          # GEL
          GEL = :GEL

          # GHS
          GHS = :GHS

          # GIP
          GIP = :GIP

          # GTQ
          GTQ = :GTQ

          # GBP
          GBP = :GBP

          # GNF
          GNF = :GNF

          # GYD
          GYD = :GYD

          # HTG
          HTG = :HTG

          # HNL
          HNL = :HNL

          # HKD
          HKD = :HKD

          # HUF
          HUF = :HUF

          # ISK
          ISK = :ISK

          # IDR
          IDR = :IDR

          # IRR
          IRR = :IRR

          # IQD
          IQD = :IQD

          # ILS
          ILS = :ILS

          # JMD
          JMD = :JMD

          # JPY
          JPY = :JPY

          # JOD
          JOD = :JOD

          # KZT
          KZT = :KZT

          # KES
          KES = :KES

          # KPW
          KPW = :KPW

          # KRW
          KRW = :KRW

          # KWD
          KWD = :KWD

          # KGS
          KGS = :KGS

          # LAK
          LAK = :LAK

          # LBP
          LBP = :LBP

          # LSL
          LSL = :LSL

          # ZAR
          ZAR = :ZAR

          # LRD
          LRD = :LRD

          # LYD
          LYD = :LYD

          # CHF
          CHF = :CHF

          # MOP
          MOP = :MOP

          # MKD
          MKD = :MKD

          # MGA
          MGA = :MGA

          # MWK
          MWK = :MWK

          # MYR
          MYR = :MYR

          # MVR
          MVR = :MVR

          # MRU
          MRU = :MRU

          # MUR
          MUR = :MUR

          # MXN
          MXN = :MXN

          # MXV
          MXV = :MXV

          # MDL
          MDL = :MDL

          # MNT
          MNT = :MNT

          # MAD
          MAD = :MAD

          # MZN
          MZN = :MZN

          # MMK
          MMK = :MMK

          # NAD
          NAD = :NAD

          # NPR
          NPR = :NPR

          # NIO
          NIO = :NIO

          # NGN
          NGN = :NGN

          # OMR
          OMR = :OMR

          # PKR
          PKR = :PKR

          # PAB
          PAB = :PAB

          # PGK
          PGK = :PGK

          # PYG
          PYG = :PYG

          # PEN
          PEN = :PEN

          # PHP
          PHP = :PHP

          # PLN
          PLN = :PLN

          # QAR
          QAR = :QAR

          # RON
          RON = :RON

          # RUB
          RUB = :RUB

          # RWF
          RWF = :RWF

          # SHP
          SHP = :SHP

          # WST
          WST = :WST

          # STN
          STN = :STN

          # SAR
          SAR = :SAR

          # RSD
          RSD = :RSD

          # SCR
          SCR = :SCR

          # SLE
          SLE = :SLE

          # SGD
          SGD = :SGD

          # SBD
          SBD = :SBD

          # SOS
          SOS = :SOS

          # SSP
          SSP = :SSP

          # LKR
          LKR = :LKR

          # SDG
          SDG = :SDG

          # SRD
          SRD = :SRD

          # SEK
          SEK = :SEK

          # CHE
          CHE = :CHE

          # CHW
          CHW = :CHW

          # SYP
          SYP = :SYP

          # TWD
          TWD = :TWD

          # TJS
          TJS = :TJS

          # TZS
          TZS = :TZS

          # THB
          THB = :THB

          # TOP
          TOP = :TOP

          # TTD
          TTD = :TTD

          # TND
          TND = :TND

          # TRY
          TRY = :TRY

          # TMT
          TMT = :TMT

          # UGX
          UGX = :UGX

          # UAH
          UAH = :UAH

          # AED
          AED = :AED

          # USN
          USN = :USN

          # UYU
          UYU = :UYU

          # UYI
          UYI = :UYI

          # UYW
          UYW = :UYW

          # UZS
          UZS = :UZS

          # VUV
          VUV = :VUV

          # VES
          VES = :VES

          # VED
          VED = :VED

          # VND
          VND = :VND

          # YER
          YER = :YER

          # ZMW
          ZMW = :ZMW

          # ZWG
          ZWG = :ZWG

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
