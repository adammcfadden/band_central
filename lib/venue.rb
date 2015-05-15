class Venue < ActiveRecord::Base

  has_and_belongs_to_many :bands

  before_save :capitalize_name
  validates :name, {presence: true, length: {maximum: 50}}


  private
  def capitalize_name
    self.name = self.name.downcase.titleize
  end
end
