require 'rails_helper'

RSpec.describe "locations/show", :type => :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :loc => "Loc",
      :coordinates => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Loc/)
    expect(rendered).to match(//)
  end
end
