import {Controller} from 'a1atscript';

@Controller('ProjectCtrl', ['project'])
export class ProjectController {
  constructor(project) {
    this.project = project;
  }
}
