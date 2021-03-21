<!DOCTYPE html>
<html>
<head>
	<title>Reset Password Email</title>
</head>
<body>
	<div id="wrapper" dir="ltr" style="background-color: #ffffff; padding: 70px 0 70px 0; width: 100%; padding-top: 0px; padding-bottom: 0px; -webkit-text-size-adjust: none; margin: 0 auto;">
	   <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
	      <tbody>
	         <tr>
	            <td align="center" valign="top">
	               <table border="0" cellpadding="0" cellspacing="0" width="600" id="template_container" style="background-color: #fff; overflow: hidden; border-style: solid; max-width: 660px; border-top-width: 5px; border-bottom-width: 5px; border-color: #35536c; border-radius: 0px; border-right: 0px solid #ffffff; border-left: 0px solid #ffffff; box-shadow: 0 1px 20px 5px rgba(0,0,0,0.1); width: 100%; min-width: 320px;">
	                  <tbody>
	                     <tr>
	                        <td align="center" valign="top">
	                           <div id="template_header_image_container" style="">
	                              <div id="template_header_image" style="max-width: 700px; width: 100%; min-width: 320px;">
	                                 <table border="0" cellpadding="0" cellspacing="0" width="100%" id="template_header_image_table">
	                                    <tbody>
	                                       <tr>
	                                          <td align="center" valign="middle" style="text-align: center; padding-top: 5px; padding-bottom:5px;border-bottom: 1px solid #ddd;">
	                                             <p style="margin-bottom: 0; margin-top: 0;"><a href="{{url('/')}}"><img src="{{asset('images/system/logo.png')}}" alt="{{env('APP_NAME')}}" width="170" style="border: none; display: inline; font-weight: bold; height: auto; outline: none; text-decoration: none; text-transform: capitalize; font-size: 14px; line-height: 25px; width: 100%; max-width: 80px;"></a></p>
	                                          </td>
	                                       </tr>
	                                    </tbody>
	                                 </table>
	                              </div>
	                           </div>
	                        </td>
	                     </tr>
	                     <tr>
	                        <td align="center" valign="top">
	                           <!-- Body -->
	                           <table border="0" cellpadding="0" cellspacing="0" width="600" id="template_body" style="max-width: 700px; width: 100%; min-width: 320px;">
	                              <tbody>
	                                 <tr>
	                                    <td valign="top" id="body_content" style="background-color: #ffffff; padding-top: 20px; padding-bottom: 15px;">
	                                       <!-- Content -->
	                                       <table border="0" cellpadding="20" cellspacing="0" width="100%" border="0">
	                                          <tbody>
	                                             <tr>
	                                                <td valign="top" style="padding: 0px 48px 0; padding-left: 20px; padding-right: 20px;">
	                                                   <div id="body_content_inner" style="color: #3d3d3d; text-align: left; font-size: 14px; line-height: 25px; font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Grande&quot;, sans-serif; font-weight: 400;">
	                                                      <p style="margin: 0;">Hello,&nbsp;<span style="color: #35536c; font-weight: 600;" >{{$to}}</span></p>
	                                                      <p style="margin: 0; padding: 15px 0">Someone has requested a link to change your password. You can do this through the button below.</p>
	                                                      <div style="clear: both; height: 1px;"></div>
	                                                    </div>  
	                                                    <div id="body_content_inner" style="color: #3d3d3d; text-align: left; font-size: 14px; line-height: 25px; font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Grande&quot;, sans-serif; font-weight: 400;text-align: center;">
	                                                     	<a href="{{$link}}" style="font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box;   border-radius: 3px; color: #fff; display: inline-block; text-decoration: none;   background-color: #35536c; border-top: 10px solid #35536c; border-right: 25px solid #35536c;border-bottom: 10px solid #35536c;border-left: 25px solid #35536c; font-size: 15px;">Reset Password</a>
	                                                      <div style="clear: both; height: 20px;"></div>
	                                                      
	                                                   </div>
	                                                   <div id="body_content_inner" style="color: #3d3d3d; text-align: left; font-size: 14px; line-height: 25px; font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Grande&quot;, sans-serif; font-weight: 400;">
	                                                      <p style="margin: 0; padding: 15px 0">If you didn't request this, please ignore this email. Your password will stay safe and won't be changed.</p>
	                                                      <div style="clear: both; height: 1px;"></div>
	                                                    </div> 

	                                                    <div id="body_content_inner" style="color: #3d3d3d; text-align: left; font-size: 14px; line-height: 25px; font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Grande&quot;, sans-serif; font-weight: 400;">
	                                                      <p style="margin: 0; padding: 15px 0">
	                                                      	Regards,<br>
                                                          {{ env('APP_NAME') }} Team, <br>
                                                          <span style="    color: #35536c; font-weight: 600;" >{{env('SUPPORT_MAIL')}}</span>
	                                                      </p>
	                                                      <div style="clear: both; height: 1px;"></div>
	                                                    </div> 
	                                                </td>
	                                             </tr>
	                                          </tbody>
	                                       </table>
	                                       <!-- End Content -->
	                                    </td>
	                                 </tr>
	                              </tbody>
	                           </table>
	                           <!-- End Body -->
	                        </td>
	                     </tr>
	                  </tbody>
	               </table>
	               <!-- End template container -->
	            </td>
	         </tr>
	      </tbody>
	   </table>
	</div>
</body>
</html>