class Admin::CommentsController < Admin::ZapController
  resource :comment

  expose(:comments) { parent.comments }
  expose(:comment)
end

