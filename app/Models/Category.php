<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    public function getImageAttribute($banner)
    {
        if($banner)
            return asset('public/images/category/'.$banner);
        else
            return asset('public/images/system/image-not-available.png');
    }

}
