
function validate(){
var fname=document.getElementById('fname').value;
var lname=document.getElementById('lname').value;
var email=document.getElementById('email').value;
var password=document.getElementById('password').value;
var f=0,l=0,e=0,p=0;
if(fname == ""){
document.getElementById('firstname').innerHTML="**please fill the firstname";

}
else if(!Name(fname)){
document.getElementById('firstname').innerHTML=" **invalid firstname(only alphabets)";
}
else{
f=1;
document.getElementById('firstname').innerHTML="";
}
if(email == ""){
document.getElementById('emailo').innerHTML="**please fill the email";

}
else if(!isEmail(email)){
document.getElementById('emailo').innerHTML="**please enter valid email";

}
else{
e=1;
document.getElementById('emailo').innerHTML="";
}
if(lname == ""){
document.getElementById('lastname').innerHTML="**please fill the lastname";

}
else if(!Name(lname)){
document.getElementById('lastname').innerHTML="**invalid firstname(only alphabets)"
}
else{
l=1;
document.getElementById('lastname').innerHTML="";

}
if(password == ""){
document.getElementById('passwordo').innerHTML=" **please fill the password";

}
else if(!ispassword(password)){
document.getElementById('passwordo').innerHTML=" **The password must contain atleast a capitial,number and special charcter";

}
else{
p=1;
document.getElementById('passwordo').innerHTML="";
}
if(p==1 && l==1 && e==1 && f==1){
return true;
}



return false;


}
function Name(name){
return   /^[a-zA-Z]+$/.test(name);
}
function isEmail(email){
return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}
function ispassword(pass){
return /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/.test(pass)
}
function myFunction() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
var b;
function reply_click(clicked_id)
{
b=clicked_id;
window.location.replace("Bookdetails.jsp");
}
 
function id(){
console.log(b)
return b;}
