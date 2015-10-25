require_relative "../test_helper"
require_relative "../../app/models/task_manager"
class EditTaskTest < FeatureTest
  def test_user_can_edit_a_task
    TaskManager.create({title: "New Task", description: "New Task Des"})

    visit "/tasks"

    click_link "Edit"

    assert_equal "/tasks/1/edit", current_path

    fill_in "task[title]", with: "Edited Task"
    fill_in "task[description]", with: "edidted Task Des"
    click_button "update task"

    assert page.has_content? "Edited Task"
  end
end
