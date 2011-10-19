require 'spec_helper'

describe Translation do
  it "should update article languages" do
    article = FactoryGirl.create(:article)
    article.should_not nil?
  end
end
