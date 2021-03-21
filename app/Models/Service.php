<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    public function getImageAttribute($banner)
    {
        if($banner)
            return asset('public/images/service/'.$banner);
        else
            return asset('public/images/system/image-not-available.png');
    }
}
