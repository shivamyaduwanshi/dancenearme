<?php

/**
 * Authentication Routes;
 */
Route::name('backend.')->group(function () {
    Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
    Route::post('login', 'Auth\LoginController@login');
    Route::post('logout', 'Auth\LoginController@logout')->name('logout');
    Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
    Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
    Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
    Route::post('password/reset', 'Auth\ResetPasswordController@reset')->name('password.update');
    Route::get('api/reset/password/success',function(){ return view('api.forgot_password_success_response'); })->name('api.rest.password.success');
    Route::get('/', 'HomeController@index')->name('home');
    Route::get('/home', 'HomeController@index')->name('home');
    Route::get('/profile', 'HomeController@profile')->name('profile');
    Route::put('/update/profile', 'HomeController@updateProfile')->name('update.profile');
    Route::put('/change/password', 'HomeController@changePassword')->name('change.password');
    Route::get('/members', 'HomeController@members')->name('members');
    Route::get('/member/details/{id}', 'HomeController@memberDetails')->name('member.details');
    Route::get('members/export/', 'HomeController@exportMembers')->name('export.members');
    Route::delete('/delete/account', 'HomeController@deleteAccount')->name('delete.account');
    Route::put('/active/account', 'HomeController@activeAccount')->name('active.account');
    Route::put('/deactive/account', 'HomeController@deactiveAccount')->name('deactive.account');
    /**
     *  Banner Route's
     */
    Route::get('banners', 'BannerController@index')->name('index.banner');
    Route::get('create/banner', 'BannerController@create')->name('create.banner');
    Route::post('store/banner', 'BannerController@store')->name('store.banner');
    Route::get('show/banner/{id}', 'BannerController@show')->name('show.banner');
    Route::put('update/banner/{id}', 'BannerController@update')->name('update.banner');
    Route::delete('delete/banner', 'BannerController@destroy')->name('delete.banner');

    /**
     * Category Route's
     */
    Route::get('dances', 'CategoryController@index')->name('index.category');
    Route::get('add/dance', 'CategoryController@create')->name('create.category');
    Route::post('store/dance', 'CategoryController@store')->name('store.category');
    Route::get('show/dance/{id}', 'CategoryController@show')->name('show.category');
    Route::put('update/dance/{id}', 'CategoryController@update')->name('update.category');
    Route::delete('delete/dance', 'CategoryController@destroy')->name('delete.category');

    /**
     * Service Route's
     */
    Route::get('services', 'ServiceController@index')->name('index.service');
    Route::get('add/service', 'ServiceController@create')->name('create.service');
    Route::post('store/service', 'ServiceController@store')->name('store.service');
    Route::get('show/service/{id}', 'ServiceController@show')->name('show.service');
    Route::put('update/service/{id}', 'ServiceController@update')->name('update.service');
    Route::delete('delete/service', 'ServiceController@destroy')->name('delete.service');

    /**
     * Dancer Route's
     */
    Route::get('dancers', 'VendorController@index')->name('index.vendor');
    Route::get('create/dancer', 'VendorController@create')->name('create.vendor');
    Route::post('store/dancer', 'VendorController@store')->name('store.vendor');
    Route::get('show/dancer/{id}', 'VendorController@show')->name('show.vendor');
    Route::put('update/dancer/{id}', 'VendorController@update')->name('update.vendor');
    Route::get('export/dancer', 'VendorController@export')->name('export.vendor');
    Route::put('active/dancer', 'VendorController@activeAccount')->name('active.vendor');
    Route::delete('delete/dancer', 'VendorController@destroy')->name('delete.vendor');
    Route::put('/deactive/dancer', 'VendorController@deactiveAccount')->name('deactive.vendor');
    /**
     * User Route's
     */
    Route::get('users', 'UserController@index')->name('index.user');
    Route::get('show/user/{id}', 'UserController@show')->name('show.user');
    Route::put('update/user/{id}', 'UserController@update')->name('update.user');
    Route::get('export/user', 'UserController@export')->name('export.user');
    Route::put('active/user', 'UserController@activeAccount')->name('active.user');
    Route::delete('delete/user', 'UserController@destroy')->name('delete.user');
    Route::put('/deactive/user', 'UserController@deactiveAccount')->name('deactive.user');

    Route::get('config','HomeController@config')->name('index.config');
    Route::get('show/config/{id}','HomeController@getConfig')->name('show.config');
    Route::put('update/config/{id}','HomeController@updateConfig')->name('update.config');
});