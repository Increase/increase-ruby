# typed: strong

module Increase
  module Models
    class CardPushTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardPushTransferCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The Business Application Identifier describes the type of transaction being
      # performed. Your program must be approved for the specified Business Application
      # Identifier in order to use it.
      sig do
        returns(
          Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::OrSymbol
        )
      end
      attr_accessor :business_application_identifier

      # The Increase identifier for the Card Token that represents the card number
      # you're pushing funds to.
      sig { returns(String) }
      attr_accessor :card_token_id

      # The merchant category code (MCC) of the merchant (generally your business)
      # sending the transfer. This is a four-digit code that describes the type of
      # business or service provided by the merchant. Your program must be approved for
      # the specified MCC in order to use it.
      sig { returns(String) }
      attr_accessor :merchant_category_code

      # The city name of the merchant (generally your business) sending the transfer.
      sig { returns(String) }
      attr_accessor :merchant_city_name

      # The merchant name shows up as the statement descriptor for the transfer. This is
      # typically the name of your business or organization.
      sig { returns(String) }
      attr_accessor :merchant_name

      # For certain Business Application Identifiers, the statement descriptor is
      # `merchant_name_prefix*sender_name`, where the `merchant_name_prefix` is a one to
      # four character prefix that identifies the merchant.
      sig { returns(String) }
      attr_accessor :merchant_name_prefix

      # The postal code of the merchant (generally your business) sending the transfer.
      sig { returns(String) }
      attr_accessor :merchant_postal_code

      # The state of the merchant (generally your business) sending the transfer.
      sig { returns(String) }
      attr_accessor :merchant_state

      # The amount to transfer. The receiving bank will convert this to the cardholder's
      # currency. The amount that is applied to your Increase account matches the
      # currency of your account.
      sig { returns(Increase::CardPushTransferCreateParams::PresentmentAmount) }
      attr_reader :presentment_amount

      sig do
        params(
          presentment_amount:
            Increase::CardPushTransferCreateParams::PresentmentAmount::OrHash
        ).void
      end
      attr_writer :presentment_amount

      # The name of the funds recipient.
      sig { returns(String) }
      attr_accessor :recipient_name

      # The city of the sender.
      sig { returns(String) }
      attr_accessor :sender_address_city

      # The address line 1 of the sender.
      sig { returns(String) }
      attr_accessor :sender_address_line1

      # The postal code of the sender.
      sig { returns(String) }
      attr_accessor :sender_address_postal_code

      # The state of the sender.
      sig { returns(String) }
      attr_accessor :sender_address_state

      # The name of the funds originator.
      sig { returns(String) }
      attr_accessor :sender_name

      # The identifier of the Account Number from which to send the transfer.
      sig { returns(String) }
      attr_accessor :source_account_number_id

      # Whether the transfer requires explicit approval via the dashboard or API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :require_approval

      sig { params(require_approval: T::Boolean).void }
      attr_writer :require_approval

      sig do
        params(
          business_application_identifier:
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::OrSymbol,
          card_token_id: String,
          merchant_category_code: String,
          merchant_city_name: String,
          merchant_name: String,
          merchant_name_prefix: String,
          merchant_postal_code: String,
          merchant_state: String,
          presentment_amount:
            Increase::CardPushTransferCreateParams::PresentmentAmount::OrHash,
          recipient_name: String,
          sender_address_city: String,
          sender_address_line1: String,
          sender_address_postal_code: String,
          sender_address_state: String,
          sender_name: String,
          source_account_number_id: String,
          require_approval: T::Boolean,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Business Application Identifier describes the type of transaction being
        # performed. Your program must be approved for the specified Business Application
        # Identifier in order to use it.
        business_application_identifier:,
        # The Increase identifier for the Card Token that represents the card number
        # you're pushing funds to.
        card_token_id:,
        # The merchant category code (MCC) of the merchant (generally your business)
        # sending the transfer. This is a four-digit code that describes the type of
        # business or service provided by the merchant. Your program must be approved for
        # the specified MCC in order to use it.
        merchant_category_code:,
        # The city name of the merchant (generally your business) sending the transfer.
        merchant_city_name:,
        # The merchant name shows up as the statement descriptor for the transfer. This is
        # typically the name of your business or organization.
        merchant_name:,
        # For certain Business Application Identifiers, the statement descriptor is
        # `merchant_name_prefix*sender_name`, where the `merchant_name_prefix` is a one to
        # four character prefix that identifies the merchant.
        merchant_name_prefix:,
        # The postal code of the merchant (generally your business) sending the transfer.
        merchant_postal_code:,
        # The state of the merchant (generally your business) sending the transfer.
        merchant_state:,
        # The amount to transfer. The receiving bank will convert this to the cardholder's
        # currency. The amount that is applied to your Increase account matches the
        # currency of your account.
        presentment_amount:,
        # The name of the funds recipient.
        recipient_name:,
        # The city of the sender.
        sender_address_city:,
        # The address line 1 of the sender.
        sender_address_line1:,
        # The postal code of the sender.
        sender_address_postal_code:,
        # The state of the sender.
        sender_address_state:,
        # The name of the funds originator.
        sender_name:,
        # The identifier of the Account Number from which to send the transfer.
        source_account_number_id:,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            business_application_identifier:
              Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::OrSymbol,
            card_token_id: String,
            merchant_category_code: String,
            merchant_city_name: String,
            merchant_name: String,
            merchant_name_prefix: String,
            merchant_postal_code: String,
            merchant_state: String,
            presentment_amount:
              Increase::CardPushTransferCreateParams::PresentmentAmount,
            recipient_name: String,
            sender_address_city: String,
            sender_address_line1: String,
            sender_address_postal_code: String,
            sender_address_state: String,
            sender_name: String,
            source_account_number_id: String,
            require_approval: T::Boolean,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The Business Application Identifier describes the type of transaction being
      # performed. Your program must be approved for the specified Business Application
      # Identifier in order to use it.
      module BusinessApplicationIdentifier
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Account to Account
        ACCOUNT_TO_ACCOUNT =
          T.let(
            :account_to_account,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Business to Business
        BUSINESS_TO_BUSINESS =
          T.let(
            :business_to_business,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Money Transfer Bank Initiated
        MONEY_TRANSFER_BANK_INITIATED =
          T.let(
            :money_transfer_bank_initiated,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Non-Card Bill Payment
        NON_CARD_BILL_PAYMENT =
          T.let(
            :non_card_bill_payment,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Consumer Bill Payment
        CONSUMER_BILL_PAYMENT =
          T.let(
            :consumer_bill_payment,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Card Bill Payment
        CARD_BILL_PAYMENT =
          T.let(
            :card_bill_payment,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Funds Disbursement
        FUNDS_DISBURSEMENT =
          T.let(
            :funds_disbursement,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Funds Transfer
        FUNDS_TRANSFER =
          T.let(
            :funds_transfer,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Loyalty and Offers
        LOYALTY_AND_OFFERS =
          T.let(
            :loyalty_and_offers,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Merchant Disbursement
        MERCHANT_DISBURSEMENT =
          T.let(
            :merchant_disbursement,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Merchant Payment
        MERCHANT_PAYMENT =
          T.let(
            :merchant_payment,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Person to Person
        PERSON_TO_PERSON =
          T.let(
            :person_to_person,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Top Up
        TOP_UP =
          T.let(
            :top_up,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Wallet Transfer
        WALLET_TRANSFER =
          T.let(
            :wallet_transfer,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class PresentmentAmount < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardPushTransferCreateParams::PresentmentAmount,
              Increase::Internal::AnyHash
            )
          end

        # The ISO 4217 currency code representing the currency of the amount.
        sig do
          returns(
            Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::OrSymbol
          )
        end
        attr_accessor :currency

        # The amount value as a decimal string in the currency's major unit. For example,
        # for USD, '1234.56' represents 1234 dollars and 56 cents. For JPY, '1234'
        # represents 1234 yen. A currency with minor units requires at least one decimal
        # place and supports up to the number of decimal places defined by the currency's
        # minor units. A currency without minor units does not support any decimal places.
        sig { returns(String) }
        attr_accessor :value

        # The amount to transfer. The receiving bank will convert this to the cardholder's
        # currency. The amount that is applied to your Increase account matches the
        # currency of your account.
        sig do
          params(
            currency:
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::OrSymbol,
            value: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The ISO 4217 currency code representing the currency of the amount.
          currency:,
          # The amount value as a decimal string in the currency's major unit. For example,
          # for USD, '1234.56' represents 1234 dollars and 56 cents. For JPY, '1234'
          # represents 1234 yen. A currency with minor units requires at least one decimal
          # place and supports up to the number of decimal places defined by the currency's
          # minor units. A currency without minor units does not support any decimal places.
          value:
        )
        end

        sig do
          override.returns(
            {
              currency:
                Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::OrSymbol,
              value: String
            }
          )
        end
        def to_hash
        end

        # The ISO 4217 currency code representing the currency of the amount.
        module Currency
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardPushTransferCreateParams::PresentmentAmount::Currency
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # AFN
          AFN =
            T.let(
              :AFN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # EUR
          EUR =
            T.let(
              :EUR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # ALL
          ALL =
            T.let(
              :ALL,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # DZD
          DZD =
            T.let(
              :DZD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # USD
          USD =
            T.let(
              :USD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # AOA
          AOA =
            T.let(
              :AOA,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # ARS
          ARS =
            T.let(
              :ARS,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # AMD
          AMD =
            T.let(
              :AMD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # AWG
          AWG =
            T.let(
              :AWG,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # AUD
          AUD =
            T.let(
              :AUD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # AZN
          AZN =
            T.let(
              :AZN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BSD
          BSD =
            T.let(
              :BSD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BHD
          BHD =
            T.let(
              :BHD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BDT
          BDT =
            T.let(
              :BDT,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BBD
          BBD =
            T.let(
              :BBD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BYN
          BYN =
            T.let(
              :BYN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BZD
          BZD =
            T.let(
              :BZD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BMD
          BMD =
            T.let(
              :BMD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # INR
          INR =
            T.let(
              :INR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BTN
          BTN =
            T.let(
              :BTN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BOB
          BOB =
            T.let(
              :BOB,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BOV
          BOV =
            T.let(
              :BOV,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BAM
          BAM =
            T.let(
              :BAM,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BWP
          BWP =
            T.let(
              :BWP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # NOK
          NOK =
            T.let(
              :NOK,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BRL
          BRL =
            T.let(
              :BRL,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BND
          BND =
            T.let(
              :BND,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BGN
          BGN =
            T.let(
              :BGN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # BIF
          BIF =
            T.let(
              :BIF,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # CVE
          CVE =
            T.let(
              :CVE,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # KHR
          KHR =
            T.let(
              :KHR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # CAD
          CAD =
            T.let(
              :CAD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # KYD
          KYD =
            T.let(
              :KYD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # CLP
          CLP =
            T.let(
              :CLP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # CLF
          CLF =
            T.let(
              :CLF,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # CNY
          CNY =
            T.let(
              :CNY,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # COP
          COP =
            T.let(
              :COP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # COU
          COU =
            T.let(
              :COU,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # KMF
          KMF =
            T.let(
              :KMF,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # CDF
          CDF =
            T.let(
              :CDF,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # NZD
          NZD =
            T.let(
              :NZD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # CRC
          CRC =
            T.let(
              :CRC,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # CUP
          CUP =
            T.let(
              :CUP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # CZK
          CZK =
            T.let(
              :CZK,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # DKK
          DKK =
            T.let(
              :DKK,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # DJF
          DJF =
            T.let(
              :DJF,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # DOP
          DOP =
            T.let(
              :DOP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # EGP
          EGP =
            T.let(
              :EGP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SVC
          SVC =
            T.let(
              :SVC,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # ERN
          ERN =
            T.let(
              :ERN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SZL
          SZL =
            T.let(
              :SZL,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # ETB
          ETB =
            T.let(
              :ETB,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # FKP
          FKP =
            T.let(
              :FKP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # FJD
          FJD =
            T.let(
              :FJD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # GMD
          GMD =
            T.let(
              :GMD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # GEL
          GEL =
            T.let(
              :GEL,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # GHS
          GHS =
            T.let(
              :GHS,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # GIP
          GIP =
            T.let(
              :GIP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # GTQ
          GTQ =
            T.let(
              :GTQ,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # GBP
          GBP =
            T.let(
              :GBP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # GNF
          GNF =
            T.let(
              :GNF,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # GYD
          GYD =
            T.let(
              :GYD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # HTG
          HTG =
            T.let(
              :HTG,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # HNL
          HNL =
            T.let(
              :HNL,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # HKD
          HKD =
            T.let(
              :HKD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # HUF
          HUF =
            T.let(
              :HUF,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # ISK
          ISK =
            T.let(
              :ISK,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # IDR
          IDR =
            T.let(
              :IDR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # IRR
          IRR =
            T.let(
              :IRR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # IQD
          IQD =
            T.let(
              :IQD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # ILS
          ILS =
            T.let(
              :ILS,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # JMD
          JMD =
            T.let(
              :JMD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # JPY
          JPY =
            T.let(
              :JPY,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # JOD
          JOD =
            T.let(
              :JOD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # KZT
          KZT =
            T.let(
              :KZT,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # KES
          KES =
            T.let(
              :KES,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # KPW
          KPW =
            T.let(
              :KPW,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # KRW
          KRW =
            T.let(
              :KRW,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # KWD
          KWD =
            T.let(
              :KWD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # KGS
          KGS =
            T.let(
              :KGS,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # LAK
          LAK =
            T.let(
              :LAK,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # LBP
          LBP =
            T.let(
              :LBP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # LSL
          LSL =
            T.let(
              :LSL,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # ZAR
          ZAR =
            T.let(
              :ZAR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # LRD
          LRD =
            T.let(
              :LRD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # LYD
          LYD =
            T.let(
              :LYD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # CHF
          CHF =
            T.let(
              :CHF,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MOP
          MOP =
            T.let(
              :MOP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MKD
          MKD =
            T.let(
              :MKD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MGA
          MGA =
            T.let(
              :MGA,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MWK
          MWK =
            T.let(
              :MWK,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MYR
          MYR =
            T.let(
              :MYR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MVR
          MVR =
            T.let(
              :MVR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MRU
          MRU =
            T.let(
              :MRU,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MUR
          MUR =
            T.let(
              :MUR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MXN
          MXN =
            T.let(
              :MXN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MXV
          MXV =
            T.let(
              :MXV,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MDL
          MDL =
            T.let(
              :MDL,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MNT
          MNT =
            T.let(
              :MNT,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MAD
          MAD =
            T.let(
              :MAD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MZN
          MZN =
            T.let(
              :MZN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # MMK
          MMK =
            T.let(
              :MMK,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # NAD
          NAD =
            T.let(
              :NAD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # NPR
          NPR =
            T.let(
              :NPR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # NIO
          NIO =
            T.let(
              :NIO,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # NGN
          NGN =
            T.let(
              :NGN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # OMR
          OMR =
            T.let(
              :OMR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # PKR
          PKR =
            T.let(
              :PKR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # PAB
          PAB =
            T.let(
              :PAB,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # PGK
          PGK =
            T.let(
              :PGK,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # PYG
          PYG =
            T.let(
              :PYG,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # PEN
          PEN =
            T.let(
              :PEN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # PHP
          PHP =
            T.let(
              :PHP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # PLN
          PLN =
            T.let(
              :PLN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # QAR
          QAR =
            T.let(
              :QAR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # RON
          RON =
            T.let(
              :RON,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # RUB
          RUB =
            T.let(
              :RUB,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # RWF
          RWF =
            T.let(
              :RWF,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SHP
          SHP =
            T.let(
              :SHP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # WST
          WST =
            T.let(
              :WST,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # STN
          STN =
            T.let(
              :STN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SAR
          SAR =
            T.let(
              :SAR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # RSD
          RSD =
            T.let(
              :RSD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SCR
          SCR =
            T.let(
              :SCR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SLE
          SLE =
            T.let(
              :SLE,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SGD
          SGD =
            T.let(
              :SGD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SBD
          SBD =
            T.let(
              :SBD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SOS
          SOS =
            T.let(
              :SOS,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SSP
          SSP =
            T.let(
              :SSP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # LKR
          LKR =
            T.let(
              :LKR,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SDG
          SDG =
            T.let(
              :SDG,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SRD
          SRD =
            T.let(
              :SRD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SEK
          SEK =
            T.let(
              :SEK,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # CHE
          CHE =
            T.let(
              :CHE,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # CHW
          CHW =
            T.let(
              :CHW,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # SYP
          SYP =
            T.let(
              :SYP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # TWD
          TWD =
            T.let(
              :TWD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # TJS
          TJS =
            T.let(
              :TJS,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # TZS
          TZS =
            T.let(
              :TZS,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # THB
          THB =
            T.let(
              :THB,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # TOP
          TOP =
            T.let(
              :TOP,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # TTD
          TTD =
            T.let(
              :TTD,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # TND
          TND =
            T.let(
              :TND,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # TRY
          TRY =
            T.let(
              :TRY,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # TMT
          TMT =
            T.let(
              :TMT,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # UGX
          UGX =
            T.let(
              :UGX,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # UAH
          UAH =
            T.let(
              :UAH,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # AED
          AED =
            T.let(
              :AED,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # USN
          USN =
            T.let(
              :USN,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # UYU
          UYU =
            T.let(
              :UYU,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # UYI
          UYI =
            T.let(
              :UYI,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # UYW
          UYW =
            T.let(
              :UYW,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # UZS
          UZS =
            T.let(
              :UZS,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # VUV
          VUV =
            T.let(
              :VUV,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # VES
          VES =
            T.let(
              :VES,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # VED
          VED =
            T.let(
              :VED,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # VND
          VND =
            T.let(
              :VND,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # YER
          YER =
            T.let(
              :YER,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # ZMW
          ZMW =
            T.let(
              :ZMW,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          # ZWG
          ZWG =
            T.let(
              :ZWG,
              Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardPushTransferCreateParams::PresentmentAmount::Currency::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
