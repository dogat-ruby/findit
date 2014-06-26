require 'rails_helper'

RSpec.describe "locations/edit", :type => :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :loc => "MyString",
      :coordinates => ""
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do

      assert_select "input#location_loc[name=?]", "location[loc]"

      assert_select "input#location_coordinates[name=?]", "location[coordinates]"
    end
  end
end
