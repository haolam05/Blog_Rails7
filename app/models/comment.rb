class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user
  has_rich_text :body

  has_noticed_notifications model_name: 'Notification'  # gem 'noticed'

  after_create_commit :notify_recipient                 # notify users when a comment is created
  before_destroy :cleanup_notifications                 # cleanup notifications when a comment is destroyed

  def notify_recipient
    # create a notification for the recipient
    CommentNotification.with(comment: self, post: post).deliver_later(post.user)  # only notify user of the post we are commented on
  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
  end
end
