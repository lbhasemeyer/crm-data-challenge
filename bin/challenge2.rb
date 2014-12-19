require 'pp'

crm = File.read('../data/crm.rb')

def employments_array(crm)
  result = []
  crm[:companies].each do |company|
    crm[:people].each do |person|
      person[:employments].each do |employment|
        unless person[:employments].empty?
        employments_hash = {
          :company_id => employment[:company_id],
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
  result
end


require 'rspec/autorun'

RSpec.describe '#employees_by_company' do
  it 'returns an array of hashes containing the company and all its employees' do
    input = {
      :people => [
        {
          :id => 20,
          :first_name => "Savannah",
          :last_name => "Clementina",
          :employments => [
            {
              :company_id => 0,
              :title => "Chief Person Guy Consultant"
            }
          ]
        },
        {
          :id => 32,
          :first_name => "Elyse",
          :last_name => "Jensen",
          :employments =>
          [
            {
              :company_id => 0,
              :title => "Chief Communications Consultant"
            }
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
    expect(employments_array(input)).to eq(
    [
      {
        :company_id => 0,
        :commpany_name => "Nicolas and Sons",
        :person_id => 20,
        :person_first_name => "Savannah",
        :person_last_name => "Clementina",
        :title => "Chief Person Guy Consultant"
      },
      {
        :company_id => 0,
        :commpany_name => "Nicolas and Sons",
        :person_id => 32,
        :person_first_name => "Elyse",
        :person_last_name => "Jensen",
        :title => "Chief Communications Consultant"
      },
    ]
    )
  end
end
