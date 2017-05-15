require 'rails_helper'

RSpec.describe "facilities/index", type: :view do

  before do
    controller.singleton_class.class_eval do
      include ActionView::Helpers::TagHelper
      include ChartHelper
      include ApplicationHelper
      helper_method :chart, :map_chart_styles
    end
  end
  
  it "renders a list of facilities" do
    assign(:facilities, [
      create(:facility, :name => "john"),
    ])

    render

    assert_select 'h3', text: 'john', count: 1
  end
end
