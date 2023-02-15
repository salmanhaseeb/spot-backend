require 'swagger_helper'

RSpec.describe 'Api::V1::ReviewsController', type: :request do
  path '/api/v1/spots/{spot_id}/reviews' do
    post 'Creates a Review' do
      tags 'Spot Controller'
      consumes 'application/json'
      parameter name: :spot_id, in: :path, type: :string
      parameter name: :params, in: :body, schema: {
                  type: :object,
                  properties: {
                    spot_id: { type: :integer },
                    reviewer_name: { type: :string },
                    comment: { type: :string },
                    star: { type: :integer },
                  },
                }

      response '201', 'ok' do
        before do
          @spot = FactoryBot.create(:spot)
        end

        let(:spot_id) { @spot.id }
        let(:params) { { spot_id: @spot.id, reviewer_name: "test User", comment: "Such a beautiful Ocean View", star: 5 } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data["review"]).should be_present
          expect(data["review"]["reviewer_name"]).to eq 'test User'
        end
      end

      response '422', 'unprocessable_entity' do

        before do
          @spot = FactoryBot.create(:spot)
        end
        let(:spot_id) { @spot.id }
        let(:params) { { spot_id: @spot.id, comment: "Such a beautiful Ocean View", star: 5 } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.length).to eq 1
          expect(data['message']["reviewer_name"][0]).to eq "can't be blank"
        end
      end
    end
  end

  path '/api/v1/spots/{spot_id}/reviews/{id}' do
    put 'Update a Review' do
      tags 'Spot Controller'
      consumes 'application/json'
      parameter name: :spot_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      parameter name: :params, in: :body, schema: {
                  type: :object,
                  properties: {
                    spot_id: { type: :integer },
                    reviewer_name: { type: :string },
                    comment: { type: :string },
                    star: { type: :integer },
                  },
                }

      response '201', 'ok' do
        before do
          @review = FactoryBot.create(:review)
        end

        let(:spot_id) { @review.spot.id }
        let(:id) { @review.id }
        let(:params) { { reviewer_name: "test User", comment: "Such a beautiful Ocean View place", star: 5 } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data["review"]).should be_present
          expect(data["review"]["comment"]).to eq 'Such a beautiful Ocean View place'
        end
      end
    end

    delete 'Update a Review' do
      tags 'Spot Controller'
      consumes 'application/json'
      parameter name: :spot_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string

      response '200', 'ok' do
        before do
          @review = FactoryBot.create(:review)
        end

        let(:spot_id) { @review.spot.id }
        let(:id) { @review.id }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data["review"]).should be_present
          expect(data["review"]["id"]).to eq id
        end
      end
    end
  end
end
