class Composition < ActiveRecord::Base
  include Votable
  belongs_to :user
  belongs_to :project, :counter_cache => true

  def most_recent_in_project?
    project.most_recently_published_composition == self
  end
end
