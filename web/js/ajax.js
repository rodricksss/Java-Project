var xmlHttp;
function getcity(str)
{
    xmlHttp=GetXmlHttpObject();
    if (xmlHttp==null)
      {
      alert("Your browser does not support AJAX!");
      return;
      }
    var url="getcity.jsp";
    url=url+"?ids="+str;  
    xmlHttp.onreadystatechange=stateChanged;
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}
function stateChanged()
{
    if(xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    document.getElementById("txtCity").innerHTML=xmlHttp.responseText;
    }
}
function GetXmlHttpObject()
{
var xmlHttp=null;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp;
}

function getsubcat(str)
{
    xmlHttp=GetXmlHttpObject();
    if (xmlHttp==null)
      {
      alert("Your browser does not support AJAX!");
      return;
      }
    var url="getsubcat.jsp";
    url=url+"?catid="+str;  
    xmlHttp.onreadystatechange=stateChanged2;
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function stateChanged2()
{
    if(xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    document.getElementById("txtSubCat").innerHTML=xmlHttp.responseText;
    }
}
