class Project < ActiveRecord::Base
  belongs_to :user
  has_many :compositions

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
    compositions.where(published: true).order(updated_at: :desc).last
  end

end
