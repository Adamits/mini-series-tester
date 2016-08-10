module Votable
  def self.included(base)
    base.has_many :voters, as: :votable, class_name: "Vote", dependent: :destroy
  end
end
