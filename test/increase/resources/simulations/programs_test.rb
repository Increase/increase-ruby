# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::ProgramsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.simulations.programs.create(name: "For Benefit Of")

    assert_pattern do
      response => Increase::Program
    end

    assert_pattern do
      response => {
        id: String,
        bank: Increase::Program::Bank,
        billing_account_id: String | nil,
        created_at: Time,
        default_digital_card_profile_id: String | nil,
        interest_rate: String,
        lending: Increase::Program::Lending | nil,
        name: String,
        type: Increase::Program::Type,
        updated_at: Time
      }
    end
  end
end
