require_relative "../test_helper"

class DeleteTaskTest < FeatureTest
  def test_user_can_delete_a_task
    TaskManager.create({title: "pokemon", description: "ash"})
    visit "/tasks"
    click_button("delete")
    assert_equal "/tasks", current_path
  end
end
