class Person
  include ActiveModel::Validations

  validates :phone_number, phone_number_format: true

  attr_accessor :phone_number

  def initialize(attributes = {})
    @phone_number = attributes[:phone_number]
  end
end
