class Band < ActiveRecord::Base

  has_and_belongs_to_many :venues

  before_validation :capitalize_name, on: :create

  private
  def capitalize_name
    self.name = self.name.downcase.titleize
  end
end
