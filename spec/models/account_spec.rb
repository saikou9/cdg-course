require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { FactoryBot.create(:account) }

  it 'should be valid' do
    expect(account).to be_valid
  end

  it 'must have an idectical password' do
    expect(account.password).to eq "password"
  end

  it 'user can follow another user' do
    account = FactoryBot.create(:account)
    account2 = FactoryBot.create(:account)
    follower = Follower.create(follower_id: account.id, following_id: account2.id)

    expect(account.total_followers).to eq 1
  end

  it 'total_following must be truthy' do
    account = FactoryBot.create(:account)
    account2 = FactoryBot.create(:account)
    follower = Follower.create(follower_id: account.id, following_id: account2.id)

    expect(account2.total_following).to eq 1
  end
end