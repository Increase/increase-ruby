# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::PhysicalCardProfilesTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.physical_card_profiles.create(
        carrier_image_file_id: "file_h6v7mtipe119os47ehlu",
        contact_phone: "+16505046304",
        description: "My Card Profile",
        front_image_file_id: "file_o6aex13wm1jcc36sgcj1"
      )

    assert_pattern do
      response => Increase::Models::PhysicalCardProfile
    end

    assert_pattern do
      response => {
        id: String,
        back_image_file_id: String | nil,
        carrier_image_file_id: String | nil,
        contact_phone: String | nil,
        created_at: Time,
        creator: Increase::Models::PhysicalCardProfile::Creator,
        description: String,
        front_image_file_id: String | nil,
        idempotency_key: String | nil,
        is_default: Increase::Internal::Type::Boolean,
        status: Increase::Models::PhysicalCardProfile::Status,
        type: Increase::Models::PhysicalCardProfile::Type
      }
    end
  end

  def test_retrieve
    response = @increase.physical_card_profiles.retrieve("physical_card_profile_id")

    assert_pattern do
      response => Increase::Models::PhysicalCardProfile
    end

    assert_pattern do
      response => {
        id: String,
        back_image_file_id: String | nil,
        carrier_image_file_id: String | nil,
        contact_phone: String | nil,
        created_at: Time,
        creator: Increase::Models::PhysicalCardProfile::Creator,
        description: String,
        front_image_file_id: String | nil,
        idempotency_key: String | nil,
        is_default: Increase::Internal::Type::Boolean,
        status: Increase::Models::PhysicalCardProfile::Status,
        type: Increase::Models::PhysicalCardProfile::Type
      }
    end
  end

  def test_list
    response = @increase.physical_card_profiles.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Models::PhysicalCardProfile
    end

    assert_pattern do
      row => {
        id: String,
        back_image_file_id: String | nil,
        carrier_image_file_id: String | nil,
        contact_phone: String | nil,
        created_at: Time,
        creator: Increase::Models::PhysicalCardProfile::Creator,
        description: String,
        front_image_file_id: String | nil,
        idempotency_key: String | nil,
        is_default: Increase::Internal::Type::Boolean,
        status: Increase::Models::PhysicalCardProfile::Status,
        type: Increase::Models::PhysicalCardProfile::Type
      }
    end
  end

  def test_archive
    response = @increase.physical_card_profiles.archive("physical_card_profile_id")

    assert_pattern do
      response => Increase::Models::PhysicalCardProfile
    end

    assert_pattern do
      response => {
        id: String,
        back_image_file_id: String | nil,
        carrier_image_file_id: String | nil,
        contact_phone: String | nil,
        created_at: Time,
        creator: Increase::Models::PhysicalCardProfile::Creator,
        description: String,
        front_image_file_id: String | nil,
        idempotency_key: String | nil,
        is_default: Increase::Internal::Type::Boolean,
        status: Increase::Models::PhysicalCardProfile::Status,
        type: Increase::Models::PhysicalCardProfile::Type
      }
    end
  end

  def test_clone_
    response = @increase.physical_card_profiles.clone_("physical_card_profile_id")

    assert_pattern do
      response => Increase::Models::PhysicalCardProfile
    end

    assert_pattern do
      response => {
        id: String,
        back_image_file_id: String | nil,
        carrier_image_file_id: String | nil,
        contact_phone: String | nil,
        created_at: Time,
        creator: Increase::Models::PhysicalCardProfile::Creator,
        description: String,
        front_image_file_id: String | nil,
        idempotency_key: String | nil,
        is_default: Increase::Internal::Type::Boolean,
        status: Increase::Models::PhysicalCardProfile::Status,
        type: Increase::Models::PhysicalCardProfile::Type
      }
    end
  end
end
