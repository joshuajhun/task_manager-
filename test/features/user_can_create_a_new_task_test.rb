require_relative "../test_helper"

class NewTasktest < FeatureTest
  def test_user_can_create_a_new_task
    visit "/tasks/new"


    fill_in "task-title", with: "New Task Title"
    fill_in "task-description", with: "New description"
    click_button "submit"

    assert_equal "/tasks", current_path
    assert page.has_content? "New Task Title"
  end
end
