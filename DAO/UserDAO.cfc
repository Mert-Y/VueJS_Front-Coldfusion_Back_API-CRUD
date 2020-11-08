<cfcomponent>
	<cffunction name="addUser">
		<cfargument name="name" type="string" required="true" >
		<cfargument name="surname" type="string" required="true" >
		<cfargument name="phoneNumber" type="string" required="true" >
		<cfargument name="email" type="string" required="true" >
		<cfargument name="address" type="string" required="true" >
		
		<cfset var newUser = entityNew("User", {
			name=arguments.name, 
			surname=arguments.surname, 
			phoneNumber=arguments.phoneNumber, 
			email=arguments.email, 
			address=arguments.address
		})>
		
		<cfset entitySave(newUser)>
		<cfset ormflush()>
		<cfreturn newUser.getId()>
	</cffunction>
	
	<cffunction name="updateUser">
		<cfargument name="id" type="string" required="true" >
		<cfargument name="name" type="string">
		<cfargument name="surname" type="string">
		<cfargument name="phoneNumber" type="string">
		<cfargument name="email" type="string">
		<cfargument name="address" type="string">
		
		<cfset userToBeUpdated = getUser(id)>
		<cfset entitySave(userToBeUpdated)>
	</cffunction>
	
	<cffunction name="getUser">
		<cfargument name="id" type="string" required="true" >
		
		<cfset ormflush()>
		<cfreturn entityLoad("User", arguments.id, "true")>
	</cffunction>
	
	<cffunction name="deleteUser">
		<cfargument name="id" type="string" required="true" >
		
		<cfset entityDelete(getUser(arguments.id))>
	</cffunction>
	
	<cffunction name="getUsers">
		<cfset ormflush()>
		<cfreturn entityLoad("User")>
	</cffunction>
</cfcomponent>