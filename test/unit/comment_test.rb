require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "comments should have body" do
    comment = Comment.new(:author_id => 1)
    assert !comment.save
  end

  test "comments should have hierarchy" do
    parent = Comment.new(:body => 'Parent body', :author_id => 1)
    assert parent.save
    child = Comment.new(:body => 'Child body', :author_id => 1, :parent_id => parent.id)
    assert child.save
    assert_equal parent, child.parent
  end
end
