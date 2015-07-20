get '/' do
	erb :index
end

get '/upload' do
	haml :"/partials/_upload"
end

post '/images' do
	p "*" * 100
	p params
	p "*" * 100
	return params[:file]
end

# Handle POST-request (Receive and save the uploaded file)
post "/" do 
	p "*" * 100
	p APP_ROOT.join('public', 'uploads', params['myfile'][:filename]).to_s
	p "*" * 100

	# File.open(APP_ROOT.join('public', 'uploads', params['myfile'][:filename]).to_s, "w") do |f|
	# 	f.write(File.open(params['myfile'][:tempfile], "r").read)
	# end

	# new_image = Imagefile.create(	filename: params['myfile'][:filename], 
	# 								url: '/uploads/' + params['myfile'][:filename])

	# redirect "/review/#{new_image.id}"
end

get '/review/:id' do
	@image = Imagefile.find_by(id: params[:id])
	erb :"/partials/_review"
end