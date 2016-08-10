class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  def self.votable_classes
    votable_classes_array
  end

  def name_as_string
    name || "Vote"
  end

  def can_be_voted_on_by?(user, votable)
    votable_classes_array.include?(votable.class.name)
  end

  private

  def votable_classes_array
    ["Project", "Composition"]
  end
end
