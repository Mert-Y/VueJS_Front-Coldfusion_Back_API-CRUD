<cfcomponent rest="true">
	<cfobject type="component" name="usersDAO" component="workCube-Homework1-CRUD.DAO.UserDAO">
	
	<cffunction name="addUser" access="remote" httpmethod="POST">
		<cfset data = deserializeJson(GetHttpRequestData().content)>
		<cfif isDefined("data") AND 
		StructKeyExists(data, "name") AND 
		StructKeyExists(data, "surname") AND 
		StructKeyExists(data, "phoneNumber") AND 
		StructKeyExists(data, "email") AND 
		StructKeyExists(data, "address")>
			<cfset var id = usersDAO.addUser(data.name, data.surname, data.phoneNumber, data.email, data.address)>
			<cfif isDefined("id")>
				<cfheader statusCode="201" statusText="Successfully added User">
				<cfheader name ="userID" value="#id#">
			<cfelse>
				<cfheader statusCode="400" statusText="One of the required arguments is not present">
			</cfif>
		<cfelse>
			<cfheader statusCode="400" statusText="One of the required arguments is not present">
		</cfif>
	</cffunction>
	
	<cffunction name="updateUser" access="remote" httpmethod="POST">
		<cfargument name="id" type="string" required="true" >
		<cfargument name="name" type="string">
		<cfargument name="surname" type="string">
		<cfargument name="phoneNumber" type="string">
		<cfargument name="email" type="string">
		<cfargument name="address" type="string">
		
		<cfset userToBeUpdated = usersDAO.getUser(id)>
		<cfset performUpdate = false>
		
		<cfif isDefined(arguments.name) AND userToBeUpdated.getName NEQ arguments.name>
			<cfset userToBeUpdated.setName(arguments.name)>
			<cfset performUpdate = true>
		</cfif>
		
		<cfif isDefined(arguments.surname) AND userToBeUpdated.getSurname NEQ arguments.surname>
			<cfset userToBeUpdated.setName(arguments.surname)>
			<cfset performUpdate = true>
		</cfif>
		
		<cfif isDefined(arguments.phoneNumber) AND userToBeUpdated.getPhoneNumber NEQ arguments.phoneNumber>
			<cfset userToBeUpdated.setName(arguments.phoneNumber)>
			<cfset performUpdate = true>
		</cfif>
		
		<cfif isDefined(arguments.email) AND userToBeUpdated.getEmail NEQ arguments.email>
			<cfset userToBeUpdated.setName(arguments.email)>
			<cfset performUpdate = true>
		</cfif>
		
		<cfif isDefined(arguments.address) AND userToBeUpdated.getAddress NEQ arguments.address>
			<cfset userToBeUpdated.setName(arguments.address)>
			<cfset performUpdate = true>
		</cfif>
		
		<cfif performUpdate>
			<cfset usersDAO.updateUser(id)>
		</cfif>
	</cffunction>
	
	<cffunction name="getUser" access="remote" returnFormat="json" httpmethod="GET">
		<cfargument name="id" type="string" required="true" >

		<cfreturn usersDAO.getUser(arguments.id)>
	</cffunction>
	
	<cffunction name="deleteUser" access="remote" >
		<cfargument name="id" type="string" required="true" >
		
		<cfreturn usersDAO.deleteUser(arguments.id)>
	</cffunction>
	
	<cffunction name="getUsers" access="remote" returnFormat="json" httpmethod="GET">
		<cfreturn usersDAO.getUsers()>
	</cffunction>
</cfcomponent>