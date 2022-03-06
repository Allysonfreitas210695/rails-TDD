require 'rails_helper'

RSpec.feature "Customers", type: :feature do

  context "navigating" do
    it "#index" do
      visit(customers_path)
      expect(page).to  have_current_path(customers_path)
    end
  end

end
