<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Gig extends Model
{
    use SoftDeletes;

    public function user(){
        return $this->hasOne('App\User','id','user_id');
    }

    public function getImageAttribute($image){
      if($image)
        return asset('images/gig/'.$image);
      else
        return asset('images/system/image-not-available.png');
    }

}
