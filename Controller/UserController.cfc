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
	
	<cffunction name="editUser" access="remote" >
		<cfargument name="id" type="string" required="true" >
		<cfargument name="name" type="string">
		<cfargument name="surname" type="string">
		<cfargument name="phoneNumber" type="string">
		<cfargument name="email" type="string">
		<cfargument name="address" type="string">
		
		<cfset userToBeEdited = getUser(id)>
		
		<cfif isDefined(arguments.name)>
			<cfset userToBeEdited.setName(arguments.name)>
		</cfif>
		<cfif isDefined(arguments.surname)>
			<cfset userToBeEdited.setName(arguments.surname)>
		</cfif>
		<cfif isDefined(arguments.phoneNumber)>
			<cfset userToBeEdited.setName(arguments.phoneNumber)>
		</cfif>
		<cfif isDefined(arguments.email)>
			<cfset userToBeEdited.setName(arguments.email)>
		</cfif>
		<cfif isDefined(arguments.address)>
			<cfset userToBeEdited.setName(arguments.address)>
		</cfif>
		<cfset entitySave(userToBeEdited)>
	</cffunction>
	
	<cffunction name="getUser" access="remote" >
		<cfargument name="id" type="string" required="true" >
		
		<cfset ormflush()>
		<cfreturn entityLoad("User", arguments.id)>
	</cffunction>
	
	<cffunction name="deleteUser" access="remote" >
		<cfargument name="id" type="string" required="true" >
		
		<cfset ormflush()>
		<cfset entityDelete(getUser(arguments.id))>
	</cffunction>
	
	<cffunction name="getUsers" access="remote" >
		<cfset ormflush()>
		<cfreturn entityLoad("User")>
	</cffunction>
</cfcomponent>