class ApplicationController < ActionController::API
  private

  def issue_token payload
    JWT.encode(payload, secret, algorithm)
  end

  def authorize_user!
    if !current_user.present?
      #ERROR SHOULD SAY "YOUR TOKEN IS INVALID"
      render json: {error: 'No user id present'}
    end
  end

  def current_user
    @current_user ||= User.find_by(id: token_user_id)
  end

  def token_user_id
    decoded_token.first['id']
  end

  def decoded_token
    if token
      begin
        JWT.decode(token,secret, true, {algorithm: algorithm})
      rescue JWT::DecodeError
        return [{}]
      end
    else
      [{}]
    end
  end

  def token
    request.headers['Authorization']
  end

  def secret
    #change to using ENV Variable with figueroa gem
    "railsdragons"
  end

  def algorithm
    "HS256"
  end


  ###MenuItemGrabber
  def getNearbyPlaces(lat, long)
    @client = GooglePlaces::Client.new('AIzaSyCjEt1fC6-5TCeW7-AXugFRWkjeGImZfyU')
    resultsArray = @client.spots(lat, long, :types => ['restaurant','food'])
    resultsGoogleIDArray = resultsArray.map { |result| result.place_id  }
    fullPlaceDataArray = resultsGoogleIDArray.map { |place_id| @client.spot(place_id)}
    fullPlaceDataArray.each do |place|
      ## FIND OR CREATE PLACE
      @place = Place.find_or_create_by(google_places_id: place.place_id)
      @place.update(name: place.name, address: place.formatted_address, lat: place.lat, long: place.lng, url: place.url)

      # @place.name = place.name
      # @place.address = place.formatted_address
      # @place.lat = place.lat
      # @place.long = place.lng
      # @place.url = place.url
      # @place.save

      grabMenuLink(@place.url, @place.id)

      if @place.menu_items.length == 0
        @place.destroy
      end
    end
  end

  def grabMenuLink(googlePlacesURL, placeID)
    require 'openssl'
    require 'open-uri'
     doc = Nokogiri::HTML(open( googlePlacesURL , :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read)

     docText = doc.text

    if docText.include? "places.singleplatform.com"
      index = docText.index("http://places.singleplatform.com/")
      menuURL = docText[index, 200].split("%3")[0]
      grabMenuItems(menuURL, placeID)
    end
  end


  def grabMenuItems(menuURL, placeID)
    require 'openssl'
     doc = Nokogiri::HTML(open( menuURL , :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read)

     doc.css('.section').each do |section|
       sectionName = section.css('.title').css('h3').text.strip

       section.css('.item').each do |item|
        #  newItem = []
         name = item.css('.title-row').css('.title').text.strip
         description = item.search('.description').text.strip
         ## FIND OR CREATE ITEM BY NAME
         @menuItem = MenuItem.find_or_create_by(name: name, place_id: placeID)
         @menuItem.description = description
         @menuItem.category = sectionName
         @menuItem.save

         ## IF ITEM HAS SINGLE PRICE
        if item.css('.title-row').css('.price').length != 0
           itemPrice = item.css('.title-row').css('.price').text.strip.slice(1..-1).to_f

           if itemPrice <= 5
             @itemVar = ItemVariation.find_or_create_by(variation:'', menu_item_id: @menuItem.id)
             @itemVar.price = itemPrice
             @itemVar.save
           end

         ## IF ITEM HAS MULTIPLE PRICES
        elsif item.css('.multiprice').css('li').length != 0
           item.css('.multiprice').css('li').each do |variation|
             itemVar = variation.css('.title').text.strip
             itemVarPrice = variation.css('.price').text.strip.slice(1..-1).to_f
             if itemVarPrice <= 5
               @itemVar = ItemVariation.find_or_create_by(variation: itemVar, menu_item_id: @menuItem.id)
               @itemVar.price = itemVarPrice
               @itemVar.save
             end
           end
        end

        if @menuItem.item_variations.length == 0
          @menuItem.destroy
        end
       end
     end
  end
end
