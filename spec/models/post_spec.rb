require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post, account: nil) }

  it " Is not valid " do
    is_expected.to be_invalid
  end
end