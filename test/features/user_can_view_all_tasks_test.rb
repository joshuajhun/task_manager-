require_relative "../test_helper"

class ViewTaskTest < FeatureTest
  def test_user_can_view_all_task
    visit "/"

    click_link("Task Index")
    assert_equal "/tasks", current_path
  end
end
