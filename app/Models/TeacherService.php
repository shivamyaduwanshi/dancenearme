<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TeacherService extends Model
{
    public function service(){
         return $this->hasOne('App\Models\Service','id','service_id');
    }

    public function teacher(){
        return $this->hasOne('App\User','id','teacher');
    }

}
