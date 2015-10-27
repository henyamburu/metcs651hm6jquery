<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Web._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BU - MET CS651</title>    
    <link rel="stylesheet" href="/assets/css/style.css" type="text/css" />
    <link href="/assets/css/max-width-768px.css" rel="stylesheet" type="text/css"/> 
    <link href="/assets/css/max-width-480px.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function CallService(value) {
            $.ajax({
                type: "GET", //GET or POST or PUT or DELETE verb
                url: 'http://localhost:54759/service.svc/GetSortedWordsCount?words=' + value, // Location of the service
                data: "json", //Data sent to server
                contentType: "application/json; charset=utf-8", // content type sent to server
                dataType: 'json', //Expected data format from server
                processdata: false, //True or False
                success: ServiceSucceeded,//On Successfull service call
                error: ServiceFailed// When Service call fails
            });
        }

        function  ServiceSucceeded(result) {
            //console.log(result);
            $("#previewWords").html(result.d);
        }

        function ServiceFailed(result) {
            alert('Service call failed: ' + result.status + ' ' + result.statusText);
        }

        $(function () {
            $('#lineReader').keyup(function () {
                if ($(this).length == 1) {
                    CallService($(this).val());
                }
            });           
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="page" align="center">
        <div id="header">
            <div id="companyname" align="left">BU - MET CS651</div>
            <div id="mainmenu">
                <ul>
                    <li><a class="current" href="/default.apx">Sort Words</a></li>
                    <li><a href="#">Link 1</a></li>
                </ul>
            </div>
            <div id="mainmenu-max-width-480px">
                <ul>
                    <li>
                        <a class="current" href="/default.apx">Sort Words</a>
                        <ul>
                            <li><a href="#">Link 1</a></li>
                        </ul>
                    </li>
                </ul>                
            </div>
        </div>
        <div id="container">
            <div class="container-heading">
                <h1>Line Reader</h1>
            </div>
            <div class="container-content">
                <div class="reader">
                    <textarea id="lineReader"></textarea>
                </div>
                <div class="scroller">                
                <p  id="previewWords">. 
                </p>
                    </div>
                <div class="clr"></div>
            </div>
        </div>
        <div class="footer">
            <ul>
                 <li><a href="/default.apx">Sort Words</a></li>
                 <li><a href="#">Link 1</a></li>
            </ul>
            <div class="clr"></div>
        </div>
    </div>
        
    </form>
</body>
</html>
