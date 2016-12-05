class HomeController < ApplicationController
  def index
  end

  def fetch_pictures
    source = "https://api.flickr.com/services/feeds/photos_public.gne?format=json"
    resp = Net::HTTP.get_response(URI.parse(source))
    data = resp.body
    data.gsub!("jsonFlickrFeed(","")
    data = data.split(")")
    data = data.join(")")
    json_val = JSON.parse data
    items = json_val["items"]
    @img_src = []
    items.each do |item|
      @img_src << item["media"]["m"]
    end
  end
end
