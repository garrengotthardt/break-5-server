module Api
  module V1
    class GetMenuItemsController < ApplicationController

      # def grabMenuLink(googlePlacesURL)
      #   require 'openssl'
      #    doc = Nokogiri::HTML(open( googlePlacesURL , :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
      #
      #    docText = doc.text
      #
      #   if docText.include? "places.singleplatform.com"
      #     index = docText.index("http://places.singleplatform.com/")
      #     menuURL = docText[index, 200].split("%3")[0]
      #     grabMenuItems(menuURL)
      #   end
      # end
      #
      #
      # def grabMenuItems(menuURL)
      #   require 'openssl'
      #    doc = Nokogiri::HTML(open( menuURL , :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
      #
      #    doc.css('.item').each do |item|
      #      newItem = []
      #      title = item.css('.title-row').css('.title').text.strip
      #      description = item.search('.description').text.strip
      #      newItem.push(title)
      #      newItem.push(description)
      #
      #      itemVariations = []
      #      itemPrice = item.css('.title-row').css('.price').text.strip
      #      itemMultiPrice = item.css('.multiprice').css('li').text.strip.squish
      #      itemVariations.push(itemPrice)
      #      itemVariations.push(itemMultiPrice)
      #
      #
      #      puts "ITEM:"
      #      puts newItem
      #      puts "ITEM VARIATIONS:"
      #      puts itemVariations
      #      puts
      #      puts
      #      puts
      #      puts
      #    end
      # end

      # grabMenuLink("https://maps.google.com/?cid=9087676600257989663")
    end
  end
end
