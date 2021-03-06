require('sinatra')
require('sinatra/reloader')
require('./lib/task')
also_reload('lib/**/*.rb')

get('/') do
  @tasks = Task.all()
  erb(:index)
end

post('/tasks') do
  description = params.fetch("description")
  @boobookitty = description  # this puts it on the results page
  task = Task.new(description)
  task.save()
  erb(:tasks)
end
