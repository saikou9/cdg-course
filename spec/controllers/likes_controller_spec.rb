require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:account) { create :account }
  let(:post) { create :post }
  let(:like) { create :like }
  before { sign_in account }

  describe '#create' do
    it 'created a post' do
      like = build(:like)
      expect { subject }.to change(Like, :count).by(1)
    end

    it 'redirects to post page' do
      like = FactoryBot.build :like
      expect(response).to redirect_to(assigns(:like))
    end
  end
end