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
    it "Content-type" do
      sign_in @member
      get :show, format: :json, params: { id: @customer.id }
      expect(response.content_type).to eq('application/json')
    end

    it "Routes" do
      is_expected.to route(:get, '/customers').to(action: :index)
    end

    it "messege to controller" do
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, params: {customer: customer_params }
      # p response
      expect(flash[:notice]).to include("Customer was successfully created.")
      expect(flash[:notice]).to match(/was successfully/)
    end

    it "with valid attributes" do
      customer_params = attributes_for(:customer)
      sign_in @member

      expect {
        post :create, params: {customer: customer_params }
      }.to change(Customer, :count).by(1)
    end

    it "with invalid attributes" do
      customer_params = attributes_for(:customer, address: nil)
      sign_in @member

      expect {
        post :create, params: {customer: customer_params }
      }.not_to change(Customer, :count)
    end

    it "responds sucessfully (Member success authorized)" do
      sign_in @member

      get :show, params: { id: @member.id }
      expect(response).to be_successful
    end

    before do
      @member = create(:member)
      @customer = create(:customer)
    end

    it "responds sucessfully (success authorized)" do

      sign_in @member

      get :show, params: { id: @customer.id }
      expect(response).to have_http_status(200)
    end

    it "render a :show template" do
      sign_in @member

      get :show, params: { id: @customer.id }
      expect(response).to render_template(:show)
    end
  end
end
