import {ProjectState} from "../../src/app/projects/projectStates.js";

describe("ProjectState", function() {
  var projectState,
      mockResources,
      mockProjectResource,
      mockStateParams;

  beforeEach(function() {
    mockStateParams = {
      id: '5'
    }

    mockProjectResource = jasmine.createSpyObj('project resource', ['load']);

    mockResources = {
      project: jasmine.createSpy('project').and.returnValue(mockProjectResource)
    }

    projectState = new ProjectState();

  });

  it("should resolve a proejct", function() {
    projectState.project(mockResources, mockStateParams);
    expect(mockResources.project).toHaveBeenCalledWith({id: '5'});
  })
})
