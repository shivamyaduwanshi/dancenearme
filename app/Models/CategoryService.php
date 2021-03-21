<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CategoryService extends Model
{
    use SoftDeletes;

    protected $table = 'category_service';

    public function category(){
        return $this->hasOne('App\Models\Category','id','category_id');
    }

    public function service(){
        return $this->hasOne('App\Models\Service','id','service_id');
    }
}
