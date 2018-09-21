require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has a valid factory' do
    expect(build :post).to be_valid
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end
end
