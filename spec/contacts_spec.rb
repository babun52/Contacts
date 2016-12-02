require('rspec')
require('contacts')
require('address')
require('phone_number')
require('email')

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

describe(Mailing) do
  describe("#street") do
    it('will return the street address') do
      test_mail = Mailing.new({:street => "2425 27th SW Ave", :city => "Portland", :state => "Oregon", :zip => "97201"})
      expect(test_mail.street()).to(eq("2425 27th SW Ave"))
    end
  end

  describe("#city") do
    it('will return the city') do
      test_mail = Mailing.new({:street => "2425 27th SW Ave", :city => "Portland", :state => "Oregon", :zip => "97201"})
      expect(test_mail.city()).to(eq("Portland"))
    end
  end

  describe("#state") do
    it('will return the state') do
      test_mail = Mailing.new({:street => "2425 27th SW Ave", :city => "Portland", :state => "Oregon", :zip => "97201"})
      expect(test_mail.state()).to(eq("Oregon"))
    end
  end

  describe("#zip") do
    it('will return the Zip Code') do
      test_mail = Mailing.new({:street => "2425 27th SW Ave", :city => "Portland", :state => "Oregon", :zip => 97201})
      expect(test_mail.zip()).to(eq(97201))
    end
  end

  describe(".all") do
    it('will return an empty array at first') do
      expect(Mailing.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('will push new address inside of array') do
      test_mail = Mailing.new({:street => "2425 27th SW Ave", :city => "Portland", :state => "Oregon", :zip => 97201})
      test_mail.save()
      expect(Mailing.all()).to(eq([test_mail]))
    end
  end

  describe(".clear") do
    it('will clear the array') do
      test_mail = Mailing.new({:street => "2425 27th SW Ave", :city => "Portland", :state => "Oregon", :zip => 97201}).save()
      Mailing.clear()
      expect(Mailing.all()).to(eq([]))
    end
  end
end

describe(Phone) do
  describe('#number') do
    it('will return the phone number') do
      test_phone = Phone.new({:number => "000-000-0000"})
      expect(test_phone.number()).to(eq("000-000-0000"))
    end
  end

  describe('.all') do
    it("will return the empty array") do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("will save the phone number into the array") do
      test_phone = Phone.new({:number => "000-000-0000"})
      test_phone.save()
      expect(Phone.all()).to(eq([test_phone]))
    end
  end

  describe('.clear') do
    it("will clear the saved numbers from the array") do
      test_phone = Phone.new({:number => "000-000-0000"})
      test_phone.save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end
end

describe(Email) do
  describe('#mail') do
    it('will return the email address') do
      test_email = Email.new({:mail => "janedoe@gmail.com"})
      expect(test_email.mail()).to(eq("janedoe@gmail.com"))
    end
  end
  describe('.all') do
    it('will return an empty array') do
      expect(Email.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('will save the email address in the array') do
      test_email = Email.new({:mail => "janedoe@gmail.com"})
      test_email.save()
      expect(Email.all()).to(eq([test_email]))
    end
  end
  describe('.clear') do
    it('clears the saved email address from the list') do
      test_email = Email.new({:mail => "janedoe@gmail.com"})
      test_email.save()
      Email.clear()
      expect(Email.all()).to(eq([]))
    end
  end
end
