# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardPurchaseSupplements#create
      class CardPurchaseSupplementCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute transaction_id
        #   The identifier of the Transaction to create a Card Purchase Supplement for. The
        #   Transaction must have a source of type `card_settlement`.
        #
        #   @return [String]
        required :transaction_id, String

        # @!attribute invoice
        #   Invoice-level information about the payment.
        #
        #   @return [Increase::Models::Simulations::CardPurchaseSupplementCreateParams::Invoice, nil]
        optional :invoice, -> { Increase::Simulations::CardPurchaseSupplementCreateParams::Invoice }

        # @!attribute line_items
        #   Line item information, such as individual products purchased.
        #
        #   @return [Array<Increase::Models::Simulations::CardPurchaseSupplementCreateParams::LineItem>, nil]
        optional :line_items,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Simulations::CardPurchaseSupplementCreateParams::LineItem] }

        # @!method initialize(transaction_id:, invoice: nil, line_items: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::CardPurchaseSupplementCreateParams} for more
        #   details.
        #
        #   @param transaction_id [String] The identifier of the Transaction to create a Card Purchase Supplement for. The
        #
        #   @param invoice [Increase::Models::Simulations::CardPurchaseSupplementCreateParams::Invoice] Invoice-level information about the payment.
        #
        #   @param line_items [Array<Increase::Models::Simulations::CardPurchaseSupplementCreateParams::LineItem>] Line item information, such as individual products purchased.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        class Invoice < Increase::Internal::Type::BaseModel
          # @!attribute discount_amount
          #   Discount given to cardholder.
          #
          #   @return [Integer, nil]
          optional :discount_amount, Integer

          # @!attribute duty_tax_amount
          #   Amount of duty taxes.
          #
          #   @return [Integer, nil]
          optional :duty_tax_amount, Integer

          # @!attribute order_date
          #   Date the order was taken.
          #
          #   @return [Date, nil]
          optional :order_date, Date

          # @!attribute shipping_amount
          #   The shipping cost.
          #
          #   @return [Integer, nil]
          optional :shipping_amount, Integer

          # @!attribute shipping_destination_country_code
          #   Country code of the shipping destination.
          #
          #   @return [String, nil]
          optional :shipping_destination_country_code, String

          # @!attribute shipping_destination_postal_code
          #   Postal code of the shipping destination.
          #
          #   @return [String, nil]
          optional :shipping_destination_postal_code, String

          # @!attribute shipping_source_postal_code
          #   Postal code of the location being shipped from.
          #
          #   @return [String, nil]
          optional :shipping_source_postal_code, String

          # @!attribute shipping_tax_amount
          #   Taxes paid for freight and shipping.
          #
          #   @return [Integer, nil]
          optional :shipping_tax_amount, Integer

          # @!attribute shipping_tax_rate
          #   Tax rate for freight and shipping.
          #
          #   @return [String, nil]
          optional :shipping_tax_rate, String

          # @!attribute unique_value_added_tax_invoice_reference
          #   Value added tax invoice reference number.
          #
          #   @return [String, nil]
          optional :unique_value_added_tax_invoice_reference, String

          # @!method initialize(discount_amount: nil, duty_tax_amount: nil, order_date: nil, shipping_amount: nil, shipping_destination_country_code: nil, shipping_destination_postal_code: nil, shipping_source_postal_code: nil, shipping_tax_amount: nil, shipping_tax_rate: nil, unique_value_added_tax_invoice_reference: nil)
          #   Invoice-level information about the payment.
          #
          #   @param discount_amount [Integer] Discount given to cardholder.
          #
          #   @param duty_tax_amount [Integer] Amount of duty taxes.
          #
          #   @param order_date [Date] Date the order was taken.
          #
          #   @param shipping_amount [Integer] The shipping cost.
          #
          #   @param shipping_destination_country_code [String] Country code of the shipping destination.
          #
          #   @param shipping_destination_postal_code [String] Postal code of the shipping destination.
          #
          #   @param shipping_source_postal_code [String] Postal code of the location being shipped from.
          #
          #   @param shipping_tax_amount [Integer] Taxes paid for freight and shipping.
          #
          #   @param shipping_tax_rate [String] Tax rate for freight and shipping.
          #
          #   @param unique_value_added_tax_invoice_reference [String] Value added tax invoice reference number.
        end

        class LineItem < Increase::Internal::Type::BaseModel
          # @!attribute discount_amount
          #   Discount amount for this specific line item.
          #
          #   @return [Integer, nil]
          optional :discount_amount, Integer

          # @!attribute item_commodity_code
          #   Code used to categorize the purchase item.
          #
          #   @return [String, nil]
          optional :item_commodity_code, String

          # @!attribute item_descriptor
          #   Description of the purchase item.
          #
          #   @return [String, nil]
          optional :item_descriptor, String

          # @!attribute item_quantity
          #   The number of units of the product being purchased.
          #
          #   @return [String, nil]
          optional :item_quantity, String

          # @!attribute product_code
          #   Code used to categorize the product being purchased.
          #
          #   @return [String, nil]
          optional :product_code, String

          # @!attribute sales_tax_amount
          #   Sales tax amount for this line item.
          #
          #   @return [Integer, nil]
          optional :sales_tax_amount, Integer

          # @!attribute sales_tax_rate
          #   Sales tax rate for this line item.
          #
          #   @return [String, nil]
          optional :sales_tax_rate, String

          # @!attribute total_amount
          #   Total amount of all line items.
          #
          #   @return [Integer, nil]
          optional :total_amount, Integer

          # @!attribute unit_cost
          #   Cost of line item per unit of measure, in major units.
          #
          #   @return [String, nil]
          optional :unit_cost, String

          # @!attribute unit_of_measure_code
          #   Code indicating unit of measure (gallons, etc.).
          #
          #   @return [String, nil]
          optional :unit_of_measure_code, String

          # @!method initialize(discount_amount: nil, item_commodity_code: nil, item_descriptor: nil, item_quantity: nil, product_code: nil, sales_tax_amount: nil, sales_tax_rate: nil, total_amount: nil, unit_cost: nil, unit_of_measure_code: nil)
          #   @param discount_amount [Integer] Discount amount for this specific line item.
          #
          #   @param item_commodity_code [String] Code used to categorize the purchase item.
          #
          #   @param item_descriptor [String] Description of the purchase item.
          #
          #   @param item_quantity [String] The number of units of the product being purchased.
          #
          #   @param product_code [String] Code used to categorize the product being purchased.
          #
          #   @param sales_tax_amount [Integer] Sales tax amount for this line item.
          #
          #   @param sales_tax_rate [String] Sales tax rate for this line item.
          #
          #   @param total_amount [Integer] Total amount of all line items.
          #
          #   @param unit_cost [String] Cost of line item per unit of measure, in major units.
          #
          #   @param unit_of_measure_code [String] Code indicating unit of measure (gallons, etc.).
        end
      end
    end
  end
end
