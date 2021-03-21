@extends('backend.layouts.loggedIn')

@section('title') {{__('Add Dancer')}} @endsection

@section('content')

<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header"> {{__('Add Dancer')}}</h3>
    </div>
</div>
<br/>
        <div class="row">
            <div class="col-md-6 col-offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <form class="form" action="{{route('backend.store.vendor')}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="img-preview">
                                <img class="image-preview" src="{{asset('public/images/system/peguitas.png')}}" width="100%" height="200px"/>
                             </div>
                             <br/>
                            <div class="form-group">
                                <input type="file" class="form-control" name="profile_image" accept="image/*" placeholder="{{__('Profile Image')}}" />
                                @error('profile_image')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <input type="name" class="form-control" name="name" value="{{old('name')}}" placeholder="{{__('Name')}}" />
                                @error('name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" name="email" value="{{old('email')}}" placeholder="{{__('Email')}}" />
                                @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <input type="phone" class="form-control" name="phone" value="{{old('phone')}}" placeholder="{{__('Phone')}}" />
                                @error('phone')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                            <div class="row">
                              <div class="col-md-8">
                                <input type="text" class="form-control" name="password" value="{{old('password')}}" placeholder="{{__('Password')}}" />
                                @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                              </div>
                              <div class="col-md-4">
                                <button class="btn btn-primary" id="generatePassword">{{__('Generate Passowrd')}}</button>
                              </div>
                            </div>
                            <div class="form-group">
                            </div>
                            <div class="form-group">
                                <label>
                                    <input type="checkbox" name="is_active" value="1" checked/> {{__('Active')}}
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    <input type="checkbox" name="is_notify" value="1" checked/> {{__('Notify to vendor')}}
                                </label>
                            </div>
                            <input type="submit" value="Create" class="btn btn-primary float-right"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
@include('components.backBtn')
@endsection
@push('css')
 <style>
   .img-preview{
    width: 100px;
    height: 100px;
    overflow: hidden;
    border: 2px solid gray;
   }
   .img-preview img{
    width: 100px;
    height: 100px;
    overflow: hidden;
    border: 2px solid gray;
   }
 </style>
@endpush
@push('js')
 <script>
        //Image Preview
        $('input[name="profile_image"]').on('change',function(e){
            tmppath = URL.createObjectURL(event.target.files[0]);
            $('.image-preview').attr('src',tmppath);
        });

    function generatePassword() {
        var length = 8,
            charset = "0123456789",
            retVal = "";
        for (var i = 0, n = charset.length; i < length; ++i) {
            retVal += charset.charAt(Math.floor(Math.random() * n));
        }
        $('input[name="password"]').val(retVal);
    }

    $('#generatePassword').on('click',function(e){
        e.preventDefault();
        generatePassword();
    });

 </script>
@endpush