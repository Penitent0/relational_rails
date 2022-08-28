require 'rails_helper'

RSpec.describe Admiral, type: :model do
  it {should have_many :ships}
end