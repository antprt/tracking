require 'rails_helper'

RSpec.describe "providers/index", type: :view do
  before(:each) do
    assign(:providers, [
      Provider.create!(
        :name => "Name 1 "
      ),
      Provider.create!(
        :name => "Name 2"
      )
    ])
  end

  it "renders a list of providers" do
    render
    assert_select "tr#provider-1>td:nth-child(1)", :text => "Name 1".to_s, :count => 1
    assert_select "tr#provider-2>td:nth-child(1)", :text => "Name 2".to_s, :count => 1
  end
end
