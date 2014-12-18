require_relative('../data/crm.rb')
require 'pp'


result = []
CRM[:companies].each do |company|
  company_hash = {name: company[:name], employees: []}
  result << company_hash
  CRM[:people].each do |person|
    person[:employments].each do |employment|
      if employment[:company_id] == company[:id]
        employee_hash = {
          :id => person[:id],
          :first_name => person[:first_name],
          :last_name => person[:last_name],
          :title => employment[:title]
        }
        company_hash[:employees] << employee_hash
      end
    end
  end
end
pp result


# crm = File.read('../data/crm.rb')
#
# def employees_by_company(crm)
#   result = []
#   crm[:companies].each do |company|
#     companies_hash = {:name => company[:name], :employees => []}
#     result << companies_hash
#     crm[:people].each do |person|
#       person[:employments].each do |employment|
#         if employment[:company_id] == company[:id]
#           employees_hash = {
#             :id => person[:id],
#             :first_name => person[:first_name],
#             :last_name => person[:last_name],
#             :title => employment[:title]
#           }
#           companies_hash[:employees] << employees_hash
#         end
#       end
#     end
#   end
#   result
# end
#
#
#
#
# require 'rspec/autorun'
#
# RSpec.describe '#employees_by_company' do
#   it 'returns an array of hashes containing the company and all its employees' do
#     input = {
#       :people => [
#         {
#           :id => 20,
#           :first_name => "Savannah",
#           :last_name => "Clementina",
#           :employments => [
#             {
#               :company_id => 0,
#               :title => "Chief Person Guy Consultant"
#             }
#           ]
#         },
#         {
#           :id => 32,
#           :first_name => "Elyse",
#           :last_name => "Jensen",
#           :employments =>
#           [
#             {
#               :company_id => 0,
#               :title => "Chief Communications Consultant"
#             }
#           ]
#         }
#       ],
#       :companies => [
#         {
#           :id => 0,
#           :name => "Nicolas and Sons"
#         },
#       ]
#     }
#     expect(employees_by_company(input)).to eq(
#     [
#       {
#         name: "Nicolas and Sons",
#         employees: [
#           {
#             :id => 20,
#             :first_name => "Savannah",
#             :last_name => "Clementina",
#             :title => "Chief Person Guy Consultant"
#           },
#           {
#             :id => 32,
#             :first_name => "Elyse",
#             :last_name => "Jensen",
#             :title => "Chief Communications Consultant"
#           },
#         ]
#       }
#     ]
#     )
#   end
# end
