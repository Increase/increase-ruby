# frozen_string_literal: true

require_relative "../test_helper"

# Locks the documented page-object surface: items are read via #data or
# #auto_paging_each, and pages are deliberately not Enumerable (see the
# README's Pagination section).
class Increase::Test::PageTest < Minitest::Test
  class Item < Increase::Internal::Type::BaseModel
    optional :id, String
  end

  def make_page(data:, next_cursor: nil)
    Increase::Internal::Page.new(
      client: nil,
      req: {model: Item},
      headers: {},
      page_data: {data: data, next_cursor: next_cursor}
    )
  end

  def test_data_returns_coerced_items
    page = make_page(data: [{id: "1"}, {id: "2"}])

    assert_pattern do
      page.data => [Item, Item]
    end
    assert_equal(%w[1 2], page.data.map(&:id))
  end

  def test_auto_paging_each_yields_items_on_the_last_page
    page = make_page(data: [{id: "1"}, {id: "2"}])

    ids = []
    page.auto_paging_each { ids << _1.id }

    assert_equal(%w[1 2], ids)
  end

  def test_auto_paging_each_requires_a_block
    page = make_page(data: [{id: "1"}])

    assert_raises(ArgumentError) { page.auto_paging_each }
  end

  def test_to_enum_wraps_auto_paging_each
    page = make_page(data: [{id: "1"}])

    assert_equal("1", page.to_enum.first.id)
  end

  def test_pages_are_not_enumerable
    page = make_page(data: [{id: "1"}])

    refute_kind_of(Enumerable, page)
    assert_raises(NoMethodError) { page.each }
    assert_raises(NoMethodError) { page.to_a }
  end

  def test_next_page_guard
    page = make_page(data: [{id: "1"}], next_cursor: nil)

    refute_predicate(page, :next_page?)
    assert_raises(RuntimeError) { page.next_page }

    page_with_cursor = make_page(data: [{id: "1"}], next_cursor: "cursor")

    assert_predicate(page_with_cursor, :next_page?)
  end
end
