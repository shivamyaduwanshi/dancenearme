<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Codemeg.com">
        <meta name="author" content="Codemeg.com">
        <link rel="shortcut icon" type="image/jpg" href="{{asset('public/favicon/favicon.ico')}}"/>

        <title>@yield('title')</title>

        <!-- Bootstrap Core CSS -->
        <link href="{{asset('public/')}}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="{{asset('public/')}}/css/startmin.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="{{asset('public/')}}/css/style.css" rel="stylesheet">
        
        <!-- Custom Fonts -->
        <link href="{{asset('public/')}}/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        @stack('css')


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top shadow-sm" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="{{route('backend.home')}}">{{ env('APP_NAME')}}</a>
                </div>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <ul class="nav navbar-right navbar-top-links">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> {{ \Auth::user()->name}} <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="{{ route('backend.profile') }}"><i class="fa fa-user fa-fw"></i>{{__('User Profile')}}</a>
                            </li>
                            </li>
                            <li class="divider"></li>
                            <li>
                               <a class="dropdown-item" href="{{ route('backend.logout') }}"
                                onclick="event.preventDefault();
                                              document.getElementById('logout-form').submit();">
                                 {{ __('Logout') }}
                             </a>

                             <form id="logout-form" action="{{ route('backend.logout') }}" method="POST" style="display: none;">
                                 @csrf
                             </form>
                            </li>
                        </ul>
                    </li>
                </ul>

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="{{route('backend.home')}}" class="active"><i class="fa fa-dashboard fa-fw"></i> {{__('Dashboard')}}</a>
                            </li>
                            <li>
                                <a href="{{route('backend.index.vendor')}}"><i class="fa fa-users"></i> {{__('Dancers')}}</a>
                            </li>
                            <li>
                                <a href="{{route('backend.index.user')}}"><i class="fa fa-users"></i> {{__('Users')}}</a>
                            </li>
                            <li>
                                <a href="{{route('backend.index.category')}}"><i class="fa fa-stack-overflow"></i> {{__('Dances')}} </a>
                            </li>
                            <li>
                                <a href="{{route('backend.index.service')}}"><i class="fa fa-stack-overflow"></i> {{__('Services')}} </a>
                            </li>
                            <li>
                                <a href="{{route('backend.index.metakey')}}"><i class="fa fa-cog"></i> {{__('Meta Key')}} </a>
                            </li>
                            <li>
                                <a href="{{route('backend.index.config')}}"><i class="fa fa-cog"></i> {{__('Config')}} </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div id="page-wrapper">
                <div class="container-fluid">
                    @section('content')@show
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="{{asset('public/')}}/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="{{asset('public/')}}/js/bootstrap.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="{{asset('public/')}}/js/startmin.js"></script>

        @stack('js')

    </body>
</html>
