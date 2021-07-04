class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  has_many :courses
  rolify
 # use to assign auto role to users
  after_create :assign_default_role
  def assign_default_role
    self.add_role(:student) if self.roles.blank?
  end

  # def assign_default_role
  #   if User.count == 1
  #     self.add_role(:admin) if_self.roles.blank?
  #     self.add_role(:teacher)
  #     self.add_role(:student)
  #   else
  #     self.add_role(:student) if_self.roles.blank?
  #     self.add_role(:teacher) 
  #   end
  # end
end
