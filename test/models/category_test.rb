require 'test_helper' 

class CategoryTest < ActiveSupport::TestCase

    #must use instance variable "@example" each time, cause after each run the test gets scrubbed or use setup

    def setup 
        #this will run each time before the tests are run
        @category = Category.new(name: "Sports")
    end

    test "category should be vaild" do
        assert @category.valid?
    end

    test "names should be present" do
        @category.name = " "
        assert_not @category.valid?
        
    end

    test "name should be unique" do
        #need to save @category to table to test this
        @category.save
        #create second one with same name
        @category2 = Category.new(name: "Sports")
        assert_not @category2.valid?
        
    end

    test "name should not be too long" do
        @category.name = "a" * 30
        assert_not @category.valid?
        
    end

    test "name should not be too short" do
        @category.name = "aa"
        assert_not @category.valid?
    end
end