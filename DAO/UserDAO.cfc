<cfcomponent>
	<cffunction name="setUser" access="remote" >
		<cfargument name="name" type="string" required="true" >
		<cfargument name="surname" type="string" required="true" >
		<cfargument name="phoneNumber" type="string" required="true" >
		<cfargument name="email" type="string" required="true" >
		<cfargument name="address" type="string" required="true" >
		
		<cfset newUser = entityNew("User", {
			name=arguments.name, 
			surname=arguments.surname, 
			phoneNumber=arguments.phoneNumber, 
			email=arguments.email, 
			address=arguments.address
		})>
	</cffunction>
	
	<cffunction name="updateUser" access="remote" >
		<cfargument name="id" type="string" required="true" >
		<cfargument name="name" type="string">
		<cfargument name="surname" type="string">
		<cfargument name="phoneNumber" type="string">
		<cfargument name="email" type="string">
		<cfargument name="address" type="string">
		
		<cfset userToBeUpdated = getUser(id)>
		<cfset entitySave(userToBeUpdated)>
	</cffunction>
	
	<cffunction name="getUser" access="remote" >
		<cfargument name="id" type="string" required="true" >
		
		<cfset ormflush()>
		<cfreturn entityLoad("User", arguments.id)>
	</cffunction>
	
	<cffunction name="deleteUser" access="remote" >
		<cfargument name="id" type="string" required="true" >
		
		<cfset entityDelete(getUser(arguments.id))>
	</cffunction>
	
	<cffunction name="getUsers" access="remote" >
		<cfset ormflush()>
		<cfreturn entityLoad("User")>
	</cffunction>
</cfcomponent>