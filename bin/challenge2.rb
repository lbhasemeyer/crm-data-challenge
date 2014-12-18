require_relative('../data/crm.rb')
require 'pp'

result = []
CRM[:companies].each do |company|
  CRM[:people].each do |person|
    person[:employments].each do |employment|
      unless person[:employments].empty?
      employments_hash = {
        :company_id => company[:id],
        :commpany_name => company[:name],
        :person_id => person[:id],
        :person_first_name => person[:first_name],
        :person_last_name => person[:last_name],
        :title => employment[:title]
      }
      result << employments_hash
      end
    end
  end
end
pp result


# Write some code that will return an array of all the employments,
# including the person name, company name, person id, company id
# and title.

# [
#   {
#     :company_id => 4,
#     :company_name => "Nicolas and Sons",
#     :person_id => 20,
#     :person_first_name => "Savannah",
#     :person_last_name => "Clementina",
#     :title => "Chief Communications Consultant"
#   },
#   {
#     :company_id => 6,
#     :company_name => "Mueller LLC",
#     :person_id => 20,
#     :person_first_name => "Elyse",
#     :person_last_name => "Jensen",
#     :title => "Human Directives Engineer"
#   },
# ]
