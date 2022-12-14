require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  path '/api/v1/reservations' do
    get('list reservations') do
      tags 'Reservations'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show reservation') do
      tags 'Reservations'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/add_reservation' do
    post('create reservation') do
      tags 'Reservations'
      response(200, 'successful') do
        consumes 'application/json'

        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            jet_id: { type: :integer },
            starting_day: { type: :string },
            finish_day: { type: :string },
            city: { type: :string }
          },
          required: %w[jet_id starting_day finish_day city]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/del_reservation' do
    delete('delete reservation') do
      tags 'Reservations'
      response(200, 'successful') do
        consumes 'application/json'

        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            id: { type: :integer }
          },
          required: ['id']
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
