<cfcomponent>
	<cfset this.name = "WorkCube-Homework1-CRUD">
	<cfset this.sessionManagement = "true">
	<cfset this.sessionTimeout = "#CreateTimeSpan(0, 0, 60, 0)#">
	<cfset this.applicationTimeout = "#CreateTimeSpan(10, 0, 0, 0)#">
	<cfset this.datasource = "workCube-Homework1-CRUD-DSN">
	<cfset this.ormenabled = "true">
	<cfset this.ormSettings = { autoGenMap=true, dbcreate = "dropcreate"}>
	
	<cffunction name="onApplicationStart" >
		<cfset ormreload()>
		<cfobject type="component" name="users" component="workCube-Homework1-CRUD.DAO.UserDAO">
		<cfset users.addUser("Zakk", "Atkins", "5236854521", "zakk@gmail.com", "address")>
		<cfset users.addUser("Macaulay", "Sharples", "9535426851", "sharples@hotmail.com", "address2")>
		<cfset users.addUser("Betty", "Heaton", "4578952141", "betty.heaton@gmail.com", "address3")>
	</cffunction>

	<cffunction name="onSessionStart" >
	</cffunction>
	
	<cffunction name="onRequestStart" >
		<cfargument name="targetPage" type="string" >
	</cffunction>
	
	<cffunction name="onRequest" >
		<cfargument name="targetPage" type="string" >
	</cffunction>
	
	<cffunction name="onRequestEnd" >
	</cffunction>
	
	<cffunction name="onSessionEnd" >
		<cfargument name="SessionScope" type="struct" >
		<cfargument name="ApplicationScope" type="struct" >
	</cffunction>
	
	<cffunction name="onApplicationEnd" >
		<cfargument name="ApplicationScope" type="struct" >
	</cffunction>
	
	<cffunction name="onError" >
		<cfargument name="Exception" type="any" >
		<cfargument name="EventName" type="string" >
	</cffunction>
</cfcomponent>