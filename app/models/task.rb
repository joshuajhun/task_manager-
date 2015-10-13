class Task
  attr_reader :title,
              :description,
              :id

  def initialize(data)
    @id          = data["id"]
    @title       = data["title"]
    @description = data["description"]
  end
end

#mvc structure (model view controller)
# you do not have to seperate your files into sepeperate folders
#controllers => accepting http stuff dealing with http stuff,sending a response
#models 
