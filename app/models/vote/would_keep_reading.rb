class Vote::WouldKeepReading < Vote

  def self.votable_classes
    ["Composition"]
  end

  def self.can_be_voted_on_by?(user, votable)
    votable_classes.include?(votable.class.name)
  end

  def name_as_string
    name || "Would Keep Reading"
  end
end
