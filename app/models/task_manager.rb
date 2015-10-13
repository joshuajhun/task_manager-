require 'yaml/store'
require_relative 'task'

class TaskManager
  def self.create(task) #task is an actual hash (key of title and description)
    database.transaction do #transaction is a pathway? 
      database['tasks'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['tasks'] << { "id" => database['total'], "title" => task[:title], "description" => task[:description] }
    end
  end

  def self.database
    @database ||= YAML::Store.new("db/task_manager")
  end

  def self.raw_tasks
    database.transaction do
      database['tasks'] || []
    end
  end

  def self.all
    raw_tasks.map { |data| Task.new(data) }
  end

  def self.raw_task(id)
    raw_tasks.find { |task| task["id"] == id }
  end

  def self.find(id)
    Task.new(raw_task(id))
  end
end
