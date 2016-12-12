require 'rails_helper'

RSpec.describe ImportsController, type: :controller do
  describe 'POST create' do
    context 'valid data' do
      let(:valid_data) { FactoryGirl.attributes_for(:import) }

      it 'redirects to contacts#index' do
        post :create, params: { import: valid_data }
        expect(response).to redirect_to(contacts_path)
      end  
    end
  end
end
