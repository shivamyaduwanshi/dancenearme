<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Chat extends Model
{
    use SoftDeletes;

    public function sender(){
        return $this->hasOne('App\User','id','sender_id');
    }

    public function receiver(){
        return $this->hasOne('App\User','id','receiver_id');
    }
}
