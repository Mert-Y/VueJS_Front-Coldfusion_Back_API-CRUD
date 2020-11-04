<cfcomponent>
	<cfobject type="component" name="usersDAO" component="workCube-Homework1-CRUD.DAO.UserDAO">

	<cffunction name="addUser" access="remote" >
		<cfargument name="name" type="string" required="true" >
		<cfargument name="surname" type="string" required="true" >
		<cfargument name="phoneNumber" type="string" required="true" >
		<cfargument name="email" type="string" required="true" >
		<cfargument name="address" type="string" required="true" >
		
		<cfset usersDAO.addUser(arguments.name, arguments.surname, arguments.phoneNumber, arguments.email, arguments.address)>
	</cffunction>
	
	<cffunction name="updateUser" access="remote" >
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
	
	<cffunction name="getUser" access="remote" >
		<cfargument name="id" type="string" required="true" >
		
		<cfreturn usersDAO.getUser(arguments.id)>
	</cffunction>
	
	<cffunction name="deleteUser" access="remote" >
		<cfargument name="id" type="string" required="true" >
		
		<cfreturn usersDAO.deleteUser(arguments.id)>
	</cffunction>
	
	<cffunction name="getUsers" access="remote" >
		<cfreturn usersDAO.getUsers()>
	</cffunction>
</cfcomponent>