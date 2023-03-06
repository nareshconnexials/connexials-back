require 'rails_helper'

RSpec.describe Employment, :type => :model do
  it { should validate_presence_of(:designation) }
  it { should validate_presence_of(:department) }
  it { should validate_presence_of(:date_of_joining) }
  it { should validate_presence_of(:project_location) }
end

