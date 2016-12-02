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

get('/contacts/new') do
  erb(:contacts_form)
end

post('/contacts') do
  first = params.fetch('first_name')
  last = params.fetch('last_name')
  job = params.fetch('job_title')
  company = params.fetch('company')
  Contacts.new(:first_name => first, :last_name => last, :job_title => job, :company => company).save()
  erb(:success)
end

get('/contacts') do
  @contact_list = Contacts.all()
  erb(:updated_contacts)
end

get('/contacts/:id') do
  @single_contact = Contacts.find(params.fetch('id').to_i())
  erb(:contact)
end

get('/mailing/:id/new') do
  @single_contact = Contacts.find(params.fetch('id').to_i())
  erb(:mailing_form)
end

post('/mailing') do
  # @single_contact = Contacts.find(params.fetch('id').to_i())
  street = params.fetch('street')
  city = params.fetch('city')
  state = params.fetch('state')
  zip = params.fetch('zip')
  new_mailing = Mailing.new(:street => street, :city => city, :state => state, :zip => zip)
  new_mailing.save()
  @single_contact.add_address(new_mailing)
  erb(:success)
end

get('/phone/:id/new') do
  @single_contact = Contacts.find(params.fetch('id').to_i())
  erb(:phone_form)
end

post('/numbers') do
  # @single_contact = Contacts.find(params.fetch('id').to_i())
  digits = params.fetch('phone')
  new_number = Phone.new(:number => digits)
  new_number.save()
  @single_contact.add_number(new_number)
  erb(:success)
end

get('/email/:id/new') do
  @single_contact = Contacts.find(params.fetch('id').to_i())
  erb(:email_form)
end

post('/email') do
  # @single_contact = Contacts.find(params.fetch('id').to_i())
  gmail = params.fetch('email')
  new_email = Email.new(:mail => gmail)
  new_email.save()
  @single_contact.add_email(new_email)
  erb(:success)
end

get('/clear') do
  Contacts.clear()
  erb(:index)
end
