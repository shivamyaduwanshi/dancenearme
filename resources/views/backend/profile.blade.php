@extends('backend.layouts.loggedIn')

@section('title') {{__('Profile')}} | {{ \Auth::user()->name}} @endsection

@section('content')

<section class="gr-user-details">
    @include('backend.components.alert')
    <div class="shadow-wrapper">
        <div class="custom-img-txt clearfix">
            <div class="row">
                 <div class="col-md-6 ">
                     <h4>{{__('Profile Details')}}</h4>
                     <form class="form" action="{{route('backend.update.profile')}}" method="POST">
                        @csrf
                        {{ method_field('PUT') }}
                          <div class="form-group">
                              <label>{{__('Name')}}</label>
                              <input type="name" value="{{old('name') ?? \Auth::user()->name}}" name="name" placeholder="{{__('Name')}}" class="form-control"/>
                              @if ($errors->has('name'))
                              <span class="invalid-feedback text-error" role="alert">
                                 <strong>{{ $errors->first('name') }}</strong>
                              </span>
                               @endif
                            </div>
                          <div class="form-group">
                              <label>{{__('Email')}}</label>
                              <input type="email" value="{{old('email') ?? \Auth::user()->email}}" name="email" placeholder="{{__('Email')}}" class="form-control"/>
                                @if ($errors->has('email'))
                              <span class="invalid-feedback text-error" role="alert">
                                 <strong>{{ $errors->first('email') }}</strong>
                              </span>
                               @endif
                            </div>
                          <div class="form-group">
                              <label>{{__('Phone')}}</label>
                              <input type="phone" value="{{old('phone') ?? \Auth::user()->phone}}" name="phone" placeholder="{{__('Phone')}}" class="form-control"/>
                              @if ($errors->has('phone'))
                              <span class="invalid-feedback text-error" role="alert">
                                 <strong>{{ $errors->first('phone') }}</strong>
                              </span>
                              @endif
                            </div>
                          <input type="submit" class="btn btn-primary" value="{{__('Update')}}"/>
                     </form>
                 </div>
            </div>
        </div>
    </div>
</section>

<section class="gr-user-details" style="margin-top: -65px">
    <div class="shadow-wrapper">
        <div class="custom-img-txt clearfix">
            <div class="row">
                 <div class="col-md-6 ">
                     <h4>{{__('Change Password')}}</h4>
                     <form class="form" action="{{route('backend.change.password')}}" method="POST">
                        @csrf
                        {{ method_field('PUT') }}
                          <div class="form-group">
                              <label>{{__('Old Password')}}</label>
                              <input type="password" value="" name="old_password" placeholder="{{__('Old Password')}}" class="form-control"/>
                              @if ($errors->has('old_password'))
                              <span class="invalid-feedback text-error" role="alert">
                                 <strong>{{ $errors->first('old_password') }}</strong>
                              </span>
                               @endif
                            </div>
                          <div class="form-group">
                              <label>{{__('New Password')}}</label>
                              <input type="password" value="" name="new_password" placeholder="{{__('New Password')}}" class="form-control"/>
                                @if ($errors->has('new_password'))
                              <span class="invalid-feedback text-error" role="alert">
                                 <strong>{{ $errors->first('new_password') }}</strong>
                              </span>
                               @endif
                            </div>
                          <div class="form-group">
                              <label>Confirm Password</label>
                              <input type="password" value="" placeholder="{{__('Confirm password')}}" name="confirm_password" class="form-control"/>
                              @if ($errors->has('confirm_password'))
                              <span class="invalid-feedback text-error" role="alert">
                                 <strong>{{ $errors->first('confirm_password') }}</strong>
                              </span>
                              @endif
                            </div>
                          <input type="submit" class="btn btn-primary" value="{{__('Update')}}"/>
                     </form>
                 </div>
            </div>
        </div>
    </div>
</section>
@include('backend.components.backBtn')
@endsection
@push('js')
   <script>
       $('.btn-dlt').on('click',function(e){
          $('#deleteModal').modal('show');
       });
       $('.btn-deactive').on('click',function(e){
          $('#deactiveModal').modal('show');
       });
       $('.btn-active').on('click',function(e){
          $('#activeModal').modal('show');
       });
   </script>
@endpush
