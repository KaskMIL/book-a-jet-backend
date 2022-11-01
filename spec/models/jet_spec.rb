require 'rails_helper'

RSpec.describe Jet, type: :model do
  subject do
    Jet.new(name: 'first jet', description: 'The description for first jet description',
            size: '10 person', category: 'Fisrt class', price_per_day: 100, finance_fee: 500, image: 'https://media.istockphoto.com/photos/private-jet-ready-for-boarding-picture-id523476302?k=20&m=523476302&s=612x612&w=0&h=63gNKXj_Dw1HJsAaDqZClb7j5kUvqVC_6l14f5t3W3M=')
  end

  before { subject.save }

  it 'Subject should be kind of Jet' do
    expect(subject).to be_kind_of(Jet)
  end

  it 'Jet should be valid with all valid atributes' do
    expect(subject).to be_valid
  end

  it 'Jet without name should be not valid' do
    subject.name = nil
    expect(subject).to be_invalid
  end

  it 'Jet without image should be not valid' do
    subject.image = nil
    expect(subject).to be_invalid
  end

  it 'Jet without category should not be valid' do
    subject.category = nil
    expect(subject).to be_invalid
  end

  it 'Jet without finance fee should not be valid' do
    subject.finance_fee = nil
    expect(subject).to be_invalid
  end

  it 'Jet without price per day should not be valid' do
    subject.price_per_day = nil
    expect(subject).to be_invalid
  end

  it 'Jet with gegative finance fee should not be valid' do
    subject.finance_fee = -5
    expect(subject).to be_invalid
  end

  it 'Jet with negative price per day should not be valid' do
    subject.price_per_day = -5
    expect(subject).to be_invalid
  end
end
