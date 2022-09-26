require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:account) { build(:account) }

  it 'should be valid' do
    expect(account.password).to eq "password"
  end

  it 'must have an idectical password' do
    account = build(:account)
    expect(account.password).to eq "password"
  end
end