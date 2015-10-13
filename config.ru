require 'bundler'
Bundler.require

$LOAD_PATH.unshift(File.expand_path("app", __dir__))
#
require 'controllers/task_manager_app'

run TaskManagerApp # this is a method that takes an argument and in this case is a class.
