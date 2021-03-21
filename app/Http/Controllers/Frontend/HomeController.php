<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Session;
use App\Models\Category;
use App\Models\UserPortfolio;
use App\Models\UserSocialLink;
use App\Models\TeacherService;
use App\Models\UserDance;
use App\Models\Service;
use App\Models\UserFaq;
use App\User;
use App\Models\Gig;
use App\Models\Rating;
use DB;
use Auth;
use Hash;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth')->except(
            [ 'index','coachProfile','danceCategory','gigsDetails','lessionCost',
              'join' , 'signup' , 'signupStep2' ,'signupStep3' , 'teacherSignup',
              'userProfile' , 'doRequest' , 'userSignup' , 'userSignupStore'
            ]
        );
    }

    public function index()
    {
        $data['categories'] = Category::orderBy('title','asc')->get();
        $data['dancers']    = User::where('role_id','2')->where('is_featured','1')->orderBy('id','desc')->get();
        $data['gigs']       = Gig::whereNull('deleted_at')->orderBy('id','desc')->get();
        return view('frontend.index',compact('data'));
    }

    public function coachProfile($id){
        $user      = User::find($id);
        $reviews   = Rating::where('teacher_id',$id)->get();
        $faqs      = $user->userfaq;
        $services  = $user->userServices;
        $dances    = $user->userDances;
        return view('frontend.coach-profile',compact('user','reviews','faqs','services','dances'));
    }

    public function danceCategory(Request $request){
        $dancers = User::where(function($query) use ($request){
            if($request->search){
                $query->whereRaw('LOWER(name) like ?', '%'.strtolower($request->search).'%');
                $query->orWhereRaw('LOWER(zip_code) like ?', '%'.strtolower($request->search).'%');
            }
            if($request->featured){
                $query->where('is_featured',$request->featured);
            }
        })->where('role_id','2')->orderBy('id','desc')->get();
        return view('frontend.dancers',compact('dancers'));
    }

    public function dancers(Request $request){
        $dancers = User::where(function($query) use ($request){
            if($request->search){
                $query->whereRaw('LOWER(name) like ?', '%'.strtolower($request->search).'%');
                $query->orWhereRaw('LOWER(zip_code) like ?', '%'.strtolower($request->search).'%');
            }
            if($request->featured){
                $query->where('is_featured',$request->featured);
            }
        })->where('role_id','2')->orderBy('id','desc')->get();
        return view('frontend.dancers',compact('dancers'));
    }

    public function gigsDetails(){
        return view('frontend.gigs-details');
    }

    public function lessionCost(){
        return view('frontend.lessons-cost');
    }

    public function join(){
        if(auth::check()){
            return redirect()->route('my-account');
        }
        return view('frontend.join');
    }

    public function services(Request $request){
        $dancers = User::where(function($query) use ($request){
            if($request->search){
                $query->whereRaw('LOWER(name) like ?', '%'.strtolower($request->search).'%');
                $query->orWhereRaw('LOWER(zip_code) like ?', '%'.strtolower($request->search).'%');
            }
            if($request->featured){
                $query->where('is_featured',$request->featured);
            }
        })->where('role_id','2')->orderBy('id','desc')->get();
        return view('frontend.dancers',compact('dancers'));
    }

    public function login(){
        if(auth::check()){
            return redirect()->route('my-account');
        }
        return view('frontend.login');
    }

    public function signup(){
        if(auth::check()){
            return redirect()->route('my-account');
        }
        if(Session::get('dance_category'))
        Session::put('dance_category',Session::get('dance_category'));
        else
        Session::put('dance_category',[]);
        $dances = Category::where('is_active','1')->whereNull('deleted_at')->get();
        return view('frontend.signup',compact('dances'));
    }

    public function signupStep2(Request $request){
        if(auth::check()){
            return redirect()->route('my-account');
        }
         if($request->dance_category)
            Session::put('dance_category',$request->dance_category);
         else
            Session::put('dance_category',[]);
        if(Session::get('service_type'))
            Session::put('service_type',Session::get('service_type'));
         else
            Session::put('service_type',[]);
        $rules  = [
            'dance_category' => 'required'
        ];
        $message = [
            'dance_category.required' => 'Please select atleat one dance type'
        ];
        $request->validate($rules,$message);
        return view('frontend.signup-step2');
    }

    public function signupStep3(Request $request){
        if(auth::check()){
            return redirect()->route('my-account');
        }
        if($request->service_type){
            Session::put('service_type',$request->service_type);
         }else{
             Session::put('service_type',[]);
         }
         $rules  = [
            'service_type' => 'required',
            'zip_code'     => 'required',
            'travel_distance' => 'required'
          ];
          $message = [
            'service_type.required' => 'Please select atleat one service type'
         ];
        $request->validate($rules,$message);
        return view('frontend.signup-step3');
    }

    public function teacherSignup(Request $request){
        if(auth::check()){
            return redirect()->route('my-account');
        }
        $rules = [
           'first_name' => 'required',
           'last_name' => 'required',
           'email_address'  => 'required|string|email|max:255|unique:users,email,null,id,deleted_at,NULL',
           'phone_number'  => 'required|string|unique:users,phone,null,id,deleted_at,NULL',
           'password' => 'min:6|required_with:password_confirmation|same:password_confirmation',
           'password_confirmation' => 'min:6'
        ];
        $request->validate($rules);
        $storeData = [
            'name'       => $request->first_name .' '.$request->last_name,
            'first_name' => $request->first_name,
            'last_name'  => $request->last_name,
            'email' => $request->email_address,
            'phone' => $request->phone_number,
            'password' => \Hash::make($request->password),
            'zip_code' => Session::get('zip_code'),
            'travel_distance' => Session::get('travel_distance'),
            'role_id'         =>'2'
        ];
        $userDances = array();
        $userServieTypes = array();
        DB::beginTransaction();
        try{
            $userId = DB::table('users')->insertGetId($storeData);
                      foreach(Session::get('dance_category') as $key => $value){
                          array_push($userDances,[
                             'user_id'   => $userId,
                             'dance_id'  => $value
                          ]);
                      }
                      foreach(Session::get('service_type') as $key => $value){
                        array_push($userServieTypes,[
                           'user_id'   => $userId,
                           'service_type'  => $value
                        ]);
                    }
                      DB::table('user_dances')->insert($userDances);
                      DB::table('user_service_types')->insert($userServieTypes);
                      DB::commit();
                      Session::flush();
                      $user = User::find($userId);
                      Auth::login($user);
                      return redirect()->route('teacher-account')->with('status',true)->with('message','Registration successfully');
        }catch(\Exception $e){
           DB::rollback();
           return back()->with('status',false)->with('message',$e->getMessage());
        }
                
    }

    public function userSignup(){
        return view('frontend.user-signup');
    }

    public function userSignupStore(Request $request){
        $rules = [
            'first_name' => 'required',
            'last_name' => 'required',
            'email_address'  => 'required|string|email|max:255|unique:users,email,null,id,deleted_at,NULL',
            'phone_number'  => 'required|string|unique:users,phone,null,id,deleted_at,NULL',
            'password' => 'min:6|required_with:password_confirmation|same:password_confirmation',
            'password_confirmation' => 'min:6'
         ];
         $request->validate($rules);
         $storeData = [
             'role_id'  => '3',
             'name'       => $request->first_name .' '.$request->last_name,
             'first_name' => $request->first_name,
             'last_name'  => $request->last_name,
             'email' => $request->email_address,
             'phone' => $request->phone_number,
             'password' => \Hash::make($request->password)
         ];
         $userDances = array();
         $userServieTypes = array();
         DB::beginTransaction();
         try{
             $userId = DB::table('users')->insertGetId($storeData);
                       DB::commit();
                       Session::flush();
                       $user = User::find($userId);
                       Auth::login($user);
                       return redirect()->route('my-account')->with('status',true)->with('message','Registration successfully');
         }catch(\Exception $e){
            DB::rollback();
            return back()->with('status',false)->with('message',$e->getMessage());
         }
    }

    public function myAccount(){
        if(auth::user()->role_id == '2'){
            $data['gigs']    = Gig::where('user_id',auth::id())->orderBy('id','desc')->get();
            $data['dances']  = Category::where('is_active','1')->whereNull('deleted_at')->orderBy('title','asc')->get();
            $data['services'] = Service::where('is_active','1')->whereNull('deleted_at')->orderBy('title','asc')->get();
            $data['selectedDance']   = array_column(auth::user()->userDances->toarray(),'dance_id');
            $data['selectedServices'] = array_column(auth::user()->userServices->toarray(),'service_id');
            return view('frontend.teacher-account',compact('data'));
        }
        if(auth::user()->role_id == '3'){
            $data['gigs'] = Gig::where('user_id',auth::id())->orderBy('id','desc')->get();
            return view('frontend.student-account',compact('data'));
        }
    }

    public function userProfile(){
        return view('frontend.user-profile');
    }

    public function updateProfile(Request $request){
        $input = $request->all();
        $id = auth::id();
        $rules = [
            'name'   => 'required',
            'email'  => 'required|string|email|max:255|unique:users,email,'.$id.',id,deleted_at,NULL',
            'phone'  => 'required|string|unique:users,phone,'.$id.',id,deleted_at,NULL',
         ];
         
         $validator = \Validator::make($request->all(), $rules);
         if($validator->fails()){
             return array('status' => 'error' , 'msg' => 'failed to update gigs', '' , 'errors' => $validator->errors());
         }
  
         $fileName = null;
         if ($request->hasFile('profile_image')) {
             $fileName = str_random('10').'.'.time().'.'.request()->profile_image->getClientOriginalExtension();
             request()->profile_image->move(public_path('images/profile/'), $fileName);
         }
  
         $User = User::find($id);
         $User->name    = $input['name'];
         $User->email   = $input['email'];
         $User->phone   = $input['phone'];
         $User->address = $input['address'] ?? NULL;
  
         if($fileName){
           $User->profile_image = $fileName;
         }
   
         if($User->save()){
             return ['status'=>'success','message'=>'Successfully updated profile'];
         }else{
             return ['status'=>'failed','message'=>'Failed to  update profile'];
         }
    }

    public function updatepassword(Request $request){
        
        $input    = $request->all();
        $rules = [
                  'old_password'      => 'required',
                  'new_password'      => 'min:6|required_with:confirm_password|same:confirm_password',
                  'confirm_password'  => 'required|min:6',
                 ];

        $validator = \Validator::make($request->all(), $rules);
        if($validator->fails()){
            return array('status' => 'error' , 'msg' => 'failed to update password', '' , 'errors' => $validator->errors());
        }

       if (!(Hash::check($request->old_password, auth()->user()->password))) {
            return ['status'=>'failed','message'=>'Your old password does not matches with the current password  , Please try again'];
       }
       elseif(strcmp($request->old_password, $request->new_password) == 0){
        return ['status'=>'failed','message'=>'Your old password does not matches with the current password  , Please try again'];
       }

        $User  = User::find(auth::id());
        $User->password = Hash::make($input['new_password']);
        if($User->update()){
            return ['status'=>'success','message'=>'Successfully updated password'];
       }
       return ['status'=>'failed','message'=>'Failed to change password'];
    }
    
    public function aboutUsUpdate(Request $request){
        $user = User::find(auth::id());
        $user->bio = $request->bio;
        if($user->update())
          return ['status'=>'success','message'=>'Updated successfully'];
        else
          return ['status'=>'success','message'=>'Failed to update'];
    }

    public function businessinfoupdate(Request $request){
        $user = User::find(auth::id());
        $user->business_info = $request->business_info;
        if($user->update())
           return ['status'=>'success','message'=>'Successfully updated your business info'];
        else
           return ['status'=>'success','message'=>'Failed to updated business info'];
    }

    public function portfolio(Request $request){
        $fileName = null;
        if ($request->hasFile('image')) {
            $fileName = str_random('10').'.'.time().'.'.request()->image->getClientOriginalExtension();
            request()->image->move(public_path('images/portfolio/'), $fileName);
        }
        $insertId = \DB::table('user_portfolios')->insertGetId([
            'user_id' => auth::id(),
            'image'   => $fileName
        ]);
        
        if($insertId)
            return ['status'=>'success','message'=>'Image uploaded successfully'];
        else
            return ['status'=>'failed','message'=>'Failed to upload image'];
    }

    public function uploadProfileImage(Request $request){
        $fileName = null;
        if ($request->hasFile('image')) {
            $fileName = str_random('10').'.'.time().'.'.request()->image->getClientOriginalExtension();
            request()->image->move(public_path('images/profile/'), $fileName);
        }
        $previousImage = auth::user()->profile_image;
        if($previousImage){
            $arr = explode('/',$previousImage);
            $previousImage = end($arr);
        }
        $insertId = \DB::table('users')->where('id',auth::id())->update([
            'profile_image'   => $fileName
        ]);
        if($insertId){
            \File::delete('public/images/profile/'.$previousImage);
            return ['status'=>'success','message'=>'Successfully updated profile image'];
        }
        else{
            return ['status'=>'failed','message'=>'Failed to update profile image'];
        }
    }

    public function removePortfolio(Request $request){
        $id = $request->id;
        $image = UserPortfolio::find($id);
        $previousImage = $image->image;
        if($image->delete()){
            \File::delete('public/images/portfolio/'.$previousImage);
            return ['status'=>'success','message'=>'Image removed successfully'];
        }else{
            return ['status'=>'failed','message'=>'Failed to remove image'];
        }
    }

    public function addSocialLink(Request $request){
         $input = $request->all();
         $userSocialLink = new UserSocialLink;
         $userSocialLink->user_id = auth::id();
         $userSocialLink->link    = $input['link'];
         $userSocialLink->title   = $input['title'];
         if($userSocialLink->save())
            return ['status'=>'success','message'=>'Successfully added social link'];
         else
            return ['status'=>'failed','message'=>'Failed to add social link'];
    }

    public function removeSocialLink(Request $request){
        $input = $request->all();
        $userSocialLink = UserSocialLink::find($input['id']);
        if($userSocialLink->delete())
           return ['status'=>'success','message'=>'Successfully removed social link'];
        else
           return ['status'=>'failed','message'=>'Failed to remove social link'];
    }

    public function addDance(Request $request){
        $input = $request->all();
        DB::beginTransaction();
        try{
            DB::table('user_dances')->where('user_id',auth::id())->delete();
            if($input['dance_id']){
                $storeData = array();
                foreach($input['dance_id'] as $danceid){
                  array_push($storeData,[
                      'user_id'  => auth::id(),
                      'dance_id' => $danceid
                  ]);
                }
            }
            DB::table('user_dances')->insert($storeData);
            DB::commit();
            return ['status'=>'success','message'=>'Successfully updated dance'];
        }catch(\Execption $e){
            DB::rollback();
            return ['status'=>'failed','message'=>'Failed to update dance'];
        }
   }

   public function removeDance(Request $request){
       $input = $request->all();
       $UserDance = UserDance::find($input['id']);
       if($UserDance->delete())
          return ['status'=>'success','message'=>'Successfully removed dance'];
       else
          return ['status'=>'failed','message'=>'Failed to remove dance'];
   }

   public function addService(Request $request){
    $input = $request->all();
    DB::beginTransaction();
    try{
        DB::table('teacher_services')->where('teacher_id',auth::id())->delete();
        if($input['service_id']){
            $storeData = array();
            foreach($input['service_id'] as $service){
              array_push($storeData,[
                  'teacher_id'  => auth::id(),
                  'service_id'   => $service
              ]);
            }
        }
        DB::table('teacher_services')->insert($storeData);
        DB::commit();
        return ['status'=>'success','message'=>'Successfully updated service'];
    }catch(\Execption $e){
        DB::rollback();
        return ['status'=>'failed','message'=>'Failed to update service'];
    }
}

 public function removeService(Request $request){
   $input = $request->all();
   $TeacherService = TeacherService::find($input['id']);
   if($TeacherService->delete())
      return ['status'=>'success','message'=>'Successfully removed servivce'];
   else
      return ['status'=>'failed','message'=>'Failed to remove service'];
 }

    public function addFaq(Request $request){
        $input = $request->all();
        $userFaq = new UserFaq;
        $userFaq->user_id = auth::id();
        $userFaq->question    = $input['question'];
        $userFaq->answer      = $input['answer'];
        if($userFaq->save())
         return ['status'=>'success','message'=>'Successfully added faq'];
        else
         return ['status'=>'failed','message'=>'Failed to add faq'];
    }

   public function removeFaq(Request $request){
       $input = $request->all();
       $userFaq = UserFaq::find($input['id']);
       if($userFaq->delete())
       return ['status'=>'success','message'=>'Successfully removed faq'];
       else
       return ['status'=>'failed','message'=>'Failed to remove faq'];
   }

   public function giveRating(Request $request){
       $rating = $request->rating ?? '1';
       $review = $request->review ?? Null;
       $Rating = new Rating;
       $Rating->rating = $rating;
       $Rating->review = $review;
       $Rating->user_id = auth::id();
       $Rating->teacher_id = $request->id;
       if($Rating->save())
         return ['status'=>'success','message'=>'Thank you to give your review'];
       else
         return ['status'=>'failed','message'=>'Failed to give reive'];
   }

   public function addGigs(Request $request){
        
        $input  = $request->all();
        $rules  = [
            'title'       => 'required',
            'price'       => 'required|min:0',
            'description' => 'required',
            'image'       => 'required'
        ];

        $validator = \Validator::make($request->all(), $rules);
        if($validator->fails()){
            return array('status' => 'error' , 'msg' => 'failed to add gigs', '' , 'errors' => $validator->errors());
        }

         $fileName = null;
         if ($request->hasFile('image')) {
           $fileName = str_random('10').'.'.time().'.'.request()->image->getClientOriginalExtension();
           request()->image->move(public_path('images/gig/'), $fileName);
         }

        $gig = new Gig;
        $gig->title = $input['title'];
        $gig->price = $input['price'];
        $gig->description = $input['description'];
        if($fileName)
            $gig->image = $fileName;

        $gig->user_id = auth::id();

        if($gig->save())
             return ['status'=>'success','message'=>'Gig added successfully'];
        else
            return ['status'=>'failed','message'=>'Failed to add gig'];

   }

   public function updateGigs(Request $request){
    $input  = $request->all();
    $rules  = [
        'id'       => 'required',
        'title'    => 'required',
        'price'    => 'required|min:0',
        'description' => 'required'
    ];

    $validator = \Validator::make($request->all(), $rules);
    if($validator->fails()){
        return array('status' => 'error' , 'msg' => 'failed to update gigs', '' , 'errors' => $validator->errors());
    }

     $fileName = null;
     if ($request->hasFile('image')) {
     $fileName = str_random('10').'.'.time().'.'.request()->image->getClientOriginalExtension();
        request()->image->move(public_path('images/gig/'), $fileName);
     }

    $gig = Gig::find($input['id']);
    $previousImage = $gig->image;
    if($previousImage){
        $arr = explode('/',$previousImage);
        $previousImage = end($arr);
    }
    $gig->title = $input['title'];
    $gig->price = $input['price'];
    $gig->description = $input['description'];
    if($fileName)
        $gig->image = $fileName;

    if($gig->update()){
        \File::delete('public/images/gig/'.$previousImage);
        return ['status'=>'success','message'=>'Gig updated successfully'];
    }else{
        return ['status'=>'failed','message'=>'Failed to update gig'];
    }
   }

   public function deleteGigs(Request $request){
        $input  = $request->all();
        $rules  = [
            'id'       => 'required'
        ];

        $validator = \Validator::make($request->all(), $rules);
        if($validator->fails()){
            return array('status' => 'error' , 'msg' => 'failed to update gigs', '' , 'errors' => $validator->errors());
        }

        $gig = Gig::find($input['id']);

        if($gig->delete())
            return ['status'=>'success','message'=>'Gig deleted successfully'];
        else
            return ['status'=>'failed','message'=>'Failed to delete gig'];
   }

   public function getGig(Request $request){
       $id = $request->id;
       $gig = Gig::find($id);
       if($gig){
           return ['status'=>'success','message'=>'Record found','data'=>$gig];
       }else{
           return ['status'=>'failed','message'=>'Record not found'];
       }
   }

   public function doRequest(Request $request){
       $input = $request->all();
       $storeData = [
            'service_id' => $input['service_id'],
            'dancer_id'  => $input['dancer_id'],
            'dance_id'   => $input['dance_id'],
            'experience' => $input['experience'],
            'instructor' => $input['instructor'],
            'zip_code'   => $input['zip_code'],
            'age'        => $input['age'],
            'user_id'    => auth::id()
       ];
       $insertId = \DB::table('requests')->insertGetId($storeData);
       if($insertId)
           return ['status'=>'success','message'=>'Your request submitted successfully'];
        else
           return ['status'=>'failed','message'=>'Failed to submit your request'];
   }

   public function page($page = null){

     $config =  DB::table('configs')->where('key',strtolower($page))->first();

    if($config){
      $content  = $config->value;
    }else{
      $content  = '<h1>Page Not Found</h1>';
    }
     $key = urldecode($page); 
    return view('frontend.page',compact('page','key','content'));

   }

   public function contactUs(Request $request){
       return view('frontend.contact-us');
   }

   public function sendMail(Request $request){
       $input = $request->all();
       $rules = array(
           'subject' => 'required',
           'email'   => 'required|email',
           'message' => 'required',
       );
       $request->validate($rules);
       $data = array(
        'to'     => env('SUPPORT_MAIL'),
        'msg'    =>  $request->message,
        'subject' => $request->subject
       );
      \Mail::send('Mails.contact_us', $data, function ($message) use($data) {
        $message->from( env('MAIL_FROM') , $data['to'] );
        $message->to($data['to'])->subject($data['subject']);
      });
      return back()->with('status',true)->with('message','Thankyou to contact us, We\'ll contact you as soon posible!');
   }

}
