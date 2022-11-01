require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject do
    user1 = User.create(name: 'worash', username: 'worash', email: 'worash@gmail.com', password: 123_456)
    jet1 = Jet.create(name: 'first jet', description: 'The description for first jet description',
                      size: '10 person', category: 'Fisrt class', price_per_day: 100, finance_fee: 500, image: 'https://media.istockphoto.com/photos/private-jet-ready-for-boarding-picture-id523476302?k=20&m=523476302&s=612x612&w=0&h=63gNKXj_Dw1HJsAaDqZClb7j5kUvqVC_6l14f5t3W3M=')

    Reservation.new(user: user1, jet: jet1, starting_day: '12/10/2022', finish_day: '15/10/2022',
                    city: 'Addis ababa')
  end

  before { subject.save }

  it 'Reservation with all valid atributes should be valid' do
    expect(subject).to be_valid
  end

  it 'Reservation should be kind of Reservation' do
    expect(subject).to be_valid
  end

  it 'Reservation without user should not valid' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'Reservation without jet should not be valid' do
    subject.jet = nil
    expect(subject).to be_invalid
  end

  it 'Reservation without start date should not be valid' do
    subject.starting_day = nil
    expect(subject).to be_invalid
  end

  it 'Reservation without finish date should not be valid' do
    subject.finish_day = nil
    expect(subject).to be_invalid
  end

  it 'Reservation  without city should not be valid' do
    subject.city = nil
    expect(subject).to be_invalid
  end
end
