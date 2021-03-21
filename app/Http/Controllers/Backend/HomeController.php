<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Exports\MarchantExport;
use App\Exports\MemberExport;
use App\Exports\ProductExport;
use App\Models\Config;
use Maatwebsite\Excel\Facades\Excel;
use App\User as Marchant;
use App\User as Member;
use App\User;
use App\Models\Product;
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
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('backend.home');
    }

    public function exportMarchants(Request $request){
      $data = User::select('users.id','users.name','users.email','users.phone','users.is_active','users.shop_name','users.shop_link','users.shop_start_time','users.shop_end_time','users.address','users.city','users.zip_code','users.created_at')
                    ->where('users.role_id','2')
                    ->where(function($query) use ($request){
                      if(isset($request->search) && !empty($request->search)){
                        $query->whereRaw('LOWER(name) like ?' , '%'.strtolower($request->search).'%')
                              ->orWhereRaw('LOWER(email) like ?' , '%'.strtolower($request->search).'%')
                              ->orWhereRaw('LOWER(phone) like ?' , '%'.strtolower($request->search).'%')
                              ->orWhereRaw('LOWER(address) like ?' , '%'.strtolower($request->search).'%')
                              ->orWhereRaw('LOWER(shop_name) like ?' , '%'.strtolower($request->search).'%');
                     }
                     if(isset($request->status) && !empty($request->status)){
                          if($request->status == 'active')
                               $query->where('is_active','1');
       
                           if($request->status == 'deactive')
                               $query->where('is_active','0');
                     }
                    })
                    ->whereNull('users.deleted_at')
                    ->orderBy('users.id','desc')
                    ->get();
      if($data->toarray())
              return Excel::download(new MarchantExport($data), 'marchants'.date('Y-m-d').'.xlsx');
      else 
            return back()->with('status',false)->with('message',__('Record Not found'));
    }

    public function exportMembers(Request $request){
      $data = User::leftJoin('user_bank_details','users.id','=','user_bank_details.user_id')->select('users.id','users.name','users.email','users.phone','users.is_active','users.shop_name','users.shop_link','users.shop_start_time','users.shop_end_time','users.address','users.city','users.zip_code','users.created_at','user_bank_details.account_holder_name','user_bank_details.bank_name','user_bank_details.account_number','user_bank_details.tac_code')
                    ->where('users.role_id','3')
                    ->where(function($query) use ($request){
                      if(isset($request->search) && !empty($request->search)){
                         $query->whereRaw('LOWER(name) like ?' , '%'.strtolower($request->search).'%')
                               ->orWhereRaw('LOWER(email) like ?' , '%'.strtolower($request->search).'%')
                               ->orWhereRaw('LOWER(phone) like ?' , '%'.strtolower($request->search).'%')
                               ->orWhereRaw('LOWER(address) like ?' , '%'.strtolower($request->search).'%');
                      }
                      if(isset($request->status) && !empty($request->status)){
                           if($request->status == 'active')
                                $query->where('is_active','1');
        
                            if($request->status == 'deactive')
                                $query->where('is_active','0');
                      }
                  })
                    ->whereNull('users.deleted_at')
                    ->orderBy('users.id','desc')
                    ->get();
                    if($data->toarray())
                       return Excel::download(new MemberExport($data), 'members'.date('Y-m-d').'.xlsx');
                    else
                       return back()->with('status',false)->with('message',__('Record Not found'));
    }

    public function exportProducts(Request $request){
      $data = Product::join('users','products.marchant_id','=','users.id')->select('products.*','users.id','users.name','users.email','users.phone','users.is_active','users.shop_name','users.shop_link','users.shop_start_time','users.shop_end_time','users.address','users.city','users.zip_code','users.created_at')
                      ->whereNull('products.deleted_at')
                      ->where(function($query) use ($request){
                        if(isset($request->search) && !empty($request->search)){
                           $query->whereRaw('LOWER(title) like ?' , '%'.strtolower($request->search).'%');
                          }
                          if($request->marchant){
                            $query->where('marchant_id',$request->marchant);
                          }
                        })
                      ->orderBy('users.id','desc')
                      ->get();
      if($data->toarray())
         return Excel::download(new ProductExport($data), 'products'.date('Y-m-d').'.xlsx');
      else
         return back()->with('status',false)->with('message','Record Not found');
    }

    public function profile(Request $request){
       return view('backend.profile');
    }

    public function updateProfile(Request $request){
      $input = $request->all();
      $id = auth::id();
      $rules = [
          'name'   => 'required',
          'email'  => 'required|string|email|max:255|unique:users,email,'.$id.',id,deleted_at,NULL',
          'phone'  => 'required|string|unique:users,phone,'.$id.',id,deleted_at,NULL',
       ];
       
      $request->validate($rules);

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
 
       if($User->save())
           return redirect()->back()->with('status',true)->with('message',__('Successfully updated profile'));
         else
           return redirect()->back()->with('status',false)->with('message',__('Failed to update profile'));
   }

    public function changePassword(Request $request){

        $input    = $request->all();
        $rules = [
                  'old_password'      => 'required',
                  'new_password'      => 'min:6|required_with:confirm_password|same:confirm_password',
                  'confirm_password'  => 'required|min:6',
                 ];

        $request->validate($rules);

       if (!(Hash::check($request->old_password, auth()->user()->password))) {
            return redirect()->back()->with('status',false)->with('message',__('Your old password does not matches with the current password  , Please try again'));
       }
       elseif(strcmp($request->old_password, $request->new_password) == 0){
            return redirect()->back()->with('status',false)->with('message',__('New password cannot be same as your current password,Please choose a different new password'));
       }

        $User  = User::find(auth::id());
        $User->password = Hash::make($input['new_password']);
        if($User->update()){
          return redirect()->back()->with('status',true)->with('message',__('Successfully changed password'));
       }
          return redirect()->back()->with('status',false)->with('message',__('Failed to change passsword'));
    }

    public function marchants(Request $request)
    {
        $marchats = Marchant::where(function($query) use ($request){
              if(isset($request->search) && !empty($request->search)){
                 $query->whereRaw('LOWER(name) like ?' , '%'.strtolower($request->search).'%')
                       ->orWhereRaw('LOWER(email) like ?' , '%'.strtolower($request->search).'%')
                       ->orWhereRaw('LOWER(phone) like ?' , '%'.strtolower($request->search).'%')
                       ->orWhereRaw('LOWER(address) like ?' , '%'.strtolower($request->search).'%')
                       ->orWhereRaw('LOWER(shop_name) like ?' , '%'.strtolower($request->search).'%');
              }
              if(isset($request->status) && !empty($request->status)){
                   if($request->status == 'active')
                        $query->where('is_active','1');

                    if($request->status == 'deactive')
                        $query->where('is_active','0');
              }
          })
          ->where('role_id','2')
          ->whereNull('deleted_at')
          ->paginate('10');
        $data['marchants'] = $marchats;
        return view('backend.marchant.index',compact('data'));
    }

    public function marchantDetails($id){
        $marchat = Marchant::find($id);
        $data['marchant'] = $marchat;
        return view('backend.marchant.show',compact('data'));
    }

    public function members(Request $request)
    {
        $members = Member::where(function($query) use ($request){
              if(isset($request->search) && !empty($request->search)){
                 $query->whereRaw('LOWER(name) like ?' , '%'.strtolower($request->search).'%')
                       ->orWhereRaw('LOWER(email) like ?' , '%'.strtolower($request->search).'%')
                       ->orWhereRaw('LOWER(phone) like ?' , '%'.strtolower($request->search).'%')
                       ->orWhereRaw('LOWER(address) like ?' , '%'.strtolower($request->search).'%');
              }
              if(isset($request->status) && !empty($request->status)){
                   if($request->status == 'active')
                        $query->where('is_active','1');

                    if($request->status == 'deactive')
                        $query->where('is_active','0');
              }
          })
          ->where('role_id','3')
          ->whereNull('deleted_at')
          ->paginate('10');
        $data['members'] = $members;
        return view('backend.member.index',compact('data'));
    }

    public function memberDetails($id){
        $member = User::find($id);
        $data['member'] = $member;
        return view('backend.member.show',compact('data'));
    }

    public function deleteAccount(Request $request){
        $marchant = Marchant::find($request->id);
        $email    = $marchant->email;
        $marchant->deleted_reason = $request->reason;
        $marchant->deleted_at     = date('Y-m-d H:i:s');
         if($marchant->update()){
            
            if($request->is_notify == '1'){
                $data = array(
                  'to'     => $email,
                  'due'    =>  $request->reason
                );

                \Mail::send('Mails.delete_account', $data, function ($message) use($data) {
                  $message->from( env('MAIL_FROM') , env('MAIL_FROM_NAME') );
                  $message->to($data['to'])->subject('Account Deleted');
                });
            }

            return redirect()->route('backend.marchants')->with('status',true)->with('message',__('Successfully deleted account'));
         }
         return redirect()->route('backend.marchants')->with('status',false)->with('message',__('Failed to delete account'));
    }

    public function activeAccount(Request $request){
        $marchant = Marchant::find($request->id);
        $marchant->is_active        = '1';
        $email    = $marchant->email;
         if($marchant->update()){
            
            if($request->is_notify == '1'){
                $data = array(
                  'to'     => $email
                );

                \Mail::send('Mails.active_account', $data, function ($message) use($data) {
                  $message->from( env('MAIL_FROM') , env('MAIL_FROM_NAME') );
                  $message->to($data['to'])->subject('Active Account');
                });
            }

            return redirect()->route('backend.marchants')->with('status',true)->with('message',__('Successfully actived account'));
         }
         return redirect()->route('backend.marchants')->with('status',false)->with('message',__('Failed to active account'));
    }

    public function deactiveAccount(Request $request){
        $marchant = Marchant::find($request->id);
        $email    = $marchant->email;
        $marchant->is_active        = '0';
        $marchant->deactive_reason  = $request->reason;
         if($marchant->update()){
            
            if($request->is_notify == '1'){
                $data = array(
                  'to'     => $email,
                  'due'    =>  $request->reason
                );

                \Mail::send('Mails.deactive_account', $data, function ($message) use($data) {
                  $message->from( env('MAIL_FROM') , env('MAIL_FROM_NAME') );
                  $message->to($data['to'])->subject('Deactive Account');
                });
            }

            return redirect()->route('backend.marchants')->with('status',true)->with('message',__('Successfully deactive account'));
         }
         return redirect()->route('backend.marchants')->with('status',false)->with('message',__('Failed to deactive account'));
    }

    public function products(Request $request){
        $products = Product::where(function($query) use ($request){
            if(isset($request->search) && !empty($request->search)){
               $query->whereRaw('LOWER(title) like ?' , '%'.strtolower($request->search).'%');
              }
              if($request->marchant){
                $query->where('marchant_id',$request->marchant);
              }
            })
        ->whereNull('deleted_at')
        ->paginate('10');
      $data['products'] = $products;
      $data['marchants'] = Marchant::where('role_id','2')->whereNull('deleted_at')->orderBy('name','asc')->get();
      return view('backend.product.index',compact('data'));
    }

    public function productDetails($id){
      $product = Product::find($id);
      $data['product'] = $product;
      return view('backend.product.show',compact('data'));
    }

    public function deleteProduct(Request $request){
      $product = Product::find($request->id);
      $email    = $product->marchant->email;
      $product->deleted_reason = $request->reason;
      $product->deleted_at     = date('Y-m-d H:i:s');
       if($product->update()){
          
          if($request->is_notify == '1'){
              $data = array(
                'to'     => $email,
                'id'     => $product->id,
                'title'  => $product->title,
                'due'    =>  $request->reason
              );

              \Mail::send('Mails.delete_product', $data, function ($message) use($data) {
                $message->from( env('MAIL_FROM') , env('MAIL_FROM_NAME') );
                $message->to($data['to'])->subject('Product Deleted');
              });
          }

          return redirect()->route('backend.products')->with('status',true)->with('message',__('Successfully deleted product'));
       }
       return redirect()->route('backend.products')->with('status',false)->with('message',__('Failed to delete product'));
    }

    public function planList(){
      return view('backend.plan.index');
    }
    
    public function buyPlan(Request $request){
      
      $input = $request->all();
      $input['user_id'] = auth::id();
      
      $rules = [
        'plan_id'   => 'required'
      ];
      
      $request->validate($rules);

      $isExistPlan = \DB::table('user_plans')->where(['user_id'=>$input['user_id'],'plan_id'=>$input['plan_id']])->count();

      if($isExistPlan){
          return back()->with('status',false)->with('message',__('Already actived your plan'));
      }

      $plan = \DB::table('plans')->where('is_active','1')->where('id',$input['plan_id'])->first();

      if($plan){
          $insertData = [
              'user_id' => $input['user_id'],
              'plan_id' => $input['plan_id'],
              'title'   => $plan->title,
              'price'   => $plan->price,
              'request_day'    => $plan->request_day,
              'plan_active_date' => date('Y-m-d H:i:s'),
              'plan_expiry_date' => date('Y-m-d H:i:s',strtotime(date('Y-m-d H:i:s') . '+3 months')),
              'payment_status' => '1'
          ];

          $insertId = \DB::table('user_plans')->insertGetId($insertData);

          if($insertId){
            \DB::table('users')->where('id',auth::id())->update(['is_plan_active'=>'1']);
            return redirect()->route('backend.home')->with('status',true)->with('message',__('Your plan actived'));
          }else{
            return back()->with('status',false)->with('message',__('Failed to active plan'));
          }

      }
      return back()->with('status',false)->with('message',__('This plan does not exist'));
    }

    public function config(Request $request){
        $data['config'] = Config::where(function($query) use ($request){
                if($request->key){
                        $query->where('key', 'like', '%' . $request->key . '%');
                           }
        })->orderBy('key','asc')->get();
        return view('backend.config.index',compact('data'));
     }

     public function getConfig($id){
        $data['config'] = Config::find($id);
        return view('backend.config.config',compact('data'));
     }

     public function updateConfig(Request $request,$id){
        $input = $request->all();
        $rules = array(
            'key'       => 'required',
            'value'     => 'required',
        );
        $request->validate($rules);
        $config = Config::find($id);
        $config->value = $input['value'];
        if($config->update())
            return redirect()->route('backend.index.config')->with('status',true)->with('message','Successfully updated');
        else
            return redirect()->route('backend.index.config')->with('status',false)->with('message','Failed to update config');
     }

}
