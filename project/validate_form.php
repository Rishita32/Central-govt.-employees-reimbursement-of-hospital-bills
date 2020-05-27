<!DOCTYPE html>
<html>
  <head>
    <title>Welcome</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
  </head>
  <body>
		<h2 style="text-align: center;">GOVERNMENT HEALTH SERVICE</h2>
        <h3 style="text-align: center;">Mumbai, Maharashtra</h3>
        <br>

  <?php

  	session_start();
  	$connection = mysqli_connect('localhost','root','');
    $db = mysqli_select_db($connection,'project');
    if($connection-> connect_error )
    {
       	die("Connection with Database Failed!!".$connection-> connect_error);
    }
    
  	if(isset($_GET['id']) or isset($_SESSION['id'])) {
  		$id=(isset($_GET['id'])?$_GET['id']:$_SESSION['id']);
    	echo $id."<br>";
		
      	$sql = "SELECT firstname,lastname,cardtype,relation,submit_time,form_type,fstatus,id,age,gender,symptoms from memo_table where id='$id' " ;
      	$result = mysqli_query($connection,$sql);
      	$rowcount = mysqli_num_rows($result);
      	if($rowcount> 0)
      	{
        	while ($row = $result->fetch_assoc()) 
        	{
        	   echo $row["firstname"];
        	}
      	}
      	else
      	{
        	echo "No result to display";
      	}
    }
	if (isset($_POST['validate_button'])  and isset($_SESSION['id'])) {
    	//validate action
			$id=$_SESSION['id'];       
	        $sqln="UPDATE memo_table SET fstatus ='approved' WHERE id= '$id' ";
	        $query=mysqli_query($connection,$sqln) or die ('Unable to execute query.'. mysqli_error($connection));
    


		} else if (isset($_POST['pass_button'])) {
		    //pass action
		    $id=$_SESSION['id'];       
	        $sqln="UPDATE memo_table SET fstatus ='higher_approval_required' WHERE id= '$id' ";
	        $query=mysqli_query($connection,$sqln) or die ('Unable to execute query.'. mysqli_error($connection));
		} else if (isset($_POST['delete_button'])){
		    // delete pressed
		    $id=$_SESSION['id'];       
	        $sqln="UPDATE memo_table SET fstatus ='rejected' WHERE id= '$id' ";
	        $query=mysqli_query($connection,$sqln) or die ('Unable to execute query.'. mysqli_error($connection));
		}

		else{

		}

	    $connection-> close();
    
    $user=(isset($_GET['user'])?$_GET['user']:$_SESSION['user']);
    $_SESSION=$user;
    $_SESSION['id']=$id;

    
    ?>

	<form action="validate_form.php " method="POST">
 	 <div class="form-group">
    	<label >Remark</label>
 		<input  placeholder="Remark">
 	 </div>
 	 
    <button type="submit" name="validate_button" class="btn btn-primary">Validate</button>
    <?php
    if($user=='admin')
		echo '<button type="submit" name="pass_button" class="btn btn-primary">Pass Over</button>';
  	?>
    <button type="submit" name="delete_button" class="btn btn-primary">Reject</button>

</form>

  </body>

 </html>