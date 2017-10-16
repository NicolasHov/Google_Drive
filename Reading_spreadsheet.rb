
require 'bundler'
Bundler.require

# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("config.json")
# session = GoogleDrive::Session.from_service_account_key("config.json")

# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Un_tableau_exemple")

# Get the first worksheet
worksheet = spreadsheet.worksheets.first

# insérer des lignes
# worksheet.insert_rows(2, [["Hello!", "This", "was", "inserted", "via", "Ruby"]])
# worksheet.save
#
# worksheet.insert_rows(worksheet.num_rows + 1, [["Hello!", "This", "was", "inserted", "at", "the", "bottom"]])
# worksheet.save

worksheet[2, 1] = "Updated!"
worksheet.save

# Print out the first 6 columns of each row
worksheet.rows.each { |row| puts row.first(7).join(" | ") }
