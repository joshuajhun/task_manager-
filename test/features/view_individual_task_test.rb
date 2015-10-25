require_relative "../test_helper"

class IndiTasktest < FeatureTest
  def test_user_can_view_indiviual_task
    TaskManager.create({title: "pokemon", description: "ash"})
    visit "/tasks"


    click_link("pokemon")

    assert_equal "/tasks/1", current_path
  end
end
