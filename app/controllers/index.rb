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
	File.open(APP_ROOT.join('public', 'uploads').to_s + "/" + params['myfile'][:filename], "w") do |f|
		f.write(File.open(params['myfile'][:tempfile], "r").read)
	end

	new_image = Imagefile.create(	filename: params['myfile'][:filename], 
									url: '/uploads/' + params['myfile'][:filename])

	if request.xhr?
		return File.dirname(__FILE__) + '/../../public/uploads/' + params['myfile'][:filename]
	else
		redirect "/review/#{new_image.id}"
	end
end

get '/delete' do
	files = Dir[APP_ROOT.join('public', 'uploads', '*')].join("</br>")
	Dir[APP_ROOT.join('public', 'uploads', '*')].each { |file|  File.delete(file) }
	files + "</br> were deleted"
end

get '/review/:id' do
	@image = Imagefile.find_by(id: params[:id])
	if request.xhr?
		# haml :"/partials/_review"
		"HAML"
	else
		erb :"/partials/_review"
	end
end