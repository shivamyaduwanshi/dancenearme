@extends('backend.layouts.loggedIn')

@section('title') {{__('Update Service')}} - {{$service->title}} @endsection

@section('content')

<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header">{{__('Update Service')}} <button class="btn btn-danger btn-dlt">{{__('Delete')}}</button></h3>
    </div>
</div>
<br/>
        <div class="row">
            <div class="col-md-6 col-offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <form class="form" action="{{route('backend.update.service',$service->id)}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            {{ method_field('PUT') }}
                            <div class="form-group">
                                <input type="text" class="form-control" name="title" value="{{$service->title}}" placeholder="{{__('Title')}}" required/>
                                @error('title')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Description" name="description">{{old('description') ?? $service->description }}</textarea>
                                @error('description')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                            <div class="img-preview">
                               <img class="image-preview" src="{{$service->image}}" width="100%" height="200px"/>
                            </div>
                            <br/>
                            <div class="form-group">
                                <input type="file" class="form-control" name="image" accept="image/*" placeholder="{{__('Service Image')}}"/>
                                @error('image')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>
                                    <input type="checkbox" name="is_active" value="1" @if($service->is_active) checked @endif/> {{__('Active')}}
                                </label>
                            </div>
                            <input type="submit" value="{{__('Update')}}" class="btn btn-primary float-right"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>

         <!-- Modal -->
 <div class="modal fade" id="deleteModal" role="dialog">
    <div class="modal-dialog modal-md">
        <form class="form" action="{{route('backend.delete.service')}}" method="POST">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">{{__('Delete Service')}}</h4>
        </div>
        <div class="modal-body">
                @csrf
                {{ method_field('DELETE') }}
                 <input type="hidden" name="id" value="{{$service->id}}">
                 <p>{{__('Are you sure want to delete service?')}}</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">{{__('Cancel')}}</button>
          <input type="submit" class="btn btn-danger" value="{{__('Delete')}}" />
        </div>
      </div>
    </form>
    </div>
  </div>
</div>

@include('backend.components.backBtn')
@endsection
@push('js')
 <script>
        //Image Preview
        $('input[name="image"]').on('change',function(e){
            tmppath = URL.createObjectURL(event.target.files[0]);
            $('.image-preview').attr('src',tmppath);
        });
        $('.btn-dlt').on('click',function(e){
            e.preventDefault();
            $('#deleteModal').modal('show');
        });
 </script>
@endpush