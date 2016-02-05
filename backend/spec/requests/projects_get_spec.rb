require 'spec_helper'

describe 'GET /projects', :type => :request do
  let! :project_1 do
    FactoryGirl.create(:project,
                       :name => "Xing Framework",
                       :description => "cool thing"
                       )
  end

  let! :project_2 do
    FactoryGirl.create(:project,
                       :name => "Xing Thing",
                       :description => "awesome thing"
                       )
  end

  let! :project_3 do
    FactoryGirl.create(:project,
                       :name => "Xing Other Thing",
                       :description => "neat thing"
                       )
  end

  let! :resource_url do
    "/projects"
  end

  it "returned json has the correct contents and format" do
    # fetch the resource using Xing's json_get helper
    json_get resource_url

    #response should have a 2xx http code
    expect(response).to be_success

    body = response.body

    # check that the self link, name, and description appear at the proper locations
    # within returned json
    expect(body).to be_json_string(resource_url).at_path("links/self")

    expect(body).to be_json_string(project_1.name).at_path("data/0/data/name")
    expect(body).to be_json_string(project_2.name).at_path("data/1/data/name")
    expect(body).to be_json_string(project_3.name).at_path("data/2/data/name")

    expect(body).not_to include(project_1.description)
    expect(body).not_to include(project_2.description)
    expect(body).not_to include(project_3.description)
  end
end
