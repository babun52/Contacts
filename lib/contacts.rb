class Contacts
  @@contact_list = []
  attr_reader(:first_name, :last_name, :job_title, :company)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @id = @@contact_list.length() + 1
    @add_number = []
    @add_address = []
    @add_email = []
  end

  def add_address(address)
    @addresses.push(address)
  end

  def add_number(number)
    @phone_numbers.push(number)
  end

  def add_email(email)
    @email_addresses.push(email)
  end

  define_singleton_method(:all) do
    @@contact_list
  end

  define_method(:save) do
    @@contact_list.push(self)
  end

  define_singleton_method(:clear) do
    @@contact_list = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |identification|
    find_contact_id = nil
    @@contact_list.each() do |contact|
      if identification == contact.id()
        find_contact_id = contact
      end
    end
    find_contact_id
  end
end
