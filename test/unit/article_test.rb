require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "articles should have author" do
    article = Article.new(:body => 'Hola')
    assert !article.save
  end

  test "should save valid articles" do
    article = Article.new(:name => 'name', :body => 'body', :author_id => 1)
    assert article.save
  end

  test "articles should have hierarchy" do
    parent = Article.new(:name => 'parent', :body => 'parent body', :author_id => 1)
    assert parent.save
    child = Article.new(:name => 'child', :body => 'parent body', :author_id => 1, :parent_id => parent.id)
    assert parent.save
    assert_equal parent, child.parent
  end

end
