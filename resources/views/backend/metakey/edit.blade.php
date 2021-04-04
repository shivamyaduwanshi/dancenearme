@extends('backend.layouts.loggedIn')

@section('title') {{ __('Update Meta') }} | {{ $metakey->key }}  @endsection

@section('content')

<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header">{{ __('Update Meta') }} | {{ $metakey->key }}</h3>
    </div>
</div>
<br/>
        <div class="row">
            <div class="col-md-6 col-offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <form class="form" action="{{route('backend.update.metakey',$metakey->id)}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="form-group">
                                <input type="text" class="form-control" name="key" placeholder="{{__('Key')}}" value="{{ old('key') ?? $metakey->key }}" required/>
                                @error('key')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="content" placeholder="content">{{old('value') ?? $metakey->value }}</textarea>
                                @error('value')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                            <input type="submit" value="{{__('Update')}}" class="btn btn-primary float-right"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
@endsection