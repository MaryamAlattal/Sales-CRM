<!DOCTYPE html>
<html lang="en">

<?php
 include ("links.php");
?>
<style type="text/css">
    a{
        text-decoration: none  !important;
    }
      a:linked{
        text-decoration: none  !important;
    }

</style>
<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="text-gray-900 mb-4">Welcome to SALES-CRM!</h1>
                                    </div>
                                        <hr>

                                        <a href="../Sales_CRM/staff"> <button  class="btn btn-success btn-user btn-block">
                                            Login As Staff
                                        </button> </a>
                                        <br><br><br>


                                        <a href="../Sales_CRM/Customer">   <button  class="btn btn-primary btn-user btn-block">
                                            Login As Customer
                                        </button> </a>
                                    <hr>

                                </div>
                            </div>
                        </div>
                    </div>


                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
