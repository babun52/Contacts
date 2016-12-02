class Email
  @@email_list = []
  attr_reader(:mail)

   define_method(:initialize) do |attributes|
     @mail = attributes.fetch(:mail)
   end

   define_singleton_method(:all) do
     @@email_list
   end

   define_method(:save) do
     @@email_list.push(self)
   end

   define_singleton_method(:clear) do
     @@email_list = []
   end
end
