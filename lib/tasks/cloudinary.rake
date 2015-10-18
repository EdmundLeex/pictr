# require File.expand_path('../application', __FILE__)

namespace :cloudinary do
	task :destroy_all => :environment do
		public_ids = Cloudinary::Api.resources(
			type: :upload,
			cloud_name: ENV['cloud_name'],
			api_key: ENV['api_key'],
			api_secret: ENV['api_secret']
		)['resources'].map { |h| h['public_id']}

		unless public_ids.empty?
			result = Cloudinary::Api.delete_resources(
				public_ids,
				cloud_name: ENV['cloud_name'],
				api_key: ENV['api_key'],
				api_secret: ENV['api_secret']
			)
			puts result
			puts "true"
		else
			puts "Already empty"
		end
	end
end