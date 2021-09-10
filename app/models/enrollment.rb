class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :cant_subscribed_to_own_course,:user, :course, presence: true 
  validates_uniqueness_of :user_id, scope: :course_id #user cant enroll to the same course twice
  validates_uniqueness_of :course_id, scope: :user_id

  # validates :cant_subscribed_to_own_course

  protected
  def cant_subscribed_to_own_course
    if self.new_record?
      if user_id == course.user_id
        errors.add(:base, "You can't subscribe to your own course")
      end
    end
  end
end
