require('rspec')
require('contacts')

describe(Contacts) do
  describe("#first_name") do
    it("will return the first name") do
      test_contact = Contacts.new({:first_name => "Getro", :last_name =>"Naissance", :job_title =>"Engineer", :company => "Google"})
      expect(test_contact.first_name()).to(eq("Getro"))
    end
  end
  describe("#last_name") do
    it("will return the last name") do
      test_contact = Contacts.new({:first_name => "Getro", :last_name =>"Naissance", :job_title =>"Engineer", :company => "Google"})
      expect(test_contact.last_name()).to(eq("Naissance"))
    end
  end
  describe("#job_title") do
    it("will return the job title") do
      test_contact = Contacts.new({:first_name => "Getro", :last_name => "Naissance", :job_title =>"Engineer", :company => "Google"})
      expect(test_contact.job_title()).to(eq("Engineer"))
    end
  end
  describe("#company") do
    it("will return the company name") do
      test_contact = Contacts.new({:first_name => "Getro", :last_name => "Naissance", :job_title => "Engineer", :company => "Google"})
      expect(test_contact.company()).to(eq("Google"))
    end
  end
end
