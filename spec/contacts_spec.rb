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
  describe(".all") do
    it("is empty at first") do
    expect(Contacts.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("save the contact information to the array") do
      test_contact = Contacts.new({:first_name => "Getro", :last_name => "Naissance", :job_title => "Engineer", :company => "Google"})
      test_contact.save()
      expect(Contacts.all()).to(eq([test_contact]))
    end
  end
  describe(".clear") do
    it("empties out all of the saved contact information in the array") do
      test_contact = Contacts.new({:first_name => "Getro", :last_name => "Naissance", :job_title => "Engineer", :company => "Google"})
      test_contact.save()
      Contacts.clear()
      expect(Contacts.all()).to(eq([]))
    end
  end
  describe("#id") do
    it("will return the identification from the contact lists") do
      test_contact = Contacts.new({:first_name => "Getro", :last_name => "Naissance", :job_title => "Engineer", :company => "Google"})
      expect(test_contact.id()).to(eq(1))
    end
  end
  describe(".find") do
    it("will return an id of each contact") do
      test_contact = Contacts.new({:first_name => "Getro", :last_name => "Naissance", :job_title => "Engineer", :company => "Google"})
      test_contact.save()
      test_contact2 = Contacts.new({:first_name => "James", :last_name => "Lee", :job_title => "Engineer", :company => "Google"})
      test_contact2.save()
      expect(Contacts.find(test_contact.id())).to(eq(test_contact))
    end
  end
end
