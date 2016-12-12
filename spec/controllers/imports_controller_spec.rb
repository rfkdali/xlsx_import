require 'rails_helper'

RSpec.describe ImportsController, type: :controller do

  describe 'GET index' do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders :new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns new Import to @import' do
      get :new
      expect(assigns(:import)).to be_a_new(Import)
    end
  end

  describe "POST #create" do
    let(:valid_data) { FactoryGirl.attributes_for(:import) }

    it "redirect to imports#index" do
      post :create, params: { import: valid_data }
      expect(response).to redirect_to(imports_path)
    end
  end

  describe "GET #show" do
    let(:valid_data) { FactoryGirl.create(:import) }

    it "returns http success" do
      get :show, params: { id: valid_data }
      expect(response).to have_http_status(:success)
    end

    it "render :show template" do
      get :show, params: { id: valid_data }
      expect(response).to render_template(:show)
    end
  end
end
