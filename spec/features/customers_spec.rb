require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  before do
    @member = create(:member)
  end

  context "navigating" do
    it "#index" do
      visit(customers_path)
      expect(page).to  have_current_path(customers_path)
    end
  end

  context "Links, Forms and Querying" do
    it "creates a Customer" do
      login_as(@member, :scope => :member)
      visit(new_customer_path)
      fill_in('Name',with:Faker::Name.name)
      fill_in('Email',with: Faker::Internet.email)
      fill_in('Address',with: Faker::Address.street_address)
      click_on('Create Customer')

      expect(page).to  have_content("Customer was successfully created")
    end
  end

  # it "Ajax" do
  #   visit(customers_path)
  #
  #   click_link("Add Message")
  #
  #   expect(page).to have_content("yes!")
  # end

  # context "Find" do
  #   it "verification text link" do
  #     visit(customers_path)
  #     expect(page.find('#my-div').find('h1')).to have_content('Yes!')
  #   end
  # end

end
