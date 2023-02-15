require 'swagger_helper'

RSpec.describe 'Api::V1::SpotsController', type: :request do
  path '/api/v1/spots' do
    get 'Retrieves the list of all Spots' do
      tags 'Spots Controller'
      consumes 'application/json'

      response '200', 'ok' do
        before do
          12.times do
            FactoryBot.create(:spot)
          end
        end

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data["spots"].length).to eq 12
        end
      end
    end

    post 'Creates a Spot' do
      tags 'Spot Controller'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
                  type: :object,
                  properties: {
                    title: { type: :string },
                    description: { type: :string },
                    price: { type: :float },
                  },
                }

      response '201', 'ok' do

        let(:params) { { title: "Test Title", description: "Test description for this spot.", price: 525.25 } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data["spot"]).should be_present
          expect(data["spot"]["title"]).to eq 'Test Title'
        end
      end

      response '422', 'unprocessable_entity' do

        let(:params) { { title: "Test Title", description: "Test description for this spot."} }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data["spot"]).should be_present
          expect(data['message']["price"][0]).to eq "can't be blank"
        end
      end
    end
  end
################################
  path "/api/v1/spots/{id}" do
    get 'Retrieves a Spot' do
      tags 'Spots Controller'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'ok' do
        before do
          FactoryBot.create(:spot)
        end
        let(:id) { Spot.last.id }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data["spot"]).should be_present
          expect(data["spot"]["title"]).to eq "Beautiful Ocean View"
        end
      end
    end

    put 'Update a Spot' do
      tags 'Spot Controller'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :params, in: :body, schema: {
                  type: :object,
                  properties: {
                    title: { type: :string },
                    description: { type: :string },
                    price: { type: :float },
                  },
                }

      response '201', 'ok' do

         before do
          FactoryBot.create(:spot)
        end
        let(:id) { Spot.last.id }
        let(:params) { { title: "Update stop title" } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data["spot"]).should be_present
          expect(data["spot"]["title"]).to eq 'Update stop title'
        end
      end
    end

    delete 'Delete a Spot' do
      tags 'Spot Controller'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'ok' do

        before do
          FactoryBot.create(:spot)
        end
        let(:id) { Spot.last.id }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data["spot"]).should be_present
          expect(data["spot"]["id"]).to eq id
        end
      end
    end
  end

end
