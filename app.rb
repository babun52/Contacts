require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contacts')

get('/') do
  erb(:index)
end

get('/list/contact') do
  @neo_contacts = Contacts.all()
  erb(:updated_contacts)
end

get('/contacts/form') do
  erb(:contacts_form)
end


post('/contacts/new') do
  first = params.fetch('first_name')
  last = params.fetch('last_name')
  job = params.fetch('job_title')
  company = params.fetch('company')
  neo_contacts = Contacts.new(first, last, job, company).save()
  erb(:updated_contacts)
end

get('/contacts/:id') do
  @neo_contacts = Contacts.find(params.fetch('id'))
  erb(:contact)
end
