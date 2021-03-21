<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    public function getBannerAttribute($banner)
    {
        if($banner)
            return asset('public/images/banner/'.$banner);
        else
            return asset('public/images/system/product_image.png');
    }
}