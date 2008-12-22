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

describe 'Word class' do
  
  setup do
    @word = Word.first(:lemma => 'horse')
  end
  
  it "should find a word in the database" do
    assert_equal @word.lemma, 'horse'
  end
  
  it "should have at least one sense" do
    assert_instance_of Sense, @word.senses.first
  end
  
  it "should have at least one synset" do
    assert_instance_of Synset, @word.synsets.first
  end

end
