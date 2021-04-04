<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
     Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
     Route::post('login', 'Auth\LoginController@login');
     Route::post('logout', 'Auth\LoginController@logout')->name('logout');
     Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
     Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
     Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
     Route::post('password/reset', 'Auth\ResetPasswordController@reset')->name('password.update');

     Route::get('/', 'HomeController@index')->name('index');
     Route::get('/coach-profile/{id}/{name}', 'HomeController@coachProfile')->name('coach-profile');
     Route::get('/dance-category', 'HomeController@danceCategory')->name('dance-category');
     Route::get('/gigs-details/{id}/{title}', 'HomeController@gigsDetails')->name('gigs-details');
     Route::get('/join', 'HomeController@join')->name('join');
     Route::get('/lesson-cost', 'HomeController@lessionCost')->name('lessons-cost');
     Route::get('/services', 'HomeController@services')->name('services');
     Route::get('/signup', 'HomeController@signup')->name('signup');
     Route::get('/signup-step2', 'HomeController@signupStep2')->name('signup-step2');
     Route::get('/signup-step3', 'HomeController@signupStep3')->name('signup-step3');
     Route::post('/teacher-signup', 'HomeController@teacherSignup')->name('teacher-signup');
     Route::get('/my-account', 'HomeController@myAccount')->name('my-account');
     Route::get('/user-profile', 'HomeController@userProfile')->name('user-profile');
     Route::post('/update/aboutUs','HomeController@aboutUsUpdate')->name('aboutUsUpdate');
     Route::post('/update/business/info/','HomeController@businessinfoupdate')->name('businessinfoupdate');

     Route::get('/user/signup','HomeController@userSignup')->name('userSignup');
     Route::post('/user/signup/store','HomeController@userSignupStore')->name('userSignupStore');
     Route::post('/update/password','HomeController@updatepassword')->name('updatepassword');
     Route::post('/update/profile','HomeController@updateProfile')->name('updateProfile');
     Route::post('/upload/profile/image','HomeController@uploadProfileImage')->name('uploadProfileImage');
     Route::post('/upload/portfolio','HomeController@portfolio')->name('portfolio');
     Route::delete('/remove/portfolio','HomeController@removePortfolio')->name('removePortfolio');

     Route::post('/add/social/link','HomeController@addSocialLink')->name('add.social.link');
     Route::delete('/remove/social/link','HomeController@removeSocialLink')->name('remove.social.link');
     Route::post('/add/faq','HomeController@addFaq')->name('addFaq');
     Route::delete('/remove/faq','HomeController@removeFaq')->name('removeFaq');

     Route::post('/give/rating','HomeController@giveRating')->name('give.rating');

     Route::get('/dancers','HomeController@dancers')->name('dancers');

     Route::post('/add/gigs','HomeController@addGigs')->name('add.gigs');
     Route::post('/update/gigs','HomeController@updateGigs')->name('update.gigs');
     Route::delete('/delete/gigs','HomeController@deleteGigs')->name('delete.gigs');
     Route::get('/get/gig','HomeController@getGig')->name('get.gig');

     Route::post('/do/request','HomeController@doRequest')->name('doRequest');

     Route::get('/page/{page}','HomeController@page')->name('page');

     Route::get('/contact-us','HomeController@contactUs')->name('contactUs');
     Route::post('/send/mail','HomeController@sendMail')->name('sendMail');

     Route::post('/add/dance','HomeController@addDance')->name('addDance');
     Route::post('/remove/dance','HomeController@removeDance')->name('removeDance');

     Route::post('/add/service','HomeController@addService')->name('addService');
     Route::post('/remove/service','HomeController@removeService')->name('removeService');

     Route::get('/buy/credit/points','HomeController@buyCreditPoints')->name('buyCreditPoints');
     Route::post('/checkout','HomeController@checkout')->name('checkout');
     Route::get('/payment/success','HomeController@paymentSuccess')->name('paymentSuccess');
     Route::get('/payment/failed','HomeController@paymentFailed')->name('paymentFailed');
     Route::get('/success','HomeController@success')->name('success');
     Route::get('/failed','HomeController@failed')->name('failed');

     Route::post('/cance/job','HomeController@cancelJob')->name('cancelJob');
     Route::post('/accept/job','HomeController@acceptJob')->name('acceptJob');
     Route::post('/complete/job','HomeController@completeJob')->name('completeJob');

     Route::post('/paywith/card','HomeController@paywithCard')->name('paywithCard');



?>
