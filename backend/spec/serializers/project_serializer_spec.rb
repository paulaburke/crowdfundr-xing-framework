require 'spec_helper'

describe ProjectSerializer, :type => :serializer do

  let! :project do
    FactoryGirl.create(:project,
                       :name => "The Xing Framework",
                       :description => "cool thing",
                       :deadline => Date.today + 30.days,
                       :goal => 150000.00
                       )
  end

  let :serializer do
    ProjectSerializer.new(project)
  end

  describe "as_json" do
    let :json do serializer.to_json end

    it "should have the correct links" do
      expect(json).to be_json_string("/projects/#{project.id}")
        .at_path("links/self")
    end

    it "should have the right structure and content" do
      expect(json).to be_json_string("The Xing Framework").at_path("data/name")
      expect(json).to be_json_string("cool thing").at_path("data/description")
      expect(json).to be_json_string(project.deadline.as_json).at_path("data/deadline")
      expect(json).to be_json_string("150000.00").at_path("data/goal")
    end
  end
end
