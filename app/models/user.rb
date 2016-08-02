class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :compositions
  has_many :roles, dependent: :destroy
  has_one :avatar, as: :attachable, autosave: true
  accepts_nested_attributes_for :avatar

  def assign_role(role_type)
    role_type.constantize.create(user: self)
  end

  def reader?
    roles.current.where(type: "Role::Reader").any?
  end

  def writer?
    roles.current.where(type: "Role::Writer").any?
  end
end
