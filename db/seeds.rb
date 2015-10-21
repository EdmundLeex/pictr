User.destroy_all

User.create(username: 'demo', password: 'secret')


Album.destroy_all

Album.create(title: 'Demo Album1', description: 'Demo description', user: User.first)
Album.create(title: 'Demo Album2', description: '', user: User.first)
Album.create(title: 'Demo Album3', description: 'description', user: User.first)


Picture.destroy_all
begin
	Rake::Task['cloudinary:destroy_all'].invoke
rescue
	retry
end

seed_imgs = []
failed_imgs = {}
img_file = File.read('./db/images/images.txt').split("\n")

puts "Uploading to Cloudinary:"
img_file.each do |url|
	begin
		seed_imgs << Cloudinary::Uploader.upload(url, cloud_name: ENV['cloud_name'],
																									public_id: ENV['public_id'],
																									api_key: ENV['api_key'],
																									api_secret: ENV['api_secret'])
	rescue CloudinaryException => e
		failed_imgs[url] = e
		next
	end
	print "."
end
print "\n"
puts "Upload finished."

puts "Persisting Cloudinary urls to database"
seed_imgs.each do |img|
	Album.first.pictures.create(picture_url: img['url'], public_id: img['public_id'])
	print "."
end
print "\n"

Album.first.update(cover_picture_url: seed_imgs[0]['url'])


puts "=" * 40
puts "#{failed_imgs.size} file(s) failed to be uploaded."
puts "-" * 40
puts "Upload failed images:"
failed_imgs.each do |url, error|
	puts "- " + url
	puts "  " + error.to_s
end
puts "=" * 40