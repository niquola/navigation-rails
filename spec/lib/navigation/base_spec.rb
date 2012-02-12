require 'spec_helper'
describe Navigation::Base do
  class TestNavigation < Navigation::Base
    def draw
      item 'link1','url1' do
        item 'sublink1','url1'
        item 'sublink2','url2'
      end

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

  it "should define sub links" do
    submenu = nav.items.first
    submenu.items.should_not be_empty
    submenu.items.first.label.should == 'sublink1'
    nosubmenu = nav.items[1]
    nosubmenu.items.should be_empty
  end

  it "should define groups" do
    nav.items.should_not be_empty
    group = nav.items[2]
    group.should be_a(Navigation::Base::Group)
    group.items.should_not be_empty
    group.label.should == 'group1'
  end
end
