#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'
require 'nokogiri'
require 'pry'
require 'open-uri'
require 'google_drive'



def get_the_email_of_a_townhal_from_its_webpage(url_city)
  page = Nokogiri::HTML(open(url_city))
  mail_city =  page.css('p:contains("@")')                                                #mail_city = page.css('tbody tr td.style27 p.Style22')                 # html body table tbody tr td table tbody tr td table tbody tr td table tbody tr td.style27 p.Style22 font
  return mail_city.text
end


def get_all_the_urls_of_val_doise_townhalls()

  balise = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  name_cities =  balise.css('p a.lientxt')               #puts name_city;   puts name_city.class;   puts name_city.count
  @array_url_city = []
  @array_mail_city = []
  @array_name_city = []
  @annuaire_95 = {}

  name_cities.each do |city|
      if city.class == Nokogiri::XML::Element               #unitile
        url_city2 = "http://annuaire-des-mairies.com/" + city['href']
        mail_city = get_the_email_of_a_townhal_from_its_webpage(url_city2)
        name_city = city.text
        #on enregistre dans des arrays
        @array_name_city << name_city
        @array_url_city << url_city2
        @array_mail_city << mail_city

       #puts city.content==puts city.text ?? old
      end

  end

#on remplit le hash
  i = 0
  @array_name_city.each do |key|
     @annuaire_95["#{key}"]= @array_mail_city[i]
     i += 1
   end
   return @annuaire_95
end

# Objectif : exporter les données du fichier annuaire dans une spreadsheet

def fillup_the_spreadsheet
  # Authenticate a session with your Service Account
  session = GoogleDrive::Session.from_service_account_key("config.json")
  # spreadsheet = session.spreadsheet_by_key("1z3WXs4mtZ6gMo26h-TMet4NHpSxeUSgoDwAe235KOnU")

  # Get the spreadsheet by its title
  spreadsheet = session.spreadsheet_by_title("Annuaire95")
  worksheet = spreadsheet.worksheets.first


  i = 1
  @array_name_city.each do |names|
    worksheet[i, 1] = "#{names}"
    i+= 1

  end

  i = 1
  @array_mail_city.each do |mail|
    worksheet[i, 2] = "#{mail}"
    i+= 1
  end

  worksheet.save
end


def perform
  #on scrappe les données
  get_all_the_urls_of_val_doise_townhalls
  # storing_hash_to_json(@annuaire_95)
  fillup_the_spreadsheet

end

perform


################################

#enregistrer dans un hash
def storing_hash_to_json(monHash)
#  monHash = {blabalbal}
  File.open("annuaire95.json","w") do |f|
    f.write(monHash.to_json)
  end
end

# TODO: a refaire avec le hash
def go_through_each_element_of_hash
  @annuaire_95.each do |key|
     get_the_name_and_put_it_in_spreadsheet()
     get_the_mail_and_put_it_in_spreadsheet()

   end
end

def get_the_name_and_put_it_in_spreadsheet(name)
end

def get_the_mail_and_put_it_in_spreadsheet(mail)

end
