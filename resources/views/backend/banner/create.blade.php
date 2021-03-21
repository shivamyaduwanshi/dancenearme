@extends('backend.layouts.loggedIn')

@section('title') {{ __('Create Banner') }} @endsection

@section('content')

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">{{ __('Create Banner') }}</h1>
    </div>
</div>
<br/>
        <div class="row">
            <div class="col-md-6 col-offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <form class="form" action="{{route('backend.store.banner')}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">
                                <input type="text" class="form-control" name="title" placeholder="{{__('Title')}}" required/>
                                @error('title')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                            <div class="img-preview">
                                <img class="image-preview" src="{{asset('public/images/system/logo.png')}}" width="100%" height="200px"/>
                             </div>
                             <br/>
                            <div class="form-group">
                                <input type="file" class="form-control" name="banner_image" accept="image/*" placeholder="{{__('Banner Image')}}" required/>
                                @error('banner_image')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>
                                    <input type="checkbox" name="is_active" value="1" checked/> {{__('Active')}}
                                </label>
                            </div>
                            <input type="submit" value="{{__('Create')}}" class="btn btn-primary float-right"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
@include('components.backBtn')
@endsection
@push('js')
 <script>
        //Image Preview
        $('input[name="banner_image"]').on('change',function(e){
            tmppath = URL.createObjectURL(event.target.files[0]);
            $('.image-preview').attr('src',tmppath);
        });
 </script>
@endpush