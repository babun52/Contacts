require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contacts')
require('./lib/address')
require('./lib/phone_number')
require('./lib/email')

get('/') do
  erb(:index)
end

get('/mailing/new') do
  erb(:mailing_form)
end

get('/phone/new') do
  erb(:phone_form)
end

get('/email/new') do
  erb(:email_form)
end

get('/contacts/new') do
  erb(:contacts_form)
end

get('/contacts') do
  @contact_list = Contacts.all()
  erb(:updated_contacts)
end

post('/contacts') do
  first = params.fetch('first_name')
  last = params.fetch('last_name')
  job = params.fetch('job_title')
  company = params.fetch('company')
  Contacts.new(:first_name => first, :last_name => last, :job_title => job, :company => company).save()
  erb(:success)
end

get('/contacts/:id') do
  @single_contact = Contacts.find(params.fetch('id').to_i())
  erb(:contact)
end
