<?php
// error_reporting(E_WARNING);
 include("../connection.php");
//  $conn= connect();

function show_products(){
     //include ("connection.php");
    echo "-----------";
    $con = connect();

    $query = "SELECT distinct title,product_id FROM `product`";
    $result = mysqli_query($con,$query);

    return $result;
}
function show_category(){
    // include ("../connection.php");
    // $dbobj = new DbConnection();

    // $conn = $dbobj->mysqlconnect();
    // echo "-----------";
       $conn = connect();
    $query = "SELECT distinct categories_name,categories_id FROM `categories`";
    $result = mysqli_query($conn,$query);
    // print_r($result);
    return $result;
}
function showallproducts(){
    $conn = connect();
    // echo "-----------";
    $query = "SELECT * FROM `product` where deleted = 0";
    $result = mysqli_query($conn,$query);

    return $result;
}
function showallcustomers(){
    $conn = connect();
    // echo "-----------";
    $query = "SELECT * FROM `customer` where deleted = 0 ";
    $result = mysqli_query($conn,$query);

    return $result;
}
//to get one product record by product_id
function show_single_product($proid){

   $conn = connect();
   $pname = "";
   // echo "-----------";
   $query = "SELECT * FROM `product` where product_id = ".$proid;
   $result = mysqli_query($conn,$query);
   while($row = mysqli_fetch_assoc($result)){
      $pname = $row ['title'];
   }

   return $pname;
}
function show_employees(){
    // include ("connection.php");
    $conn = connect();
    // echo "-----------";
    $query = "SELECT name,staff_id FROM `staff`";
    $result = mysqli_query($conn,$query);

    return $result;
}
// $res = show_category();
// echo mysqli_num_rows($res);
// if (mysqli_num_rows($res) > 0) {
//     // output data of each row
//     while($row = mysqli_fetch_assoc($res)) {
//       echo $row["categories_name"];
//     }
//   } else {
//     echo "0";
//   }

function showlast10leads(){
   // include ("connection.php");
   $conn = connect();
    $query = "SELECT * FROM leads_tab where deleted = 0 ORDER BY updated_date DESC LIMIT 10 ;";
    $result = mysqli_query($conn,$query);
    return $result;
}
function showticketbyuser($cid){
    $conn = connect();
    $query = "SELECT * FROM tickets where customer_id = ".$cid." ORDER BY date DESC LIMIT 10 ;";
   // echo $query;
    $result = mysqli_query($conn,$query);
    return $result;
}
function showproductsfromtickets($cid){
  $conn = connect();
    $query = "SELECT p.title, p.price, p.image FROM product p inner join tickets t on p.product_id = t.product_id where customer_id = ".$cid." ORDER BY date DESC LIMIT 10;";
   // echo $query;
    $result = mysqli_query($conn,$query);
    return $result;
}
function showpendingtickets(){
    $conn = connect();
    $query = "SELECT * FROM tickets where Status = 0 ORDER BY date DESC LIMIT 10 ;";
   // echo $query;
    $result = mysqli_query($conn,$query);
    return $result;
}
function showresolvedtickets(){
    $conn = connect();
    $query = "SELECT * FROM tickets where Status = 2 ORDER BY date DESC LIMIT 10 ;";
   // echo $query;
    $result = mysqli_query($conn,$query);
    return $result;
}
function showinprogresstickets(){
    $conn = connect();
    $query = "SELECT * FROM tickets where Status = 1 ORDER BY date DESC LIMIT 10 ;";
   // echo $query;
    $result = mysqli_query($conn,$query);
    return $result;
}
function addleadtodb(){

$conn =Connect();
$name = $_POST['FirstName'].' '.$_POST['LastName'];
$email = $_POST['Email'];
$area = $_POST['Area'];
$contact_number = $_POST['ContactNumber'];
$city = $_POST['City'];
$zipcode  = $_POST['Zipcode'];
$gender  = $_POST['Gender'];


$sql = "INSERT INTO leads_tab (name,contact_no,email_id,area,
              city,zipcode,gender)
              values('".$name."','".$contact_number."','".$email."','".$area."',
                     '".$city."','".$zipcode."',".$gender.")";

$success = mysqli_query($conn,$sql);
if($success){
    $flag = 1;
    // header("Location:dashboard_staff.php");
}else{
    $flag= 0;
    // header("Location:addlead.php");
}
return $flag;
}

function addcustomertodb(){
    echo "add customer to db";
    return 0;
}
function showleadsbydate($date){

    $conn = connect();
    // echo "loading the records";

    $query = "SELECT * FROM `leads_tab` WHERE DATE(updated_date) ='".$date."'";
    $result = mysqli_query($conn,$query);
    return $result;
}
function addtoopportunity($lead_id,$productname, $empname ,$PrefferreDate, $str, $converse ){

  //  include "connection.php";
    $conn =Connect();
    // $lead_id = $_REQUEST['lid'];
    // echo "-------> ".lead_id;
    // $productname = $_REQUEST['productname'];
    // $empname = $_REQUEST['empname'];
    // $PrefferreDate = $_REQUEST['PrefferreDate'];
    // $medium = $_REQUEST['medium'];
    // $str = "";
    // if(isset($_REQUEST['medium'])){
    // foreach ($medium as $name){
    //     $str .= $name.",";
    // }
    // }
    // $converse = $_REQUEST['converse'];



    $sql = "INSERT INTO opportunity (lead_id, employee_id,product_name,preferred_date, pref_channel, description)
    VALUES (".$lead_id.",".$empname.",'".$productname."','".$PrefferreDate."',
                        '".$str."','".$converse."')";

    if(mysqli_query($conn,$sql)){
        echo 'inserted record successfully!';
        $flag = 1;
        // header("Location:coverttooppo.php");
    }else{
        echo 'failed, try again';
        $flag = 0;
        // header("Location:addlead.php");
    }
return $flag;
}
function showstaffnamebyuname($uname){
    //echo $id;
    echo "----------".$uname;
     $conn = connect();
    // echo "loading the records";
    $query = "SELECT * FROM `staff` where username = '".$uname."'";
    echo $query;
    $result = mysqli_query($conn,$query);
    while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
        $sid =  $row['staff_id'];
       // echo "count : ".$count;
    }
     mysqli_close($conn);
    return $sid;
}
function showleadsbymonth($lmonth){
// echo "calling function...".$lmonth;
  $month = explode("-",$lmonth);
  $conn = connect();
//   print_r($month);
  $query = "SELECT * FROM leads_tab WHERE MONTH(updated_date) = $month[1] AND YEAR(updated_date) = $month[0]";
  $result = mysqli_query($conn,$query);
  return $result;
}
function showonelead($id){

    // echo $id;
    $conn = connect();
    // echo "loading the records";
    $query = "SELECT * FROM `leads_tab` where id = ".$id." && deleted = 0";
    $result = mysqli_query($conn,$query);
   //  print_r($result);
    return $result;
}
function showonecustomer($id){

    // echo $id;
    $conn = connect();
    // echo "loading the records";
    $query = "SELECT * FROM `customer` where customer_id = ".$id." && deleted = 0";
    $result = mysqli_query($conn,$query);
   //  print_r($result);
    return $result;
}
function showoneproduct($id){

    // echo $id;
    $conn = connect();
    // echo "loading the records";
    $query = "SELECT * FROM `product` where product_id = ".$id." && deleted = 0";
    $result = mysqli_query($conn,$query);
   //  print_r($result);
    return $result;
}
function showallopportunities(){
 //  include("connection.php");
  $conn = connect();
    // echo "loading the records";
    $query = "SELECT * FROM `opportunity` where deleted = 0" ;
    $result = mysqli_query($conn,$query);
    return $result;
}
function show_quotations(){
    //include("connection.php");
    $conn = connect();
    // echo "loading the records";
    $query = "SELECT * FROM `quotation` where deleted = 0" ;
    $result = mysqli_query($conn,$query);
    return $result;
}
function show_quotationstocustomer($cid){
    //include("connection.php");
    $conn = connect();
    // echo "loading the records";
    $query = "SELECT * FROM `quotation` where deleted = 0 and lead_id=".$cid ;
    $result = mysqli_query($conn,$query);
    return $result;
}
function showcustidbyname($uname){
    $conn = connect();
    // echo "loading the records";
    $query = "SELECT * FROM `customer` where deleted = 0 and username = '".$uname."'" ;
    $result = mysqli_query($conn,$query);
    return $result;
}
  function showquoteoftheday(){
    // include("../connection.php");
    $conn = connect();
    $quote = "";
     //echo "loading the quotes";
    //  die("----");
    $query = "SELECT quote FROM `quotes` where id = day(CURDATE())";
    $result = mysqli_query($conn,$query);
    if (mysqli_num_rows($result) > 0) {
        /* output data of each row */
        while($row = mysqli_fetch_assoc($result)) {
            $quote = $row['quote'];
        }
    }
    else{
        return 0;
    }
    // mysqli_close($conn);
     return $quote;
  }
function showstaffnamebyid($id){
   // echo $id;
    if ($id  != 0){
    $conn = connect();
    // echo "loading the records";
    $query = "SELECT * FROM `staff` where staff_id = ".$id;
    $result = mysqli_query($conn,$query);
    while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
        $sname =  $row['name'];
       // echo "count : ".$count;
    }
    }
    else{
        $sname = "<u> No Staff Alloted yet <u>";
    }
    return $sname;
}
function showlatestactivities(){
    // include ("../connection.php");
    $conn = connect();
      // die("loading the activity");
      $query = "SELECT * FROM activities
      WHERE STR_TO_DATE(DATE, '%Y-%m-%d') >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
        AND STR_TO_DATE(DATE, '%Y-%m-%d') <= DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY);";
      //$query = "SELECT * FROM `activities` where date = CURDATE()-1 || date = CURDATE()";
      $result = mysqli_query($conn,$query);
       // print_r($result);
      //mysqli_close($conn);
      return $result;
}
function showcustomeractivities(){
    // include ("../connection.php");
    $conn = connect();
      // die("loading the activity");
      $query = "SELECT * FROM activities
      WHERE STR_TO_DATE(DATE, '%Y-%m-%d') >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
        AND STR_TO_DATE(DATE, '%Y-%m-%d') <= DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY);";
      //$query = "SELECT * FROM `activities` where date = CURDATE()-1 || date = CURDATE()";
      $result = mysqli_query($conn,$query);
       // print_r($result);
      //mysqli_close($conn);
      return $result;
}


function showsingleticket($id){
    // require("../connection.php");
    $conn = connect();
    $query = "SELECT * FROM tickets where ticket_id = ".$id." ORDER BY date DESC LIMIT 10 ;";
   // echo $query;
    $result = mysqli_query($conn,$query);
    return $result;
}

function updatequotationtooppo(){
   // include("connection.php");
    $conn = connect();
    $oppo_id = $_REQUEST['oppoid'];
    $qid = $_REQUEST['qid'];
    $query = "UPDATE opportunity set quotation_id = ".$qid." WHERE opportunity_id= ".$oppo_id." && deleted = 0";
    echo $query;
     $flag = mysqli_query($conn,$query);
    if($flag == 1){
    ?>
     <script>
         alert("Quotation added to opportunity record");
    </script>
     <?php
   }
   else{
     ?>
     <script>
         alert("Problem in updation of quotation");
     </script>
    <?php
  }
}

function getlastquotationid(){
    $conn = connect();
    $qid = 0;
    $query = "SELECT quotation_id FROM `quotation` where deleted = 0 limit 1 orderby desc" ;
    $result = mysqli_query($conn,$query);
    while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
        $qid =  $row['quotation_id'];
       // echo "count : ".$count;
    }
    return $qid;
}

// attempt to write Delete_quotation function:
function delete_quotations(){
    //include("connection.php");
    $conn = connect();
    $qid = $_REQUEST['qid'];
    echo "loading the records";
    $query = "update `quotation` set deleted = 1 WHERE quotation_id  =".$qid;
    $result = mysqli_query($conn,$query);
    if ($result == 1){
        echo "1";
    }
    else
       echo "0";
}

function showoneoppo($oid){
    //  echo "------------";
     $conn = connect();
     // echo "loading the records";
     $query = "SELECT * FROM `opportunity` where opportunity_id = ".$oid."&& deleted = 0" ;
     $result = mysqli_query($conn,$query);
    //  print_r($result);
     return $result;
 }

 function showmixrecord($oid){
    //  echo "------------";
     $conn = connect();
     // echo "loading the records";
     $query = "SELECT o.product_name, q.title, o.quotation_id, o.preferred_date,q.expiry_date, o.pref_channel FROM `opportunity` o , quotation q WHERE o.opportunity_id = ".$oid." && o.deleted = 0" ;
     $result = mysqli_query($conn,$query);
    //  print_r($result);
     return $result;
 }
//SELECT o.product_name, q.title, o.preferred_date,q.expiry_date, o.pref_channel FROM `opportunity` o , quotation q WHERE o.quotation_id = 1;

 function checkoppoid($oid){
    //  echo "------------";
    $conn = connect();
     $count  = 0;
     // echo "loading the records";
     $query = "SELECT count(*) as count FROM `opportunity` where opportunity_id = ".$oid." && deleted = 0" ;
     $result = mysqli_query($conn,$query);
     while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
         $count =  $row['count'];
        // echo "count : ".$count;
     }
   //  echo "--->".$count;
     return $count;
 }
// to get quotation data from opportunity id
 function getqdatafromoppoid($oppoid){
    // echo "----------------";
    $conn = connect();
    $quodata = "";
    // echo "loading the records";
    $query = "SELECT quotation_id FROM `opportunity` where opportunity_id = ".$oppoid." && deleted = 0" ;
    $result = mysqli_query($conn,$query);
    if (mysqli_num_rows($result) > 0) {
        // output data of each row
        $sql = "";
       while($row = mysqli_fetch_assoc($result)){
          $sql = "select * from quotation where quotation_id = ".$row['quotation_id']." && deleted = 0";
        //   echo $sql;
       }
        $quodata = mysqli_query($conn,$sql);
        // print_r($quodata);

    }
        else{
            echo "No match quotation data found";
    }
    return $quodata;
 }

 function getquotationtitle($qid){
    // include("connection.php");
     $conn = connect();
     // echo "loading the records";
     $query = "SELECT title FROM `quotation` where quotation_id = ".$qid ;
    // echo $query;
    $title ="";
     $result = mysqli_query($conn,$query);
     if (mysqli_num_rows($result) > 0) {
        // output data of each row
        while($row = mysqli_fetch_assoc($result)) {
            $title = $row['title'];
        }
    }
   //  echo "-------------".$title;
     return $title;
 }

 function getquotationidfromtitle($title){
    // include("connection.php");
    $conn = connect();
     // echo "loading the records";
     $query = "SELECT quotation_id FROM `quotation` where title = '".$title."'";
     //echo $query;
    $qid = 0;
     $result = mysqli_query($conn,$query);
     if (mysqli_num_rows($result) > 0) {
        // output data of each row
        while($row = mysqli_fetch_assoc($result)) {
            $qid = $row['quotation_id'];
        }
    }
   //  echo "-------------".$title;
     return $qid;
 }

 function getemployeebyid($eid){
    // include("connection.php");
     $conn = connect();
     // echo "loading the records";
     $query = "SELECT name FROM `staff` where staff_id = ".$eid ;
    // echo $query;
    $name = "";
     $result = mysqli_query($conn,$query);
     if (mysqli_num_rows($result) > 0) {
        // output data of each row
        while($row = mysqli_fetch_assoc($result)) {
            $name = $row['name'];
        }
    }
   //  echo "-------------".$title;
     return $name;
 }
 function geteidfromoppoid($oppoid){
    $conn = connect();

    // echo "loading the records";
    $query = "SELECT employee_id  FROM `opportunity` where opportunity_id = ".$oppoid." && deleted = 0" ;
    $result = mysqli_query($conn,$query);
    if (mysqli_num_rows($result) > 0) {
        // output data of each row
        $sql = "";
       while($row = mysqli_fetch_assoc($result)){
          $sql = "select name from staff where staff_id = ".$row['employee_id'];
        //   echo $sql;
       }
       $ename = "";
        $staffdata = mysqli_query($conn,$sql);
        if (mysqli_num_rows($staffdata) > 0) {
            // output data of each row
            while($row = mysqli_fetch_assoc($staffdata)) {
                $ename = $row['name'];
            }
        }

    }
        else{
            echo "No match quotation data found";
    }
    return $ename;
 }
 function getemployeeidbyname($ename){
    // include("connection.php");
     $conn = connect();
     // echo "loading the records";
     $query = "SELECT staff_id FROM `staff` where name = '".$ename."'" ;
    // echo $query;
     $result = mysqli_query($conn,$query);
     if (mysqli_num_rows($result) > 0) {
        // output data of each row
        while($row = mysqli_fetch_assoc($result)) {
            $sid = $row['staff_id'];
        }
    }
    else{
        return 0;
    }
     //echo "sid -------------".$sid."<br>";
     return $sid;
 }


 function delleadrecord($id){
    //include("connection.php");
    $conn = connect();
    // echo "updating the records";
    $query = "UPDATE `leads_tab` Set deleted = 1 WHERE id  =".$id;
    $result = mysqli_query($conn,$query);
    if ($result == 1){
        return (true);
    }
    else
       return(false);
}
function delproductrecord($id){
    //include("connection.php");
    $conn = connect();
    // echo "updating the records";
    $query = "UPDATE `product` Set deleted = 1 WHERE product_id  =".$id;
    $result = mysqli_query($conn,$query);
    if ($result == 1){
        return (true);
    }
    else
       return(false);
}

function delcustomerrecord($id){
    //include("connection.php");
    $conn = connect();
    // echo "updating the records";
    $query = "UPDATE `customer` Set deleted = 1 WHERE customer_id  =".$id;
    $result = mysqli_query($conn,$query);
    if ($result == 1){
        return (true);
    }
    else
        return(false);
}
function showonequotation($qid){
      // echo $id;
      $conn = connect();
      // echo "loading the records";
      $query = "SELECT * FROM `quotation` where quotation_id = ".$qid." && deleted = 0";
      $result = mysqli_query($conn,$query);
     //  print_r($result);
      return $result;
  }

function countallnotifications(){
      $conn = connect();
    // echo "loading the records";
    $query = "SELECT (sum(leads)+sum(quotations)+sum(customers)) as total FROM `notify_tab`";
    // echo $query;
    $result = mysqli_query($conn,$query);
    while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
        $total =  $row['total'];
       // echo "count : ".$total;
    }

    return $total;
}
function getnotifysubject(){
      $conn = connect();
    // echo "loading the records";
    $query = "SELECT subject,message FROM `notify_tab`";
    // echo $query;
    $result = mysqli_query($conn,$query);
    // while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
    //     $total =  $row['total'];
    //    // echo "count : ".$total;
    // }

    return $result;
}

function getleadsbetweendates($from,$to){
    //include ("../connection.php");
    $conn = connect();
    // die("loading the records");
    $query = "SELECT* FROM `leads_tab` where updated_date >= '".$from."' and updated_date <= '".$to."' and status = 1 and deleted = 0";
    // echo $query;
    $result = mysqli_query($conn,$query);
    return $result;
}
function showleadcount(){
    // include ("../connection.php");
    $conn = connect();
    $cnt  = 0;
    $result = mysqli_query($conn, "SELECT count(*) as cnt FROM leads_tab");
    $row = mysqli_fetch_assoc($result);
    $cnt =  $row["cnt"];
    // mysqli_close($conn);
    return $cnt;
}
function showoppocount(){
    // include ("../connection.php");
    $conn = connect();
    $cnt = 0;
    $result = mysqli_query($conn, "SELECT count(*) as cnt FROM opportunity");
    $row = mysqli_fetch_assoc($result);

    $cnt =  $row["cnt"];
    // mysqli_close($conn);
    return $cnt;
}
function showactivitycount(){
    // include ("../connection.php");
    $conn = connect();
    $cnt  = 0;
    $result = mysqli_query($conn, "SELECT count(*) as cnt FROM activities");
    $row = mysqli_fetch_assoc($result);
    $cnt =  $row["cnt"];
    // mysqli_close($conn);
    return $cnt;
}
function showproductcount(){
    // include ("../connection.php");
    $conn = connect();
    $cnt = 0;
    $result = mysqli_query($conn, "SELECT count(*) as cnt FROM product");
    $row = mysqli_fetch_assoc($result);
    $cnt =  $row["cnt"];
    // mysqli_close($conn);
    return $cnt;
}

function checkcustomeremail($email){

    $conn = connect();
    //echo "loading the quotes";
   //  die("----");
   $cnt  = 0;
   $query = "SELECT count(*) as cnt FROM `customer` where email ='".$email."'";
   $result = mysqli_query($conn,$query);
   if (mysqli_num_rows($result) > 0) {
       /* output data of each row */
       while($row = mysqli_fetch_assoc($result)) {
           $cnt = $row['cnt'];
       }
   }
   else{
       return 0;
   }
    return $cnt;
  }
?>
