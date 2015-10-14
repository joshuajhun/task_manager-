require_relative '../test_helper'
class TaskManagerTest < Minitest::Test

  def test_task_is_created
    TaskManager.create({:title       => "My title",
                        :description => "get stuff done"})

    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "My title", task.title
    assert_equal "get stuff done", task.description
  end

  def test_it_can_find_the_task_id
    TaskManager.create({:title       => "My title",
                        :description => "get stuff done"})

    task = TaskManager.find(1)
    assert_equal 1, task.id
  end

  def test_it_can_find_an_id_within_multiple_ids
    TaskManager.create({:title       => "My title",
                        :description => "get stuff done"})

    TaskManager.create({:title       => "Pokemon",
                        :description => "charizard"})

    TaskManager.create({:title       => "Pokemon",
                        :description => "snorlax"})

    task = TaskManager.find(2)

    assert_equal 2, task.id
    assert_equal "Pokemon", task.title
    assert_equal "charizard", task.description
  end

  def test_you_can_delete_a_task
    TaskManager.create({:title       => "My title",
                        :description => "get stuff done"})

    TaskManager.create({:title       => "Pokemon",
                        :description => "charizard"})

    TaskManager.create({:title       => "ash",
                        :description => "snorlax"})

    TaskManager.delete(2)

    assert_equal  ['My title',"ash"], TaskManager.all.map{|task| task.title}
  end

  def test_you_can_update_a_task
    TaskManager.create({:title         => "Pokemon",
                         :description  => "charizard"})

    TaskManager.update(1,{:title       =>"ash",
                          :description => "oak"})

    task = TaskManager.find(1)

    assert_equal "ash", task.title
    assert_equal "oak", task.description
  end

  def test_it_can_show_call_of_our_task
    TaskManager.create({:title        => "My title",
                         :description => "get stuff done"})

    TaskManager.create({:title        => "Pokemon",
                         :description => "charizard"})

    TaskManager.create({:title        => "ash",
                         :description => "snorlax"})

    assert_equal ["My title", "Pokemon", "ash"], TaskManager.all.map{|task| task.title}
  end
end
