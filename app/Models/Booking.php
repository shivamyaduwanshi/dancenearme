<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\ProductImage;

class Booking extends Model
{
    use SoftDeletes;

    public function user(){
        return $this->hasOne('App\User','id','user_id');
    }

    public function vendor(){
        return $this->hasOne('App\User','id','vendor_id');
    }

    public function service(){
        return $this->hasOne('App\User','id','user_id');
    }

    public function statusHistory(){
        return $this->hasMany('App\Models\BookingStatusHistory','booking_id','id');
    }

}
