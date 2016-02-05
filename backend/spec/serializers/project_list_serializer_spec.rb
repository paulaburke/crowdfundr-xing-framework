require 'spec_helper'

describe ProjectListSerializer, :type => :serializer do

  let! :project_1 do
    FactoryGirl.create(:project,
                       :name => "Cool project",
                       :description => "the coolest"
                       )
  end

  let! :project_2 do
    FactoryGirl.create(:project,
                       :name => "Awesome project",
                       :description => "the best"
                       )
  end

  let! :project_3 do
    FactoryGirl.create(:project,
                       :name => "Rad project",
                       :description => "the most awesome"
                       )
  end

  let :serializer do
    ProjectListSerializer.new([project_1, project_2, project_3])
  end

  describe "as_json" do
end
