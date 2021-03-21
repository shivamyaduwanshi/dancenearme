<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\ProductImage;

class OrderItem extends Model
{
    use SoftDeletes;

    public function getImageAttribute()
    {
        $image = ProductImage::where('product_id',$this->id)->whereNull('deleted_at')->first();
        if($image)
            return asset('public/images/product/'.$image->image);
        else
            return asset('public/images/system/product_image.png');
    }

    public function marchant(){
        return $this->hasOne('App\User','id','marchant_id');
    }

    public function product(){
         return $this->hasOne('App\Models\Product','id','product_id');
    }

    public function getImagesAttribute(){
          $images = ProductImage::where('product_id',$this->id)->whereNull('deleted_at')->get(); 
          $imgs   = array(); 
          if($images->toArray()){
              foreach ($images as $key => $img) {
                  array_push($imgs,asset('public/images/product/'.$img->image));
              }
          }
          return $imgs;
    }
}
