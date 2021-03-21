<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Exports\VendorExport;
use App\User;

class VendorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $vendors = User::where(function($query) use ($request){
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
        ->where('role_id','2')
        ->whereNull('deleted_at')
        ->orderBy('id','desc')
        ->paginate('10');
      $data['vendors'] = $vendors;
      return view('backend.vendor.index',compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.vendor.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
         $input = $request->all();

         $rules = [
          'name'     => 'required',
          'email'    => 'required|string|email|max:255|unique:users,email,null,id,deleted_at,NULL',
          'phone'    => 'required|string|unique:users,phone,null,id,deleted_at,NULL',
          'password' => 'required'
         ];

         $request->validate($rules);

         $insertData = [
           'name'  => $input['name'],
           'email' => $input['email'],
           'phone' => $input['phone'],
           'password' => \Hash::make($input['password']),
           'role_id'  => '2',
           'login_type' => 'web'
         ];

         $fileName = null;
       if ($request->hasFile('profile_image')) {
          $fileName = str_random('10').'.'.time().'.'.request()->profile_image->getClientOriginalExtension();
          request()->profile_image->move(public_path('images/profile/'), $fileName);
        }

        if($fileName)
            $insertData['profile_image'] = $fileName;

         $insertGetId = User::insertGetId($insertData);
         
         if($insertGetId){
          
            if($request->is_notify == '1'){
              $data = array(
                'to'       => $input['email'],
                'name'     => $input['name'],
                'password' => $input['password']
              );

              \Mail::send('Mails.registered_vendor', $data, function ($message) use($data) {
                $message->from( env('MAIL_FROM') , env('MAIL_FROM_NAME') );
                $message->to($data['to'])->subject('Registered Successfully');
              });
          }

           return redirect()->route('backend.index.vendor')->with('status',true)->with('message',__('Successfully added vendor'));
         }
         else{
           return redirect()->route('backend.index.vendor')->with('status',false)->with('message',__('Failed to add vendor'));
        }
           

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $vendor = User::find($id);
        $data['vendor'] = $vendor;
        return view('backend.vendor.show',compact('data'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $user = User::find($request->id);
        $email    = $user->email;
        $user->deleted_reason = $request->reason;
        $user->deleted_at     = date('Y-m-d H:i:s');
         if($user->update()){
            
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

            return redirect()->route('backend.index.vendor')->with('status',true)->with('message',__('Successfully deleted account'));
         }
         return redirect()->route('backend.index.vendor')->with('status',false)->with('message',__('Failed to delete account'));
    }

    public function activeAccount(Request $request){
        $user = User::find($request->id);
        $user->is_active        = '1';
        $email    = $user->email;
         if($user->update()){
            
            if($request->is_notify == '1'){
                $data = array(
                  'to'     => $email
                );

                \Mail::send('Mails.active_account', $data, function ($message) use($data) {
                  $message->from( env('MAIL_FROM') , env('MAIL_FROM_NAME') );
                  $message->to($data['to'])->subject('Active Account');
                });
            }

            return redirect()->route('backend.index.vendor')->with('status',true)->with('message',__('Successfully actived account'));
         }
         return redirect()->route('backend.index.vendor')->with('status',false)->with('message',__('Failed to active account'));
    }

    public function deactiveAccount(Request $request){
      $vendor = User::find($request->id);
      $email    = $vendor->email;
      $vendor->is_active        = '0';
      $vendor->deactive_reason  = $request->reason;
       if($vendor->update()){
          
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

          return redirect()->route('backend.index.vendor')->with('status',true)->with('message',__('Successfully deactive account'));
       }
       return redirect()->route('backend.index.vendor')->with('status',false)->with('message',__('Failed to deactive account'));
  }

    public function export(Request $request){
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
                return Excel::download(new VendorExport($data), 'vendors'.date('Y-m-d').'.xlsx');
        else 
              return back()->with('status',false)->with('message',__('Record Not found'));
      }
}
