get '/' do
	erb :index
end

get '/upload' do
	if request.xhr?
		erb :"/partials/_upload", layout: false
	else
		erb :"/partials/_upload"
	end
end