class Phone
  @@phone_list = []
  attr_reader(:number)

  define_method(:initialize) do |attributes|
    @number = attributes.fetch(:number)
  end

  define_singleton_method(:all) do
    @@phone_list
  end

  define_method(:save) do
    @@phone_list.push(self)
  end

  define_singleton_method(:clear) do
    @@phone_list = []
  end
end
