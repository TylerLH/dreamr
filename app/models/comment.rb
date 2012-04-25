class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongo::Voteable

  belongs_to :dream
  belongs_to :user
  field :content, :type => String

  attr_accessible :dream, :content, :user

  validates_presence_of :content
end
