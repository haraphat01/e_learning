class Course < ApplicationRecord
    validates :title, :short_description, :language, :level, :price,  presence: true
    validates :user_id,  presence: true
    validates :description, presence: true, length: { :minimum => 5 }
    def to_s
        title
    end
    belongs_to :user
    has_many :enrollments
    has_many :lessons, dependent: :destroy 
    has_rich_text :description 
    extend FriendlyId
  friendly_id :title, use: :slugged

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
