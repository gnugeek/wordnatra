require 'helper'

describe 'Wordnatra http interface' do
  it "should respond to /" do
    get_it '/'
    @response.should be_ok
  end
end