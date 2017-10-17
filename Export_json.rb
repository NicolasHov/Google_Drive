#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'
require 'nokogiri'
require 'pry'
require 'open-uri'


# Objectif : exporter les données du fichier annuaire dans une spreadsheet



def storing_hash_to_json(monHash)
#  monHash = {blabalbal}
  File.open("annuaire95.json","w") do |f|
    f.write(monHash.to_json)
  end
end


# TODO : envoyer vers un spreadsheet
def go_through_each_element_of_hash
  @annuaire_95.each do |key|
     get_the_name_and_put_it_in_spreadsheet
     get_the_email_and_put_it_in_spreadsheet
   end
end

def get_the_name_and_put_it_in_spreadsheet

end

def get_the_email_and_put_it_in_spreadsheet

end

def perform
  #on importe le fichier qui scrappe les données
  load 'scrapp_adresses_mairies_versioncourte.rb'
  storing_hash_to_json(@annuaire_95)

end

perform
