require 'rails_helper'

RSpec.describe "layouts/application.html.erb", type: :view do
  it "renders a header" do
    render
    expect(response).to render_template(:_header)
  end

  it "displays an alert" do
    render
    expect(response).to have_css('p.alert')
  end

  it "renders a home button link" do
    render
    expect(response).to have_css('.home-button')
  end
end
