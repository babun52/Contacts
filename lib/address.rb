class Mailing
  @@full_address = []

  attr_reader(:street, :city, :state, :zip)

  define_method(:initialize) do |attributes|
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    # @id = @@full_address.length() + 1
  end

  define_singleton_method(:all) do
    @@full_address
  end

  define_method(:save) do
    @@full_address.push(self)
  end

  define_singleton_method(:clear) do
    @@full_address = []
  end

  # define_method(:id) do
  #   @id
  # end
  #
  # define_singleton_method(:find) do |identification|
  #   find_contact_id = nil
  #   @@full_address.each() do |contact|
  #     if identification == contact.id()
  #       find_contact_id = contact
  #     end
  #   end
  #   find_contact_id
  # end

end
