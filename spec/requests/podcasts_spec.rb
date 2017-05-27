require 'rails_helper'

RSpec.describe "Podcasts API", type: :request do
	describe 'GET #show' do
		context 'with valid attributes' do 
			before { get "/shows/#{42}" }
			
			it 'receives a successful http response' do
				expect(response).to be_success
			end
			
			it 'gets the correct podcast' do
				expect(json['title']).to match(/Reply All/)
			end

			it 'gets the podcast description' do
				expect(json['description']).to_not be_nil
			end

			it 'gets podcast full image url' do
				expect(json['image_files'].first['url']['full']).to match(/http/)
			end
			
			it 'gets podcast thumb image url' do
				expect(json['image_files'].first['url']['thumb']).to match(/http/)
			end

			it 'gets episodes' do
				expect(json['episode_ids'].length).to be > 0
			end
		end
		
		context 'with invalid attributes' do
			before { get "/shows/#{0}" }
			it 'returns status 404 when not found' do
				expect(response).to have_http_status(404)
			end

			it 'returns an error message' do 
				expect(json['error']).to match(/not found/)
			end
		end
	end
end

			