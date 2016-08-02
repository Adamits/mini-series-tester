class Role < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true

  before_create :default_start_date

  def self.current
    where("roles.start_date < ? and (roles.end_date is ? or roles.end_date > ?)", Time.now, nil, Time.now)
  end

  def name_as_string
    name || "Role"
  end

  def reader?
    false
  end

  def writer?
    false
  end

  private

  def default_start_date
    self.start_date ||= Time.now
  end
end
