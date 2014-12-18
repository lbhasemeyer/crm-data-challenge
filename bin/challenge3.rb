require_relative('../data/crm.rb')
require 'pp'

result = []
CRM[:people].each do |person|
    if person[:employments].empty?
      unemployed_hash = {
        :id => person[:id],
        :first_name => person[:first_name],
        :last_name => person[:last_name]
      }
      result << unemployed_hash
    end
end
pp result



# result = []
#   CRM[:people].each do |person|
#       if person[:employments].empty?
#         unemployment_hash = {
#           :id => person[:id],
#           :first_name => person[:first_name],
#           :last_name => person[:last_name]
#         }
#         result << unemployment_hash
#       end
#   end
# pp result

## Challenge #3 - people without employments
#
# Write some code that will return an array of all the people
# who have no employments.  The resulting hashes in the array should
# _not_ include the `:employments` key.
#
# [
#   {
#     :id => 20,
#     :first_name => "Savannah",
#     :last_name => "Clementina"
#   },
#   {
#     :id => 32,
#     :first_name => "Elyse",
#     :last_name => "Jensen",
#   }
# ]
