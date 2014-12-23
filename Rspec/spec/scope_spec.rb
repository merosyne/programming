require 'rspec'

GLOBAL_STRING = "top level before all is in scope"

describe "top level" do
  before :all do
    @top_level_before_all = GLOBAL_STRING
  end
  
  it "does a top level test" do
    @top_level_before_all.should == GLOBAL_STRING
  end
  
  describe "embedded scope" do
    it "does a test in an embedded describe" do
      @top_level_before_all.should == GLOBAL_STRING
    end
    
    context "third level" do
      it "does a test in an embedded context" do
        @top_level_before_all.should == GLOBAL_STRING
      end
    end
    
    describe "yet another third level" do
      it "does a test in a describe 3 levels down" do
        @top_level_before_all.should == GLOBAL_STRING
      end
    end
  end
 
end
