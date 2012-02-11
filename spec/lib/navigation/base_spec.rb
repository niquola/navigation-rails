require 'spec_helper'
describe Navigation::Base do
  class TestNavigation < Navigation::Base
    def draw
      item 'link1','url1'
      item 'link2','url1'
      group 'group1' do
        item 'link3','url3'
        item 'link4','url4'
      end
    end
  end


  let :nav do
    TestNavigation.new(nil)
  end

  it "should" do
    nav.items.should_not be_empty
    group = nav.items[2]
    group.should be_a(Navigation::Base::Group)
    group.items.should_not be_empty
    group.label.should == 'group1'
  end
end
