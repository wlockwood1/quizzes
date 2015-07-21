require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @category = FactoryGirl.create(:category)
  end

  it 'is invalid without a name' do
    @category.name = nil
    expect {@category.save!}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
  end

end
