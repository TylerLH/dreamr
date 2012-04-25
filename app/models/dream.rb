class Dream
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongo::Voteable
  field :title, :type => String
  field :content, :type => String
  field :user_explanation, :type => String
  field :public, :type => Boolean, :default => true
  field :anonymous, :type => Boolean, :default => false

  # set points for each vote
  voteable self, :up => +1, :down => -1

  belongs_to :user
  has_many :comments, :dependent => :destroy

  attr_accessible :title, :content, :user_explanation, :public, :votes, :comments, :user
end
