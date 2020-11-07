<cfcomponent persistent="true" accessors="true" table="Users">
	<cfproperty name="id" column="userID" fieldtype="id" generator="increment">
	<cfproperty name="name" type="string">
	<cfproperty name="surname" type="string">
	<cfproperty name="phoneNumber" type="string">
	<cfproperty name="email" type="string">
	<cfproperty name="address" type="string">
</cfcomponent>