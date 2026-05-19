# typed: strong

module Increase
  module Models
    class CardPurchaseSupplement < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::CardPurchaseSupplement, Increase::Internal::AnyHash)
        end

      # The Card Purchase Supplement identifier.
      sig { returns(String) }
      attr_accessor :id

      # The ID of the Card Payment this transaction belongs to.
      sig { returns(T.nilable(String)) }
      attr_accessor :card_payment_id

      # Invoice-level information about the payment.
      sig { returns(T.nilable(Increase::CardPurchaseSupplement::Invoice)) }
      attr_reader :invoice

      sig do
        params(
          invoice: T.nilable(Increase::CardPurchaseSupplement::Invoice::OrHash)
        ).void
      end
      attr_writer :invoice

      # Line item information, such as individual products purchased.
      sig do
        returns(T.nilable(T::Array[Increase::CardPurchaseSupplement::LineItem]))
      end
      attr_accessor :line_items

      # Shipping information for the purchase.
      sig { returns(T.nilable(Increase::CardPurchaseSupplement::Shipping)) }
      attr_reader :shipping

      sig do
        params(
          shipping:
            T.nilable(Increase::CardPurchaseSupplement::Shipping::OrHash)
        ).void
      end
      attr_writer :shipping

      # The ID of the transaction.
      sig { returns(String) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      # `card_purchase_supplement`.
      sig { returns(Increase::CardPurchaseSupplement::Type::TaggedSymbol) }
      attr_accessor :type

      # Additional information about a card purchase (e.g., settlement or refund), such
      # as level 3 line item data.
      sig do
        params(
          id: String,
          card_payment_id: T.nilable(String),
          invoice: T.nilable(Increase::CardPurchaseSupplement::Invoice::OrHash),
          line_items:
            T.nilable(
              T::Array[Increase::CardPurchaseSupplement::LineItem::OrHash]
            ),
          shipping:
            T.nilable(Increase::CardPurchaseSupplement::Shipping::OrHash),
          transaction_id: String,
          type: Increase::CardPurchaseSupplement::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Card Purchase Supplement identifier.
        id:,
        # The ID of the Card Payment this transaction belongs to.
        card_payment_id:,
        # Invoice-level information about the payment.
        invoice:,
        # Line item information, such as individual products purchased.
        line_items:,
        # Shipping information for the purchase.
        shipping:,
        # The ID of the transaction.
        transaction_id:,
        # A constant representing the object's type. For this resource it will always be
        # `card_purchase_supplement`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            card_payment_id: T.nilable(String),
            invoice: T.nilable(Increase::CardPurchaseSupplement::Invoice),
            line_items:
              T.nilable(T::Array[Increase::CardPurchaseSupplement::LineItem]),
            shipping: T.nilable(Increase::CardPurchaseSupplement::Shipping),
            transaction_id: String,
            type: Increase::CardPurchaseSupplement::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Invoice < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardPurchaseSupplement::Invoice,
              Increase::Internal::AnyHash
            )
          end

        # Discount given to cardholder.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :discount_amount

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the discount.
        sig { returns(T.nilable(String)) }
        attr_accessor :discount_currency

        # Indicates how the merchant applied the discount.
        sig do
          returns(
            T.nilable(
              Increase::CardPurchaseSupplement::Invoice::DiscountTreatmentCode::TaggedSymbol
            )
          )
        end
        attr_accessor :discount_treatment_code

        # Amount of duty taxes.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :duty_tax_amount

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the duty tax.
        sig { returns(T.nilable(String)) }
        attr_accessor :duty_tax_currency

        # Date the order was taken.
        sig { returns(T.nilable(Date)) }
        attr_accessor :order_date

        # The shipping cost.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :shipping_amount

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the shipping
        # cost.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_currency

        # Country code of the shipping destination.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_destination_country_code

        # Postal code of the shipping destination.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_destination_postal_code

        # Postal code of the location being shipped from.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_source_postal_code

        # Taxes paid for freight and shipping.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :shipping_tax_amount

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the shipping
        # tax.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_tax_currency

        # Tax rate for freight and shipping.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_tax_rate

        # Indicates how the merchant applied taxes.
        sig do
          returns(
            T.nilable(
              Increase::CardPurchaseSupplement::Invoice::TaxTreatments::TaggedSymbol
            )
          )
        end
        attr_accessor :tax_treatments

        # Value added tax invoice reference number.
        sig { returns(T.nilable(String)) }
        attr_accessor :unique_value_added_tax_invoice_reference

        # Invoice-level information about the payment.
        sig do
          params(
            discount_amount: T.nilable(Integer),
            discount_currency: T.nilable(String),
            discount_treatment_code:
              T.nilable(
                Increase::CardPurchaseSupplement::Invoice::DiscountTreatmentCode::OrSymbol
              ),
            duty_tax_amount: T.nilable(Integer),
            duty_tax_currency: T.nilable(String),
            order_date: T.nilable(Date),
            shipping_amount: T.nilable(Integer),
            shipping_currency: T.nilable(String),
            shipping_destination_country_code: T.nilable(String),
            shipping_destination_postal_code: T.nilable(String),
            shipping_source_postal_code: T.nilable(String),
            shipping_tax_amount: T.nilable(Integer),
            shipping_tax_currency: T.nilable(String),
            shipping_tax_rate: T.nilable(String),
            tax_treatments:
              T.nilable(
                Increase::CardPurchaseSupplement::Invoice::TaxTreatments::OrSymbol
              ),
            unique_value_added_tax_invoice_reference: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Discount given to cardholder.
          discount_amount:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the discount.
          discount_currency:,
          # Indicates how the merchant applied the discount.
          discount_treatment_code:,
          # Amount of duty taxes.
          duty_tax_amount:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the duty tax.
          duty_tax_currency:,
          # Date the order was taken.
          order_date:,
          # The shipping cost.
          shipping_amount:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the shipping
          # cost.
          shipping_currency:,
          # Country code of the shipping destination.
          shipping_destination_country_code:,
          # Postal code of the shipping destination.
          shipping_destination_postal_code:,
          # Postal code of the location being shipped from.
          shipping_source_postal_code:,
          # Taxes paid for freight and shipping.
          shipping_tax_amount:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the shipping
          # tax.
          shipping_tax_currency:,
          # Tax rate for freight and shipping.
          shipping_tax_rate:,
          # Indicates how the merchant applied taxes.
          tax_treatments:,
          # Value added tax invoice reference number.
          unique_value_added_tax_invoice_reference:
        )
        end

        sig do
          override.returns(
            {
              discount_amount: T.nilable(Integer),
              discount_currency: T.nilable(String),
              discount_treatment_code:
                T.nilable(
                  Increase::CardPurchaseSupplement::Invoice::DiscountTreatmentCode::TaggedSymbol
                ),
              duty_tax_amount: T.nilable(Integer),
              duty_tax_currency: T.nilable(String),
              order_date: T.nilable(Date),
              shipping_amount: T.nilable(Integer),
              shipping_currency: T.nilable(String),
              shipping_destination_country_code: T.nilable(String),
              shipping_destination_postal_code: T.nilable(String),
              shipping_source_postal_code: T.nilable(String),
              shipping_tax_amount: T.nilable(Integer),
              shipping_tax_currency: T.nilable(String),
              shipping_tax_rate: T.nilable(String),
              tax_treatments:
                T.nilable(
                  Increase::CardPurchaseSupplement::Invoice::TaxTreatments::TaggedSymbol
                ),
              unique_value_added_tax_invoice_reference: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Indicates how the merchant applied the discount.
        module DiscountTreatmentCode
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardPurchaseSupplement::Invoice::DiscountTreatmentCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # No invoice level discount provided
          NO_INVOICE_LEVEL_DISCOUNT_PROVIDED =
            T.let(
              :no_invoice_level_discount_provided,
              Increase::CardPurchaseSupplement::Invoice::DiscountTreatmentCode::TaggedSymbol
            )

          # Tax calculated on post discount invoice total
          TAX_CALCULATED_ON_POST_DISCOUNT_INVOICE_TOTAL =
            T.let(
              :tax_calculated_on_post_discount_invoice_total,
              Increase::CardPurchaseSupplement::Invoice::DiscountTreatmentCode::TaggedSymbol
            )

          # Tax calculated on pre discount invoice total
          TAX_CALCULATED_ON_PRE_DISCOUNT_INVOICE_TOTAL =
            T.let(
              :tax_calculated_on_pre_discount_invoice_total,
              Increase::CardPurchaseSupplement::Invoice::DiscountTreatmentCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardPurchaseSupplement::Invoice::DiscountTreatmentCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Indicates how the merchant applied taxes.
        module TaxTreatments
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardPurchaseSupplement::Invoice::TaxTreatments
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # No tax applies
          NO_TAX_APPLIES =
            T.let(
              :no_tax_applies,
              Increase::CardPurchaseSupplement::Invoice::TaxTreatments::TaggedSymbol
            )

          # Net price line item level
          NET_PRICE_LINE_ITEM_LEVEL =
            T.let(
              :net_price_line_item_level,
              Increase::CardPurchaseSupplement::Invoice::TaxTreatments::TaggedSymbol
            )

          # Net price invoice level
          NET_PRICE_INVOICE_LEVEL =
            T.let(
              :net_price_invoice_level,
              Increase::CardPurchaseSupplement::Invoice::TaxTreatments::TaggedSymbol
            )

          # Gross price line item level
          GROSS_PRICE_LINE_ITEM_LEVEL =
            T.let(
              :gross_price_line_item_level,
              Increase::CardPurchaseSupplement::Invoice::TaxTreatments::TaggedSymbol
            )

          # Gross price invoice level
          GROSS_PRICE_INVOICE_LEVEL =
            T.let(
              :gross_price_invoice_level,
              Increase::CardPurchaseSupplement::Invoice::TaxTreatments::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardPurchaseSupplement::Invoice::TaxTreatments::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class LineItem < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardPurchaseSupplement::LineItem,
              Increase::Internal::AnyHash
            )
          end

        # The Card Purchase Supplement Line Item identifier.
        sig { returns(String) }
        attr_accessor :id

        # Indicates the type of line item.
        sig do
          returns(
            T.nilable(
              Increase::CardPurchaseSupplement::LineItem::DetailIndicator::TaggedSymbol
            )
          )
        end
        attr_accessor :detail_indicator

        # Discount amount for this specific line item.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :discount_amount

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the discount.
        sig { returns(T.nilable(String)) }
        attr_accessor :discount_currency

        # Indicates how the merchant applied the discount for this specific line item.
        sig do
          returns(
            T.nilable(
              Increase::CardPurchaseSupplement::LineItem::DiscountTreatmentCode::TaggedSymbol
            )
          )
        end
        attr_accessor :discount_treatment_code

        # Code used to categorize the purchase item.
        sig { returns(T.nilable(String)) }
        attr_accessor :item_commodity_code

        # Description of the purchase item.
        sig { returns(T.nilable(String)) }
        attr_accessor :item_descriptor

        # The number of units of the product being purchased.
        sig { returns(T.nilable(String)) }
        attr_accessor :item_quantity

        # Code used to categorize the product being purchased.
        sig { returns(T.nilable(String)) }
        attr_accessor :product_code

        # Sales tax amount for this line item.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :sales_tax_amount

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the sales tax
        # assessed.
        sig { returns(T.nilable(String)) }
        attr_accessor :sales_tax_currency

        # Sales tax rate for this line item.
        sig { returns(T.nilable(String)) }
        attr_accessor :sales_tax_rate

        # Total amount of all line items.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :total_amount

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total
        # amount.
        sig { returns(T.nilable(String)) }
        attr_accessor :total_amount_currency

        # Cost of line item per unit of measure, in major units.
        sig { returns(T.nilable(String)) }
        attr_accessor :unit_cost

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the unit cost.
        sig { returns(T.nilable(String)) }
        attr_accessor :unit_cost_currency

        # Code indicating unit of measure (gallons, etc.).
        sig { returns(T.nilable(String)) }
        attr_accessor :unit_of_measure_code

        sig do
          params(
            id: String,
            detail_indicator:
              T.nilable(
                Increase::CardPurchaseSupplement::LineItem::DetailIndicator::OrSymbol
              ),
            discount_amount: T.nilable(Integer),
            discount_currency: T.nilable(String),
            discount_treatment_code:
              T.nilable(
                Increase::CardPurchaseSupplement::LineItem::DiscountTreatmentCode::OrSymbol
              ),
            item_commodity_code: T.nilable(String),
            item_descriptor: T.nilable(String),
            item_quantity: T.nilable(String),
            product_code: T.nilable(String),
            sales_tax_amount: T.nilable(Integer),
            sales_tax_currency: T.nilable(String),
            sales_tax_rate: T.nilable(String),
            total_amount: T.nilable(Integer),
            total_amount_currency: T.nilable(String),
            unit_cost: T.nilable(String),
            unit_cost_currency: T.nilable(String),
            unit_of_measure_code: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The Card Purchase Supplement Line Item identifier.
          id:,
          # Indicates the type of line item.
          detail_indicator:,
          # Discount amount for this specific line item.
          discount_amount:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the discount.
          discount_currency:,
          # Indicates how the merchant applied the discount for this specific line item.
          discount_treatment_code:,
          # Code used to categorize the purchase item.
          item_commodity_code:,
          # Description of the purchase item.
          item_descriptor:,
          # The number of units of the product being purchased.
          item_quantity:,
          # Code used to categorize the product being purchased.
          product_code:,
          # Sales tax amount for this line item.
          sales_tax_amount:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the sales tax
          # assessed.
          sales_tax_currency:,
          # Sales tax rate for this line item.
          sales_tax_rate:,
          # Total amount of all line items.
          total_amount:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total
          # amount.
          total_amount_currency:,
          # Cost of line item per unit of measure, in major units.
          unit_cost:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the unit cost.
          unit_cost_currency:,
          # Code indicating unit of measure (gallons, etc.).
          unit_of_measure_code:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              detail_indicator:
                T.nilable(
                  Increase::CardPurchaseSupplement::LineItem::DetailIndicator::TaggedSymbol
                ),
              discount_amount: T.nilable(Integer),
              discount_currency: T.nilable(String),
              discount_treatment_code:
                T.nilable(
                  Increase::CardPurchaseSupplement::LineItem::DiscountTreatmentCode::TaggedSymbol
                ),
              item_commodity_code: T.nilable(String),
              item_descriptor: T.nilable(String),
              item_quantity: T.nilable(String),
              product_code: T.nilable(String),
              sales_tax_amount: T.nilable(Integer),
              sales_tax_currency: T.nilable(String),
              sales_tax_rate: T.nilable(String),
              total_amount: T.nilable(Integer),
              total_amount_currency: T.nilable(String),
              unit_cost: T.nilable(String),
              unit_cost_currency: T.nilable(String),
              unit_of_measure_code: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Indicates the type of line item.
        module DetailIndicator
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardPurchaseSupplement::LineItem::DetailIndicator
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Normal
          NORMAL =
            T.let(
              :normal,
              Increase::CardPurchaseSupplement::LineItem::DetailIndicator::TaggedSymbol
            )

          # Credit
          CREDIT =
            T.let(
              :credit,
              Increase::CardPurchaseSupplement::LineItem::DetailIndicator::TaggedSymbol
            )

          # Purchase
          PAYMENT =
            T.let(
              :payment,
              Increase::CardPurchaseSupplement::LineItem::DetailIndicator::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardPurchaseSupplement::LineItem::DetailIndicator::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Indicates how the merchant applied the discount for this specific line item.
        module DiscountTreatmentCode
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardPurchaseSupplement::LineItem::DiscountTreatmentCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # No line item level discount provided
          NO_LINE_ITEM_LEVEL_DISCOUNT_PROVIDED =
            T.let(
              :no_line_item_level_discount_provided,
              Increase::CardPurchaseSupplement::LineItem::DiscountTreatmentCode::TaggedSymbol
            )

          # Tax calculated on post discount line item total
          TAX_CALCULATED_ON_POST_DISCOUNT_LINE_ITEM_TOTAL =
            T.let(
              :tax_calculated_on_post_discount_line_item_total,
              Increase::CardPurchaseSupplement::LineItem::DiscountTreatmentCode::TaggedSymbol
            )

          # Tax calculated on pre discount line item total
          TAX_CALCULATED_ON_PRE_DISCOUNT_LINE_ITEM_TOTAL =
            T.let(
              :tax_calculated_on_pre_discount_line_item_total,
              Increase::CardPurchaseSupplement::LineItem::DiscountTreatmentCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardPurchaseSupplement::LineItem::DiscountTreatmentCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Shipping < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardPurchaseSupplement::Shipping,
              Increase::Internal::AnyHash
            )
          end

        # The customer reference number.
        sig { returns(T.nilable(String)) }
        attr_accessor :customer_reference_number

        # Address of the destination.
        sig { returns(T.nilable(String)) }
        attr_accessor :destination_address

        # Country code of the destination.
        sig { returns(T.nilable(String)) }
        attr_accessor :destination_country_code

        # Postal code of the destination.
        sig { returns(T.nilable(String)) }
        attr_accessor :destination_postal_code

        # Name of the receiver at the destination.
        sig { returns(T.nilable(String)) }
        attr_accessor :destination_receiver_name

        # Discount amount for the shipment.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :discount_amount

        # Net shipping amount.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :net_amount

        # Number of packages shipped.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :number_of_packages

        # Address of the origin.
        sig { returns(T.nilable(String)) }
        attr_accessor :origin_address

        # Country code of the origin.
        sig { returns(T.nilable(String)) }
        attr_accessor :origin_country_code

        # Postal code of the origin.
        sig { returns(T.nilable(String)) }
        attr_accessor :origin_postal_code

        # Name of the sender at the origin.
        sig { returns(T.nilable(String)) }
        attr_accessor :origin_sender_name

        # Date the shipment should be picked up.
        sig { returns(T.nilable(Date)) }
        attr_accessor :pick_up_date

        # Description of the shipping service.
        sig { returns(T.nilable(String)) }
        attr_accessor :service_description

        # Service level code for the shipment.
        sig { returns(T.nilable(String)) }
        attr_accessor :service_level_code

        # Name of the shipping courier.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_courier_name

        # Tax amount for the shipment.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :tax_amount

        # Tracking number for the shipment.
        sig { returns(T.nilable(String)) }
        attr_accessor :tracking_number

        # Unit of measure for the shipment weight.
        sig { returns(T.nilable(String)) }
        attr_accessor :unit_of_measure

        # Weight of the shipment.
        sig { returns(T.nilable(String)) }
        attr_accessor :weight

        # Shipping information for the purchase.
        sig do
          params(
            customer_reference_number: T.nilable(String),
            destination_address: T.nilable(String),
            destination_country_code: T.nilable(String),
            destination_postal_code: T.nilable(String),
            destination_receiver_name: T.nilable(String),
            discount_amount: T.nilable(Integer),
            net_amount: T.nilable(Integer),
            number_of_packages: T.nilable(Integer),
            origin_address: T.nilable(String),
            origin_country_code: T.nilable(String),
            origin_postal_code: T.nilable(String),
            origin_sender_name: T.nilable(String),
            pick_up_date: T.nilable(Date),
            service_description: T.nilable(String),
            service_level_code: T.nilable(String),
            shipping_courier_name: T.nilable(String),
            tax_amount: T.nilable(Integer),
            tracking_number: T.nilable(String),
            unit_of_measure: T.nilable(String),
            weight: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The customer reference number.
          customer_reference_number:,
          # Address of the destination.
          destination_address:,
          # Country code of the destination.
          destination_country_code:,
          # Postal code of the destination.
          destination_postal_code:,
          # Name of the receiver at the destination.
          destination_receiver_name:,
          # Discount amount for the shipment.
          discount_amount:,
          # Net shipping amount.
          net_amount:,
          # Number of packages shipped.
          number_of_packages:,
          # Address of the origin.
          origin_address:,
          # Country code of the origin.
          origin_country_code:,
          # Postal code of the origin.
          origin_postal_code:,
          # Name of the sender at the origin.
          origin_sender_name:,
          # Date the shipment should be picked up.
          pick_up_date:,
          # Description of the shipping service.
          service_description:,
          # Service level code for the shipment.
          service_level_code:,
          # Name of the shipping courier.
          shipping_courier_name:,
          # Tax amount for the shipment.
          tax_amount:,
          # Tracking number for the shipment.
          tracking_number:,
          # Unit of measure for the shipment weight.
          unit_of_measure:,
          # Weight of the shipment.
          weight:
        )
        end

        sig do
          override.returns(
            {
              customer_reference_number: T.nilable(String),
              destination_address: T.nilable(String),
              destination_country_code: T.nilable(String),
              destination_postal_code: T.nilable(String),
              destination_receiver_name: T.nilable(String),
              discount_amount: T.nilable(Integer),
              net_amount: T.nilable(Integer),
              number_of_packages: T.nilable(Integer),
              origin_address: T.nilable(String),
              origin_country_code: T.nilable(String),
              origin_postal_code: T.nilable(String),
              origin_sender_name: T.nilable(String),
              pick_up_date: T.nilable(Date),
              service_description: T.nilable(String),
              service_level_code: T.nilable(String),
              shipping_courier_name: T.nilable(String),
              tax_amount: T.nilable(Integer),
              tracking_number: T.nilable(String),
              unit_of_measure: T.nilable(String),
              weight: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_purchase_supplement`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardPurchaseSupplement::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CARD_PURCHASE_SUPPLEMENT =
          T.let(
            :card_purchase_supplement,
            Increase::CardPurchaseSupplement::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::CardPurchaseSupplement::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
