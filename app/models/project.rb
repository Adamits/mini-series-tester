class Project < ActiveRecord::Base
  belongs_to :user
  has_many :compositions

  def self.published_compositions
    compositions.published
  end

  def my_compositions(user)
    compositions.where(user_id: user.id)
  end

  def collaborative_compositions(user)
    compositions.where.not(user_id: user.id)
  end

  def published_compositions_count
    compositions.where(published: true).count
  end

  def most_recently_published_composition
    compositions.where(published: true).order(updated_at: :asc).last
  end

  def next_composition(composition)
    compositions.where(published: true).where("updated_at > ?", composition.updated_at).first
  end

end
