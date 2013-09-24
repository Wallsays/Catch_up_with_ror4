class Comment < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :commentable, polymorphic: true, touch: true
  # touch: true for update relation in object
end