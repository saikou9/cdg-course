require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:account) { create :account }
  let(:post) { create :post }
  before { sign_in account }

  describe '#create' do
    it 'created a like' do
      test_like = Like.create(account_id: 1, post_id: 1)
      #like = FactoryBot.build :like
      expect{ subject }.to change(Like, :count).by(1)
    end

    it 'redirects to post page' do
      expect(response.status).to eq 200
    end
  end
end