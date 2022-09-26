require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post, account: nil) }

  it 'should be invalid' do
    is_expected.to be_invalid
  end

  it 'should be valid' do
    post = build(:post)
    expect(post).to be_valid
  end
end