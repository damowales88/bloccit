class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : where(public: true) }

  default_scope { order("created_at DESC")}

  scope :publicly_viewable, -> { where(public: true) }

  scope :privately_viewable, -> { where(public: false) }
end