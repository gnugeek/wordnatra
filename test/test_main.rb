require 'rubygems'
require 'spec'
require 'sinatra'
require 'sinatra/test/rspec'
require 'main'

describe 'Wordnatra http interface' do
  
  it "should respond to /" do
    get_it '/'
    @response.should be_ok
  end
  
end

describe 'Casedword class' do
  setup do
    @casedword = Casedword.first
  end
  it 'should have one Sense' do
    assert_instance_of Sense, @casedword.sense
  end
end
  
describe 'Wordposition class' do
  setup do
    @wordpos = Wordposition.first
  end
  it 'should belong to sense' do
    assert_instance_of Sense, @wordpos.sense
  end
end

describe 'Sample class' do
  setup do
    @sample = Sample.first
  end
  it 'should belong to synset' do
    assert_instance_of Synset, @sample.synset
  end
end

describe 'Word class' do
  setup do 
    @word = Word.first
  end  
  it 'should have at least one sense' do
    assert_instance_of Sense, @word.senses.first
  end  
  it 'should have at least one synset' do
    assert_instance_of Synset, @word.synsets.first
  end
end

describe 'Sense class' do
  setup do
    @sense = Sense.first
  end
end



