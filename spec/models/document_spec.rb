require 'rails_helper'

RSpec.describe Document, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # it "should have name"
  # it "should have type"

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:type) }

end
