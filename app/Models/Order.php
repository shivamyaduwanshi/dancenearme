<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\ProductImage;

class Order extends Model
{
    use SoftDeletes;

    public function user(){
        return $this->hasOne('App\User','id','user_id');
    }

    public function items(){
        return $this->hasMany('App\OrderItem','order_id','id');
    }
}
