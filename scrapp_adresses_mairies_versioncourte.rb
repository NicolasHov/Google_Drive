require 'nokogiri'
require 'pry'
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage(url_city)
  page = Nokogiri::HTML(open(url_city))
  mail_city =  page.css('p:contains("@")')                                                #mail_city = page.css('tbody tr td.style27 p.Style22')                 # html body table tbody tr td table tbody tr td table tbody tr td table tbody tr td.style27 p.Style22 font
  puts mail_city.text
  return mail_city.text
end


def get_all_the_urls_of_val_doise_townhalls()

  balise = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  name_cities =  balise.css('p a.lientxt')               #puts name_city;   puts name_city.class;   puts name_city.count
  @array_url_city = []
  @array_mail_city = []
  @array_name_city = []

  name_cities.each do |city|
      if city.class == Nokogiri::XML::Element               #unitile
        url_city2 = "http://annuaire-des-mairies.com/" + city['href']
        mail_city = get_the_email_of_a_townhal_from_its_webpage(url_city2)
        name_city = city.text
        #on enregistre dans des arrays
        @array_name_city << name_city
        @array_url_city << url_city2
        @array_mail_city << mail_city
        return @array_name_city, @array_url_city, @array_mail_city      #puts city.content==puts city.text
      end

  end
# url_city2 = "http://annuaire-des-mairies.com/" + url_city.text
end

def makeHashFromArray()
  @annuaire_95 = {}
  i = 0
  @array_name_city.each do |key|
     @annuaire_95["#{key}"]= @array_mail_city[i]
     i += 1
   end
   return annuaire_95
end

get_all_the_urls_of_val_doise_townhalls
pp makeHashFromArray()
