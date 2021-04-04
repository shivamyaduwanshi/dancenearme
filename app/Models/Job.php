<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Job extends Model
{

    public function user()
    {
       return $this->hasOne('App\User','id','user_id');
    }

    public function dancer()
    {
       return $this->hasOne('App\User','id','dancer_id');
    }

    public function service()
    {
       return $this->hasOne('App\Models\Service','id','service_id');
    }

    public function dance()
    {
       return $this->hasOne('App\Models\Category','id','dance_id');
    }

    public function review(){
       return $this->hasOne('App\Models\Rating','job_id','id');
    }
}