require 'pp'

crm = File.read('../data/crm.rb')

def unemployed_people(crm)
  result = []
  crm[:people].each do |person|
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
end




## Challenge #3 - people without employments
#
# Write some code that will return an array of all the people
# who have no employments.  The resulting hashes in the array should
# _not_ include the `:employments` key.
#
require 'rspec/autorun'

RSpec.describe '#unemployed_people' do
  it 'returns an array of hashes containing the company and all its employees' do
    input = {
      :people => [
        {
          :id => 20,
          :first_name => "Savannah",
          :last_name => "Clementina",
          :employments => [
          ]
        },
        {
          :id => 32,
          :first_name => "Elyse",
          :last_name => "Jensen",
          :employments => [
          ]
        }
      ],
      :companies => [
        {
          :id => 0,
          :name => "Nicolas and Sons"
        },
      ]
    }
    expect(unemployed_people(input)).to eq(
    [
      {
        :id => 20,
        :first_name => "Savannah",
        :last_name => "Clementina"
      },
      {
        :id => 32,
        :first_name => "Elyse",
        :last_name => "Jensen",
      }
    ]
    )
  end
end
