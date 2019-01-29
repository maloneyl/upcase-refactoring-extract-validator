require 'spec_helper'

class PhoneNumberFormatValidatorTestClass
  include ActiveModel::Validations

  validates :phone_number, phone_number_format: true

  attr_accessor :phone_number

  def initialize(attributes = {})
    @phone_number = attributes[:phone_number]
  end
end

describe PhoneNumberFormatValidator do
  it 'does not validate if a phone number is not provided' do
    invalid_entity_one = PhoneNumberFormatValidatorTestClass.new
    invalid_entity_two = PhoneNumberFormatValidatorTestClass.new(phone_number: '')

    expect(invalid_entity_one).not_to be_valid
    expect(invalid_entity_two).not_to be_valid
  end

  it 'does not validate if a phone number formatting is incorrect' do
    invalid_entity_one = PhoneNumberFormatValidatorTestClass.new(phone_number: '++7777-777-777')
    invalid_entity_two = PhoneNumberFormatValidatorTestClass.new(phone_number: '777-7777-7777')

    expect(invalid_entity_one).not_to be_valid
    expect(invalid_entity_two).not_to be_valid
  end

  it 'validates with correct phone number formatting' do
    valid_entity_one = PhoneNumberFormatValidatorTestClass.new(phone_number: '7777777777')
    valid_entity_two = PhoneNumberFormatValidatorTestClass.new(phone_number: '777-777-7777 ext 888')

    expect(valid_entity_one).to be_valid
    expect(valid_entity_two).to be_valid
  end
end
