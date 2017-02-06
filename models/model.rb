require 'net/http'
require 'json'
require 'rubygems'

def format_request_and_call_api(search_term)
  #substitute the spaces for + signs, since that's how web search terms are formatted
 new_search_term=search_term.gsub(" ", "+")
	#make the call to the API using your API key! THIS WILL CHANGE BASED ON YOUR API. Look for the API endpoint. Substitute a variable for the search term, and put in your personal API key. 
	request_string = "http://api.giphy.com/v1/gifs/search?q=#{new_search_term}&api_key=dc6zaTOxFJmzC"   

	
	#input: request string. Output is Ruby hash with tons of data. 
	sample_uri = URI(request_string) #opens a portal to the data at that link
	sample_response = Net::HTTP.get(sample_uri) #go grab the data in the portal
	sample_parsedResponse = JSON.parse(sample_response) #makes data easy to read
	# data comes back as a hash with info stored in key :data as an array
	
	#THIS WILL CHANGE DEPENDING ON YOUR API. You need to figure out how to get just an array of your answers.
	data = sample_parsedResponse["data"]
	
	# data is now an array containing hashes of the gifs
	#the .sample method picks one element from the array randomly.It then pulls out the embed url, which you can then use in an image. 
	one_gif=data.sample
	
	url=one_gif["images"]["fixed_height"]["url"]

end