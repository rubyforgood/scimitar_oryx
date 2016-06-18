require 'rails_helper'

RSpec.describe "animals/show", type: :view do

  let(:animal) { build :animal, :name => "Jeremy" }

  it "renders attributes in <p>" do
    render animal
    expect(rendered).to match(/Jeremy/)
  end
end
