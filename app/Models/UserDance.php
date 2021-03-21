<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserDance extends Model
{

    protected $table = 'user_dances';

    public function dance(){
        return $this->hasOne('App\Models\Category','id','dance_id');
    }

}
