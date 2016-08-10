class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :compositions
  has_many :roles, dependent: :destroy
  has_many :votes
  has_one :avatar, as: :attachable, autosave: true
  accepts_nested_attributes_for :avatar

  def assign_role(role_type)
    role_type.constantize.create(user: self)
  end

  def cast_vote(vote_type, votable)
    if can_cast_vote_type_on?(vote_type, votable)
      vote = vote_type.constantize.new
      vote.user = self
      vote.votable = votable
      vote.save
    else
      errors.add(:base, "You do not have permission to vote on this!")
      false
    end
  end

  def reader?
    roles.current.where(type: "Role::Reader").any?
  end

  def writer?
    roles.current.where(type: "Role::Writer").any?
  end

  def can_cast_vote_type_on?(vote_type, votable)
    vote_type.constantize.can_be_voted_on_by?(self, votable) && !has_voted_on?(votable)
  end

  def has_voted_on?(votable)
    votes.where(votable: votable).any?
  end
end
