require 'rails_helper'

RSpec.describe "facilities/show", type: :view do

  before do
    controller.singleton_class.class_eval do
      include ActionView::Helpers::TagHelper
      include ChartHelper
      helper_method :chart
    end
  end

  it "renders attributes in <p>" do
    @facility = build(:facility, :name => "Name")

    render

    expect(rendered).to match(/Name/)
  end
end
