# typed: strong

module Increase
  module Models
    module Simulations
      class CardPurchaseSupplementCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CardPurchaseSupplementCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Transaction to create a Card Purchase Supplement for. The
        # Transaction must have a source of type `card_settlement`.
        sig { returns(String) }
        attr_accessor :transaction_id

        # Invoice-level information about the payment.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::CardPurchaseSupplementCreateParams::Invoice
            )
          )
        end
        attr_reader :invoice

        sig do
          params(
            invoice:
              Increase::Simulations::CardPurchaseSupplementCreateParams::Invoice::OrHash
          ).void
        end
        attr_writer :invoice

        # Line item information, such as individual products purchased.
        sig do
          returns(
            T.nilable(
              T::Array[
                Increase::Simulations::CardPurchaseSupplementCreateParams::LineItem
              ]
            )
          )
        end
        attr_reader :line_items

        sig do
          params(
            line_items:
              T::Array[
                Increase::Simulations::CardPurchaseSupplementCreateParams::LineItem::OrHash
              ]
          ).void
        end
        attr_writer :line_items

        sig do
          params(
            transaction_id: String,
            invoice:
              Increase::Simulations::CardPurchaseSupplementCreateParams::Invoice::OrHash,
            line_items:
              T::Array[
                Increase::Simulations::CardPurchaseSupplementCreateParams::LineItem::OrHash
              ],
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Transaction to create a Card Purchase Supplement for. The
          # Transaction must have a source of type `card_settlement`.
          transaction_id:,
          # Invoice-level information about the payment.
          invoice: nil,
          # Line item information, such as individual products purchased.
          line_items: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              transaction_id: String,
              invoice:
                Increase::Simulations::CardPurchaseSupplementCreateParams::Invoice,
              line_items:
                T::Array[
                  Increase::Simulations::CardPurchaseSupplementCreateParams::LineItem
                ],
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Invoice < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Simulations::CardPurchaseSupplementCreateParams::Invoice,
                Increase::Internal::AnyHash
              )
            end

          # Discount given to cardholder.
          sig { returns(T.nilable(Integer)) }
          attr_reader :discount_amount

          sig { params(discount_amount: Integer).void }
          attr_writer :discount_amount

          # Amount of duty taxes.
          sig { returns(T.nilable(Integer)) }
          attr_reader :duty_tax_amount

          sig { params(duty_tax_amount: Integer).void }
          attr_writer :duty_tax_amount

          # Date the order was taken.
          sig { returns(T.nilable(Date)) }
          attr_reader :order_date

          sig { params(order_date: Date).void }
          attr_writer :order_date

          # The shipping cost.
          sig { returns(T.nilable(Integer)) }
          attr_reader :shipping_amount

          sig { params(shipping_amount: Integer).void }
          attr_writer :shipping_amount

          # Country code of the shipping destination.
          sig { returns(T.nilable(String)) }
          attr_reader :shipping_destination_country_code

          sig { params(shipping_destination_country_code: String).void }
          attr_writer :shipping_destination_country_code

          # Postal code of the shipping destination.
          sig { returns(T.nilable(String)) }
          attr_reader :shipping_destination_postal_code

          sig { params(shipping_destination_postal_code: String).void }
          attr_writer :shipping_destination_postal_code

          # Postal code of the location being shipped from.
          sig { returns(T.nilable(String)) }
          attr_reader :shipping_source_postal_code

          sig { params(shipping_source_postal_code: String).void }
          attr_writer :shipping_source_postal_code

          # Taxes paid for freight and shipping.
          sig { returns(T.nilable(Integer)) }
          attr_reader :shipping_tax_amount

          sig { params(shipping_tax_amount: Integer).void }
          attr_writer :shipping_tax_amount

          # Tax rate for freight and shipping.
          sig { returns(T.nilable(String)) }
          attr_reader :shipping_tax_rate

          sig { params(shipping_tax_rate: String).void }
          attr_writer :shipping_tax_rate

          # Value added tax invoice reference number.
          sig { returns(T.nilable(String)) }
          attr_reader :unique_value_added_tax_invoice_reference

          sig { params(unique_value_added_tax_invoice_reference: String).void }
          attr_writer :unique_value_added_tax_invoice_reference

          # Invoice-level information about the payment.
          sig do
            params(
              discount_amount: Integer,
              duty_tax_amount: Integer,
              order_date: Date,
              shipping_amount: Integer,
              shipping_destination_country_code: String,
              shipping_destination_postal_code: String,
              shipping_source_postal_code: String,
              shipping_tax_amount: Integer,
              shipping_tax_rate: String,
              unique_value_added_tax_invoice_reference: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Discount given to cardholder.
            discount_amount: nil,
            # Amount of duty taxes.
            duty_tax_amount: nil,
            # Date the order was taken.
            order_date: nil,
            # The shipping cost.
            shipping_amount: nil,
            # Country code of the shipping destination.
            shipping_destination_country_code: nil,
            # Postal code of the shipping destination.
            shipping_destination_postal_code: nil,
            # Postal code of the location being shipped from.
            shipping_source_postal_code: nil,
            # Taxes paid for freight and shipping.
            shipping_tax_amount: nil,
            # Tax rate for freight and shipping.
            shipping_tax_rate: nil,
            # Value added tax invoice reference number.
            unique_value_added_tax_invoice_reference: nil
          )
          end

          sig do
            override.returns(
              {
                discount_amount: Integer,
                duty_tax_amount: Integer,
                order_date: Date,
                shipping_amount: Integer,
                shipping_destination_country_code: String,
                shipping_destination_postal_code: String,
                shipping_source_postal_code: String,
                shipping_tax_amount: Integer,
                shipping_tax_rate: String,
                unique_value_added_tax_invoice_reference: String
              }
            )
          end
          def to_hash
          end
        end

        class LineItem < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Simulations::CardPurchaseSupplementCreateParams::LineItem,
                Increase::Internal::AnyHash
              )
            end

          # Discount amount for this specific line item.
          sig { returns(T.nilable(Integer)) }
          attr_reader :discount_amount

          sig { params(discount_amount: Integer).void }
          attr_writer :discount_amount

          # Code used to categorize the purchase item.
          sig { returns(T.nilable(String)) }
          attr_reader :item_commodity_code

          sig { params(item_commodity_code: String).void }
          attr_writer :item_commodity_code

          # Description of the purchase item.
          sig { returns(T.nilable(String)) }
          attr_reader :item_descriptor

          sig { params(item_descriptor: String).void }
          attr_writer :item_descriptor

          # The number of units of the product being purchased.
          sig { returns(T.nilable(String)) }
          attr_reader :item_quantity

          sig { params(item_quantity: String).void }
          attr_writer :item_quantity

          # Code used to categorize the product being purchased.
          sig { returns(T.nilable(String)) }
          attr_reader :product_code

          sig { params(product_code: String).void }
          attr_writer :product_code

          # Sales tax amount for this line item.
          sig { returns(T.nilable(Integer)) }
          attr_reader :sales_tax_amount

          sig { params(sales_tax_amount: Integer).void }
          attr_writer :sales_tax_amount

          # Sales tax rate for this line item.
          sig { returns(T.nilable(String)) }
          attr_reader :sales_tax_rate

          sig { params(sales_tax_rate: String).void }
          attr_writer :sales_tax_rate

          # Total amount of all line items.
          sig { returns(T.nilable(Integer)) }
          attr_reader :total_amount

          sig { params(total_amount: Integer).void }
          attr_writer :total_amount

          # Cost of line item per unit of measure, in major units.
          sig { returns(T.nilable(String)) }
          attr_reader :unit_cost

          sig { params(unit_cost: String).void }
          attr_writer :unit_cost

          # Code indicating unit of measure (gallons, etc.).
          sig { returns(T.nilable(String)) }
          attr_reader :unit_of_measure_code

          sig { params(unit_of_measure_code: String).void }
          attr_writer :unit_of_measure_code

          sig do
            params(
              discount_amount: Integer,
              item_commodity_code: String,
              item_descriptor: String,
              item_quantity: String,
              product_code: String,
              sales_tax_amount: Integer,
              sales_tax_rate: String,
              total_amount: Integer,
              unit_cost: String,
              unit_of_measure_code: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Discount amount for this specific line item.
            discount_amount: nil,
            # Code used to categorize the purchase item.
            item_commodity_code: nil,
            # Description of the purchase item.
            item_descriptor: nil,
            # The number of units of the product being purchased.
            item_quantity: nil,
            # Code used to categorize the product being purchased.
            product_code: nil,
            # Sales tax amount for this line item.
            sales_tax_amount: nil,
            # Sales tax rate for this line item.
            sales_tax_rate: nil,
            # Total amount of all line items.
            total_amount: nil,
            # Cost of line item per unit of measure, in major units.
            unit_cost: nil,
            # Code indicating unit of measure (gallons, etc.).
            unit_of_measure_code: nil
          )
          end

          sig do
            override.returns(
              {
                discount_amount: Integer,
                item_commodity_code: String,
                item_descriptor: String,
                item_quantity: String,
                product_code: String,
                sales_tax_amount: Integer,
                sales_tax_rate: String,
                total_amount: Integer,
                unit_cost: String,
                unit_of_measure_code: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
