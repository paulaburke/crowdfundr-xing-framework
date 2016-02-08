require 'spec_helper'

describe 'projects/#create' do
  let :valid_data do
    {
      data: {
        name: 'The Xing Framework',
        description: "This is a framework.",
        deadline: '2020-08-15T15:52:01+00:00',
        goal: 20000.00
      }
    }
  end

  let :json_body do valid_data.to_json end

  describe "successful create" do
    let :user do FactoryGirl.create(:user) end

    describe "POST projects" do
      it "returns 201 with the new address in the header 'Location'" do
        authenticated_json_post user, "projects", json_body
        expect(response.status).to eq(201)
        expect(response.headers["Location"]).to eq(page_path(Project.find_by_name( "The Xing Framework" )))
      end
    end
  end
end
