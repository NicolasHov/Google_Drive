#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'


# Objectif : exporter les données du fichier annuaire dans une spreadsheet


# TODO : mettre les données dans un hash
def annuaire
  annuaire95 = {}
  #on importe le fichier qui scrappe les données
  load 'scrapp_adresses_mairies_versioncourte.rb'
end

annuaire

# TODO : exporter les données vers un json

# TODO : envoyer vers un sprea

def storing_hash_to_json
#  monHash = {blabalbal}
  File.open("anuuaire95.json","w") do |f|
    f.write(monHash.to_json)
  end

end
