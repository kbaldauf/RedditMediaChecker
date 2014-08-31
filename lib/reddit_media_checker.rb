require 'uri'
require 'net/http'
require 'json'

class RedditMediaChecker
  
  def initialize(url, pages)
    if !url.end_with?(".json")
      url = url + ".json"
    end
    if pages <= 0
      puts "Must be given an integer number of pages greater than zero."
    else
      @url = url
      @pages = pages
      getJson(@url)
    end
  end
  
  def getJson(url)
    uri = URI.parse(url)
    request = Net::HTTP::Get.new(uri)
    response = Net::HTTP.new(uri.hostname, uri.port()).start { |http|
      http.request(request)
    }
    
    if(response.is_a? Net::HTTPSuccess)
      @pages-=1
      parseJson(response.body)
    else
      puts "Connection Failed!"
    end
  end
  
  def parseJson(redditJson)
    parsed = JSON.parse(redditJson)
    links = parsed["data"]["children"]
    
    for link in links
      data = link["data"]
      if data["media"] != nil
        puts data["domain"] + " -> " + data["permalink"]
      end
    end
    
    if @pages > 0 && parsed["data"]["after"] != nil
      getJson(@url + "?after=" + parsed["data"]["after"])
    end
  end  
end