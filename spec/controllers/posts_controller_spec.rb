require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:account) { create :account }
  before { sign_in account }

  describe '#index' do
    subject { process :index }

    let(:posts) { create_list(:post, 5) }

    it 'renders the index template' do
      subject
      expect(response).to render_template :index
    end

    # it 'assigns @posts' do
    #   subject
    #   expect(assigns(:post)).to eq posts.last
    # end

    context 'when user is not sign in' do
      before { sign_out account }
      it 'redirects to the sign in page' do
        subject
        expect(response).to redirect_to new_account_session_path
      end
    end 

  end

  describe '#new' do
    subject { process :new}
    it 'assigns @post' do
      subject
      expect(assigns(:post)).to be_a_new(Post)
    end

    it 'render the new template' do
      subject
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    let(:params) { { post: attributes_for(:post, account: create(:account)) } }
    subject { process :create, method: :post, params: params }

    it 'created a post' do
      expect { subject }.to change(Post, :count).by(1)
    end

    it 'redirects to post page' do
      subject
      expect(response).to redirect_to post_path(Post.last)
    end

    it 'assigns post to correct account' do
      subject
      expect(assigns(:post).account).to eq account
    end

  end

  describe '#show' do
    subject { process :show }
    it 'returns to post' do
      expect(response.status).to eq 200
    end
  end

  describe '#edit' do
    subject { process :edit, method: :post, params: params }
    let!(:post) { create :post, account: account }
    let(:params) { { id: post.id } }

    it 'edit the post' do
      subject
      expect(assigns(:post).account).to eq account
    end
  end

  # describe '#update' do
  #   subject { process :update, method: :patch, params: params }
  #   let!(:post) { create :post, account: account }
  #   let(:params) { { id: post.id } }

  #   it 'update the post' do
  #     subject
  #     expect(assigns(:post).account).to eq account
  #   end

  #   it 'redirects to dashboard page' do
  #     subject
  #     expect(response).to redirect_to post
  #   end
  # end

  describe '#destroy' do
    subject { process :destroy, method: :delete, params: params }
    let!(:post) { create :post, account: account }
    let(:params) { { id: post.id } }
    
    it 'delete the post' do
      expect { subject }.to change(Post, :count).by(-1)
    end

    it 'redirects to dashboard page' do
      subject
      expect(response).to redirect_to profile_path(post.account.username)
    end

    context 'when user tries to delete someones post' do
      let(:post) { create :post }

      it 'does not delete the post' do
        expect { subject }.to raise_exception(ActiveRecord::RecordNotFound).and(
                                       change(account.posts, :count).by(0))
      end
    end
  end
end