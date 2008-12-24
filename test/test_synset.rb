require 'helper'

describe "A Synset" do
  before(:each) do
    @synset = Synset.first(:synsetid => 105813229)
  end
  it 'should have samples' do
    assert_instance_of Sample, @synset.samples.first
  end
  it 'should have senses' do
    assert_instance_of Sense, @synset.senses.first
  end
  it 'should belong to one categorydef' do
    assert_instance_of Categorydef, @synset.categorydef
  end
end
