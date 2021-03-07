class Course < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user }
  
  belongs_to :user
  validates :title, :level, :language, presence: true
  validates :description, presence: true, length: { :minimum => 5 }
  validates :short_description, presence: true, length: { :minimum => 5 }
  validates :price, presence: true
  has_rich_text :description

  extend FriendlyId
  friendly_id :title, use: :slugged
  
  LANGUAGES = [:"English", :"French", :"Spanish"]
  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
  def self.levels
    LEVELS.map { |language| [language, language] }
  end
  
  def to_s
    title
  end
  # friendly_id :generated_slug, use: :slugged
  # def generated_slug
  #   require 'securerandom'
  #   @random_slug ||= persisted? ? friendly_id : SecureRandom.hex(4)
  # end

  # def to_s
  #   slug
  # end
end
