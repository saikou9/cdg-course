require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:account) { create :account }
  let(:posts) { create :post}

  before { sign_in account }

  describe '#index' do
    subject { process :index }

    it 'render a template' do
      get :index
      expect(response).to render_template :index
    end

    # it 'assigns account posts' do
    #   subject
    #   expect(assigns).to
    # end
  end

  describe '#profile' do
    it 'redirect to profile path' do
      expect(response.status).to eq 200
    end
  end

  # describe '#follow_account' do
  #   it 'user can follow account' do
  #     account2 = build(:account)
  #   end
  # end

  # describe '#edit' do
  #   it 'render :edit' do
  #     new_account = FactoryBot.create :account
  #     get :edit, params: {
  #       id: new_account.id
  #     }
  #     expect(response).to render_template :edit
  #   end
  # end
end