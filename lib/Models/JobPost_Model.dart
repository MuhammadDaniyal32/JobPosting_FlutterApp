class JobPost_Model{
   String _job_title,_job_desc;


   JobPost_Model(this._job_title, this._job_desc);
   //JobPost_Model(this.job_title, this.job_desc);
   String get job_title => _job_title;

  set job_title(String value) {
    _job_title = value;
  }


  get job_desc => _job_desc;

  set job_desc(value) {
    _job_desc = value;
  }
}