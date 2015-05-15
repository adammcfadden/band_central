class Venue < ActiveRecord::Base

  has_and_belongs_to_many :bands

  before_save :capitalize_name

  private
  def capitalize_name
    self.name = self.name.downcase.titleize
  end
end
