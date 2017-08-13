module Api
  module V1
    class GetMenuItemsController < ApplicationController

      def grabMenuLink(googlePlacesURL)
        require 'openssl'
         doc = Nokogiri::HTML(open( googlePlacesURL , :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

         docText = doc.text

        if docText.include? "places.singleplatform.com"
          index = docText.index("http://places.singleplatform.com/")
          menuURL = docText[index, 200].split("%3")[0]
          grabMenuItems(menuURL)
        end
      end


      def grabMenuItems(menuURL)
        require 'openssl'
         doc = Nokogiri::HTML(open( menuURL , :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

         doc.css('.item').each do |item|
           newItem = []
           title = item.search('.title').text
           price = item.search('.price').text
           description = item.search('.description').text
           newItem.push(title)
           newItem.push(price)
           newItem.push(description)
           puts newItem
         end
      end

      grabMenuLink("https://maps.google.com/?cid=9087676600257989663")
    end
  end
end
