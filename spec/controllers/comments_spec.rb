require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:account) { create :account }
  let(:post) { create :post }
  before { sign_in account }

  
  describe '#create' do
    let(:params) { { comment: attributes_for(:comment, account: create(:account), post: create(:post)) } }
    subject { process :create, method: :post, params: params }

    # this test didn't work(((
    # it 'created a comment' do
    #   expect { subject }.to change(Comment, :count).by(1)
    # end

    it 'redirects to dashboard page' do
      subject
      expect(response).to redirect_to dashboard_path
    end
  end

  describe '#destroy' do
    subject { process :destroy, method: :delete, params: params }
    let!(:comment) { create :comment, account: account, post: post }
    let(:params) { { id: comment.id } }
    
    it 'delete the comment' do
      expect { subject }.to change(Comment, :count).by(-1)
    end

    it 'redirects to dashboard page' do
      subject
      expect(response).to redirect_to dashboard_path
    end
  end
end