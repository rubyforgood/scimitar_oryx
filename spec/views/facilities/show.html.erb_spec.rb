require 'rails_helper'

RSpec.describe "facilities/show", type: :view do

  it "renders attributes in <p>" do
    @facility = build(:facility, :name => "Name")

    render

    expect(rendered).to match(/Name/)
  end
end
