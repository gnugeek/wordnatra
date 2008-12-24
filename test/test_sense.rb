require 'helper'

describe "A Sense" do
  before(:each) do
    @sense = Sense.first(:wordid => 79377)
  end
  it 'should belong to one word' do
    assert_instance_of Word, @sense.word
  end
  it 'should belong to one synset' do
    assert_instance_of Synset, @sense.synset
  end
  it 'should have wordpositions' do
    @sense2 = Sense.first(:wordid => 52466, :synsetid => 300014358)
    assert_instance_of Wordposition, @sense2.wordpositions.first
  end
end

