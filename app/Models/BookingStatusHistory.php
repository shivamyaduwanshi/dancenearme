<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BookingStatusHistory extends Model
{
    protected $table = 'booking_status_histories';
    
    public function statusHistory(){
       return $this->hasMany('App\Models\Booking','id','booking_id');
    }
}


