require 'json'

tempHash = {
    "key_a" => "val_a",
    "key_b" => "val_b",
    "key_c" => "val_d"
}
File.open("temp.json","w") do |f|
  f.write(tempHash.to_json)
end
