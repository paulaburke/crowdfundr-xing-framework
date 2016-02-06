import {Module} from 'a1atscript';
import * as ProjectControllers from './projectControllers.js';
import * as ProjectStates from './projectStates.js';

var Project = new Module('project', [
  ProjectControllers,
  ProjectStates
]);

export default Project;
