<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>AvnCreatePage</title>

</head>
<style>
body { 
    background-color: #d2fafb; 
}
#header {
    background-color:lightblue;
    style:color:blue;
    text-align:center;
    padding:32px;
}
#headerone {
    style:color:black;
    text-align:center;
    }
#homepage
{
float:right;
style:color:blue;
}
#section { 
    background-repeat: no-repeat;
	background-attachment: fixed;
    background-position: center; 
}
#footer {
    background-color:lightblue;
   	color:blue;
    text-align:center;
    padding:28px;
	margin-top: 66px;
	}
form {
  text-align: center;
  margin : 0 auto;
}
input[type="text"]{
      border-radius:5px;
      -moz-border-radius:5px;
      -webkit-border-radius:5px;
    }
input[type="text"]{
      border-radius:5px;
      -moz-border-radius:5px;
      -webkit-border-radius:5px;
	  width: 200px;
      height: 30px;
    }
input[type="number"]{
      border-radius:5px;
      -moz-border-radius:5px;
      -webkit-border-radius:5px;
}
input[type="date"]{
      border-radius:5px;
      -moz-border-radius:5px;
      -webkit-border-radius:5px;
}
	
input[type="button"]{
    background-color: #f4511e;
    color: white;
    padding: 9px 12px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 28%;
	left: 250px;
}
select{
    border-radius:5px;
    -moz-border-radius:5px;
    -webkit-border-radius:5px;
	width : 14%;
}

</style>
<body>
<div id="header">
<h1>
<font size="5" color="#4d4d69">Create Repair Ticket</font>
</h1>
</div>

<div id="headerone">
<h2>
<font size="5" color="#4d4d69">Enter the details to create ticket</font>
 </h2>
</div>

<div id="section"><br>
<form action="createpage" method="post">
 
Product &#160;&#160;&#160;&#160;&#160;<select name="product">
  <option value="SELECT">--Select--</option>
  <option value="DIGITAL TV">DIGITAL TV</option>
  <option value="BROADBAND">BROADBAND</option>
  <option value="PAYMENT">PAYMENT</option>
  </select><br>
Prob Descp&#160;<input type="text" name="problemdescription"><br>
Contact     &#160;&#160;&#160;&#160;&#160;<input type="text" name="contact"><br>
Date         &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<input type="text"name="date" placeholder="dd/mm/yyyy"><br>
Status       &#160;&#160;&#160;&#160;&#160;&#160; <input type="text" name="status" value="NEW"><br>
<br>
<button type="Submit" value="Submit">Submit</button>
&nbsp;&nbsp;
</form>
<form action="cancelpage" method="post">
<button type="Submit" value="Submit" style="position: absolute;left: 728px;top: 363px;">Cancel</button>
</form>
</div>

<div id="footer" style="color: #4d4d69;">
<p>2017 &#169;AVN COMMUNICATION. All Rights Reserved.<br>
   | Small Business | Medium Business | Large Business | Wholesale |</p>
</div>
</body>
</html>
