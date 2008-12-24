require 'helper'

describe "A Wordposition" do
  before(:each) do
    @wordposition = Wordposition.first
  end
  it 'should belong to a sense' do
    assert_instance_of Sense, @wordposition.sense
  end
end