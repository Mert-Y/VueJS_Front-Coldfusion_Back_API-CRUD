<cfcomponent>
	<cffunction name="setUser" access="remote" >
		<cfargument name="name" type="string" required="true" >
		<cfargument name="surname" type="string" required="true" >
		<cfargument name="phoneNumber" type="string" required="true" >
		<cfargument name="email" type="string" required="true" >
		<cfargument name="address" type="string" required="true" >
		
		<cfset newUser = entityNew("User", {
			name="#name#", 
			surname="#surname#", 
			phoneNumber="#phoneNumber#", 
			email="#email#", 
			address="#address#"
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
		
		<cfif isDefined("#name#")>
			<cfset userToBeEdited.setName("#name#")>
		</cfif>
		<cfif isDefined("#surname#")>
			<cfset userToBeEdited.setName("#surname#")>
		</cfif>
		<cfif isDefined("#phoneNumber#")>
			<cfset userToBeEdited.setName("#phoneNumber#")>
		</cfif>
		<cfif isDefined("#email#")>
			<cfset userToBeEdited.setName("#email#")>
		</cfif>
		<cfif isDefined("#address#")>
			<cfset userToBeEdited.setName("#address#")>
		</cfif>
		<cfset newUser = entitySave(userToBeEdited)>
	</cffunction>
	
	<cffunction name="getUser" access="remote" >
		<cfargument name="id" type="string" required="true" >
		
		<cfset ormflush()>
		<cfreturn entityLoad("User", id)>
	</cffunction>
	
	<cffunction name="deleteUser" access="remote" >
		<cfargument name="id" type="string" required="true" >
		
		<cfset ormflush()>
		<cfreturn entityDelete(getUser(id))>
	</cffunction>
	
	<cffunction name="getUsers" access="remote" >
		<cfset ormflush()>
		<cfreturn entityLoad("User")>
	</cffunction>
</cfcomponent>