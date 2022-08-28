require 'rails_helper'

RSpec.describe Ship, type: :model do
  it {should belong_to :admiral}
end