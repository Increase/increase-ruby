# frozen_string_literal: true

module Increase
  module Internal
    # @generic Elem
    #
    # @example
    #   if page.has_next?
    #     page = page.next_page
    #   end
    #
    # @example
    #   page.auto_paging_each do |item|
    #     puts(item)
    #   end
    class Page
      include Increase::Internal::Type::BasePage

      # @return [Object]
      attr_accessor :data

      # @return [Object]
      attr_accessor :next_cursor

      # @return [Boolean]
      def next_page?
        !empty? && !next_cursor.nil?
      end

      # @raise [Increase::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = Increase::Internal::Util.deep_merge(@req, {query: {":cursor": next_cursor}})
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [Increase::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        @data = page_data[:":data"]
        @next_cursor = page_data[:":next_cursor"]
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = Increase::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)}>"
      end
    end
  end
end
