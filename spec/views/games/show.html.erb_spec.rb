require 'rails_helper'

RSpec.describe "games/show", :type => :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      :user => nil,
      :score => 1,
      :duration => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
