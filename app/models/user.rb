class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :compositions
  has_one :avatar, as: :attachable, autosave: true
  accepts_nested_attributes_for :avatar

  def role_as_string
    role || "Role"
  end

  def writer?
    role == "Writer"
  end
end
