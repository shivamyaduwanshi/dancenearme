<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Models\UserSocialLink;

class User extends Authenticatable
{
    use Notifiable,SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token','updated_at','deleted_at'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function getProfileImageAttribute($profileImage){
        if($profileImage && file_exists('public/images/profile/'.$profileImage))
          return asset('images/profile/'.$profileImage);
        else
          return asset('images/system/profile-image-not-available.jfif');
    }

    public function getPortfolio(){
        $portfolios = \DB::table('user_portfolios')->where('user_id',$this->id)->get();
        $images = array();
        if($portfolios->toarray()){
           foreach($portfolios as $key => $value){
               if(!file_exists('public/images/portfolio/'.$value->image)){
                     continue;
               }
              array_push($images,[
                  'id'    => $value->id,
                  'image' => asset('images/portfolio/'.$value->image)
              ]);
           }
        }
        return $images;
    }

    public function avgRating(){
        $rating   = \DB::table('rating_reviews')->select('rating_reviews.*')->join('jobs','rating_reviews.job_id','=','jobs.id')->where('jobs.dancer_id',$this->id)->avg('rating');
        return $rating ? number_format($rating,1) : '0.0';
     }

     public function socialLinks(){
         return $this->hasMany('App\Models\UserSocialLink','user_id','id');
     }

     public function userfaq(){
         return $this->hasMany('App\Models\UserFaq','user_id','id');
     }

     public function userDances(){
        return $this->hasMany('App\Models\UserDance','user_id','id');
    }

     public function userServices(){
         return $this->hasMany('App\Models\TeacherService','teacher_id','id');
     }

     public function gigs(){
         return $this->hasMany('App\Models\Gigs','user_id','id');
     }

}
