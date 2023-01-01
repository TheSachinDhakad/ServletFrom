<%-- 
    Document   : singup
    Created on : Jan 1, 2023, 10:42:24 AM
    Author     : Sachin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    </head>
    <body style="background: url(img/bg1.avif); background-size: cover; background-attachment: fixed;">
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card">
                        <div class="card-content">
                            <h3 style="margin-top:10px; " class="center-align">Register here</h3>
                            <h5 id="msg" class="center-align"></h5>
                            <div class="form center-align">
                                <form action="Register" method="post" id="myform">


                                    <input type="text" name="user_name" placeholder="Enter your name ">
                                    <input type="password" name="user_password" placeholder="Enter your password ">
                                    <input type="email" name="user_email" placeholder="Enter your email ">

                                    <button class="btn  light-blue darken-4" type="submit">Submit</button>
                                </form>



                            </div>
                            <div class="loader center-align" style="margin-top: 10px; display: none;">
                                <div class="preloader-wrapper small active">
                                    <div class="spinner-layer spinner-green-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                <h5>please wait...</h5>

                            </div>



                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script
            src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
            crossorigin="anonymous">

        </script>

        <script >
            $(document).ready(function () {
                console.log("page is ready.");

                $("#myform").on('submit', function (event) {
                    event.preventDefault();
                    var f = $(this).serialize();

                    console.log(f);
                    $(".loader").show();
                    $(".form").hide();


                    $.ajax({
                        url: "Register",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("success.......");
                            $(".loader").hide();
                            $(".form").show();
                            
                            if(data.trim()==="done"){
                                $('#msg').html("Successfully Registered...");
                            }
                            else{
                                $('#msg').html("somethin want wrong ");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            onsole.log(data);
                            console.log("errorr.......");
                            $(".loader").hide();
                            $(".form").show();
                            $('#msg').html("somethin want wrong ");
                        }


                    })
                })
            })

        </script>
    </body>
</html>
