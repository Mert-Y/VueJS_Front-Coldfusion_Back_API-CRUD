<cfcomponent persistent="true" accessors="true" table="Users">
	<cfproperty name="id" column="userID" fieldtype="id" generator="increment">
	<cfproperty name="name">
	<cfproperty name="surname">
	<cfproperty name="phonenumber">
	<cfproperty name="email">
	<cfproperty name="address">
</cfcomponent>