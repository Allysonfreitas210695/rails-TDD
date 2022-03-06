require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe "as a guest" do
    it "returns a 302 response (not authorized)" do
      customer = create(:customer)
      get :show, params: { id: customer.id }
      expect(response).to have_http_status(302)
    end

    it "responds successfully" do
      get :index
      expect(response).to be_successful
    end

    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "as Logged Menber" do
    it "responds sucessfully (success authorized)" do
      member = create(:member)
      customer = create(:customer)

      sign_in member

      get :show, params: { id: customer.id }
      expect(response).to have_http_status(200)
    end

    it "responds sucessfully (Member success authorized)" do
      member = create(:member)
      sign_in member

      get :show, params: { id: member.id }
      expect(response).to be_successful
    end

    it "render a :show template" do
      member = create(:member)
      customer = create(:customer)

      sign_in member

      get :show, params: { id: customer.id }
      expect(response).to render_template(:show)
    end
  end
end
