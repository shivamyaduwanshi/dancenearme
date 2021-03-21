@extends('backend.layouts.loggedIn')

@section('title') {{ __('Add Dance')}} @endsection

@section('content')

<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header">{{__('Config')}}</h3>
    </div>
</div>

@section('content')
				<div class="main-body">
           @include('backend.components.alert')
					<div class="inner-body">
						<!--header-->
						<div class="header">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="title">
										<!-- <h2>My Tenders</h2> -->
										<p class="navigation">
											<a href="{{route('backend.index.config')}}">Config</a>
											<a href="#">{{$data['config']->key}}</a>
										</p>
									</div>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-12">
								</div>
							</div>
						</div><!--END header-->

						<!--supplier-details-->
						<div class="supplier-profile-details Myuser-details">
							<form action="{{route('backend.update.config',$data['config']->id)}}" method="post" enctype="multipart/form-data">
								@csrf
								{{ method_field('PUT')}}
								<div class="row">
									<!--supplier profile-->
									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="profile-details">
											<div class="input-details">
												<div class="form-group">
													<input class="form-control" type="text" placeholder="Name" name="key" value="{{old('key') ?? $data['config']->key}}" required readonly>
												</div>
											</div>
												<div class="input-details">
													<div class="form-group">
														@if($data['config']->type == 'html')
														<textarea rows="50" class="form-control" placeholder="html..." name="value" required>{{old('value') ?? $data['config']->value}}</textarea>
														@else
														<input class="form-control" type="text" placeholder="Name" name="value" value="{{old('value') ?? $data['config']->value}}" required>
														@endif
													</div>
												</div>
											<button class="btn-theme btn btn-primary">Update</button>
										</div>
									</div><!--END supplier profile-->
								</div>
							</form>
						</div><!--END supplier-details-->
					</div>
				</div>
@endsection
@push('css')
@endpush
@push('js')
 <script src="https://cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
 <script type="text/javascript">
 	   //Image Preview
      $('input[type="file"]').on('change',function(event){
      // event.preventDefault();
       tmppath = URL.createObjectURL(event.target.files[0]);
      });

      @if($data['config']->type == 'html')
        CKEDITOR.replace( 'value' );
      @endif

	  $(document).ready(function() {
          $('select[name="users[]"]').select2();
          @if(!Auth::user()->can('update',App\Models\Config::class))
             $('input,select,textarea').attr('disabled','disabled');
          @endif
      });

 </script>
@endpush

