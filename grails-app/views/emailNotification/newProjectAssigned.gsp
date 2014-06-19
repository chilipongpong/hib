<%@ page contentType="text/html"%>
<html>
<body>
  <div class="body">
  	A new Project has been assigned to you:<br>
	<br>
	Project Name: ${eventInstance.name}<br>
	CRA Number: ${eventInstance.craNumber}<br>
	Client Name: ${eventInstance.client.user}<br>
	Venue: ${eventInstance.venue}<br>
	Sales Agent: ${eventInstance.salesAgent}<br>
  </div>
</body>
</html>