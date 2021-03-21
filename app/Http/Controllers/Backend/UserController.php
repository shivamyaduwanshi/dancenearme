<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Exports\UserExport;
use App\User;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $users = User::where(function($query) use ($request){
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
      $data['users'] = $users;
      return view('backend.user.index',compact('data'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);
        $data['user'] = $user;
        return view('backend.user.show',compact('data'));
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

            return redirect()->route('backend.index.user')->with('status',true)->with('message',__('Successfully deleted account'));
         }
         return redirect()->route('backend.index.user')->with('status',false)->with('message',__('Failed to delete account'));
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

            return redirect()->route('backend.index.user')->with('status',true)->with('message',__('Successfully actived account'));
         }
         return redirect()->route('backend.index.user')->with('status',false)->with('message',__('Failed to active account'));
    }

    public function deactiveAccount(Request $request){
      $user = User::find($request->id);
      $email    = $user->email;
      $user->is_active        = '0';
      $user->deactive_reason  = $request->reason;
       if($user->update()){
          
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

          return redirect()->route('backend.index.user')->with('status',true)->with('message',__('Successfully deactive account'));
       }
       return redirect()->route('backend.index.user')->with('status',false)->with('message',__('Failed to deactive account'));
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
                return Excel::download(new UserExport($data), 'users'.date('Y-m-d').'.xlsx');
        else 
              return back()->with('status',false)->with('message',__('Record Not found'));
      }
}
