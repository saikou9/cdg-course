require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:account) { create :account }
  let(:post) { create :post }
  before { sign_in account }

  describe '#create' do
    # let(:params) { { like: attributes_for(:like, account: create(:account)) } }
    subject { process :create, method: :post, params: params }

    # it 'created a post' do
    #   expect { subject }.to change(Like, :count).by(1)
    # end

    # it 'redirects to post page' do
    #   subject
    #   expect(response).to redirect_to post_path(Post.last)
    # end

    # it 'assigns post to correct account' do
    #   subject
    #   expect(assigns(:post).account).to eq account
    end
end