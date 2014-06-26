require 'rails_helper'

RSpec.describe "locations/new", :type => :view do
  before(:each) do
    assign(:location, Location.new(
      :loc => "MyString",
      :coordinates => ""
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input#location_loc[name=?]", "location[loc]"

      assert_select "input#location_coordinates[name=?]", "location[coordinates]"
    end
  end
end
