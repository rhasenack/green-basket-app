require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { Tag.new(name: 'test tag') }
  it 'is valid with a name' do
    expect(tag).to be_valid
  end

  it 'is invalid without a name' do
    tag.name = nil
    expect(tag).not_to be_valid
  end
end
