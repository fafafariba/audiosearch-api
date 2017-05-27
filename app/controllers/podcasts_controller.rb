class PodcastsController < ApplicationController
	before_action :set_client
	
	def show
		@show = @client.get_show(params[:id])
		unless @show['error']
			render json: @show, status: :ok
		else
			render json: { error: @show['error'] }, status: @show['status']
		end
	end
	
	private

	def set_client
		@client = Audiosearch::Client.new(
		:id     => '4374e6c56b1d9f538bf64136261f990225203fea8f54b104074e9929d1adaac0',
		:secret => '7e327644257eb46016da04f0dbf23c9564d92958e7a44d033be2ecdaf90833ba',
		:host   => 'https://www.audiosear.ch/',
		:debug  => false,
		)
	end
	
end
