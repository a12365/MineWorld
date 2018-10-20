<html>
<head>
	<title>Hello,World</title>
	<script language="C#" runat="server">
        protected void Hello() {
        	Label1.Text=System.DateTime.Now.ToString();
		}
	</script>
</head>
<body>
	<p>
	<asp:Label id="Label1" Text="The time is" DataFormatString="{0:yyyy-MM-dd HH24:mm:ss}" runat="server"/>
    </p>
</body>
</html>