<cfcomponent rest="true">
	<cfobject type="component" name="usersDAO" component="workCube-Homework1-CRUD.DAO.UserDAO">
	
	<cffunction name="addUser" access="remote" httpmethod="POST">
		<cfargument name="name" type="string" default="">
		<cfargument name="surname" type="string" default="">
		<cfargument name="phoneNumber" type="string" default="">
		<cfargument name="email" type="string" default="">
		<cfargument name="address" type="string" default="">

		<cfset var req = GetHttpRequestData()>
		<cfif isDefined("req.content")>
			<cfset var data = deserializeJson(req.content)>

			<cfif isDefined("data.name")>
				<cfset arguments.name = data.name>
			</cfif>
			<cfif isDefined("data.surname")>
				<cfset arguments.surname = data.surname>
			</cfif>
			<cfif isDefined("data.phoneNumber")>
				<cfset arguments.phoneNumber = data.phoneNumber>
			</cfif>
			<cfif isDefined("data.email")>
				<cfset arguments.email = data.email>
			</cfif>
			<cfif isDefined("data.address")>
				<cfset arguments.address = data.address>
			</cfif>
		</cfif>

		<cfset var checkReturnStr = "">

		<cfset check = checkInput("name", arguments.name)>
		<cfif check NEQ true>
			<cfif checkReturnStr EQ "">
				<cfset checkReturnStr = check>
			<cfelse>
				<cfset checkReturnStr = checkReturnStr & ", " & check>
			</cfif>
		</cfif>

		<cfset check = checkInput("surname", arguments.surname)>
		<cfif check NEQ true>
			<cfif checkReturnStr EQ "">
				<cfset checkReturnStr = check>
			<cfelse>
				<cfset checkReturnStr = checkReturnStr & ", " & check>
			</cfif>
		</cfif>

		<cfset check = checkInput("phoneNumber", arguments.phoneNumber)>
		<cfif check NEQ true>
			<cfif checkReturnStr EQ "">
				<cfset checkReturnStr = check>
			<cfelse>
				<cfset checkReturnStr = checkReturnStr & ", " & check>
			</cfif>
		</cfif>

		<cfset check = checkInput("email", arguments.email)>
		<cfif check NEQ true>
			<cfif checkReturnStr EQ "">
				<cfset checkReturnStr = check>
			<cfelse>
				<cfset checkReturnStr = checkReturnStr & ", " & check>
			</cfif>
		</cfif>

		<cfset check = checkInput("address", arguments.address)>
		<cfif check NEQ true>
			<cfif checkReturnStr EQ "">
				<cfset checkReturnStr = check>
			<cfelse>
				<cfset checkReturnStr = checkReturnStr & ", " & check>
			</cfif>
		</cfif>

		<cfif checkReturnStr EQ "">
			<cfset var id = usersDAO.addUser(data.name, data.surname, data.phoneNumber, data.email, data.address)>
			<cfif isDefined("id")>
				<cfheader statusCode="201" statusText="Successfully added User">
				<cfheader name ="userID" value="#id#">
			<cfelse>
				<cfheader statusCode="500" statusText="Something went wrong">
			</cfif>
		<cfelse>
			<cfheader statusCode="400" statusText="#checkReturnStr#">
		</cfif>
	</cffunction>
	
	<cffunction name="updateUser" access="remote" httpmethod="POST">
		<cfargument name="id" type="string" default="">
		<cfargument name="name" type="string" default="">
		<cfargument name="surname" type="string" default="">
		<cfargument name="phoneNumber" type="string" default="">
		<cfargument name="email" type="string" default="">
		<cfargument name="address" type="string" default="">

		<cfset var req = GetHttpRequestData()>
		<cfif isDefined("req.content")>
			<cfset var data = deserializeJson(req.content)>

			<cfif isDefined("data.id")>
				<cfset arguments.id = data.id>
			</cfif>
			<cfif isDefined("data.name")>
				<cfset arguments.name = data.name>
			</cfif>
			<cfif isDefined("data.surname")>
				<cfset arguments.surname = data.surname>
			</cfif>
			<cfif isDefined("data.phoneNumber")>
				<cfset arguments.phoneNumber = data.phoneNumber>
			</cfif>
			<cfif isDefined("data.email")>
				<cfset arguments.email = data.email>
			</cfif>
			<cfif isDefined("data.address")>
				<cfset arguments.address = data.address>
			</cfif>
		</cfif>
		
		<cfset userToBeUpdated = getUser(arguments.id)>

		<cfif isDefined("userToBeUpdated")>
			<cfset var performUpdate = true>
			<cfset var totalInputCheckCnt = 5>
			<cfset var equalInputCnt = 0>
			<cfset var checkReturnStr = "">
			
			<cfset check = checkInput("name", arguments.name)>
			<cfif check EQ true>
				<cfif userToBeUpdated.getName() NEQ arguments.name>
					<cfset userToBeUpdated.setName(arguments.name)>
				<cfelse>
					<cfset equalInputCnt++>
				</cfif>
			<cfelse>
				<cfset performUpdate = false>
				<cfset checkReturnStr = check>
			</cfif>

			<cfset check = checkInput("surname", arguments.surname)>
			<cfif check EQ true>
				<cfif userToBeUpdated.getSurname() NEQ arguments.surname>
					<cfset userToBeUpdated.setSurname(arguments.surname)>
				<cfelse>
					<cfset equalInputCnt++>
				</cfif>
			<cfelse>
				<cfset performUpdate = false>
				<cfif checkReturnStr EQ "">
					<cfset checkReturnStr = check>
				<cfelse>
					<cfset checkReturnStr = checkReturnStr & ", " & check>
				</cfif>
			</cfif>
			
			<cfset check = checkInput("phoneNumber", arguments.phoneNumber)>
			<cfif check EQ true>
				<cfif userToBeUpdated.getPhoneNumber() NEQ arguments.phoneNumber>
					<cfset userToBeUpdated.setPhoneNumber(arguments.phoneNumber)>
				<cfelse>
					<cfset equalInputCnt++>
				</cfif>
			<cfelse>
				<cfset performUpdate = false>
				<cfif checkReturnStr EQ "">
					<cfset checkReturnStr = check>
				<cfelse>
					<cfset checkReturnStr = checkReturnStr & ", " & check>
				</cfif>
			</cfif>
			
			<cfset check = checkInput("email", arguments.email)>
			<cfif check EQ true>
				<cfif userToBeUpdated.getEmail() NEQ arguments.email>
					<cfset userToBeUpdated.setEmail(arguments.email)>
				<cfelse>
					<cfset equalInputCnt++>
				</cfif>
			<cfelse>
				<cfset performUpdate = false>
				<cfif checkReturnStr EQ "">
					<cfset checkReturnStr = check>
				<cfelse>
					<cfset checkReturnStr = checkReturnStr & ", " & check>
				</cfif>
			</cfif>
			
			<cfset check = checkInput("address", arguments.address)>
			<cfif check EQ true>
				<cfif userToBeUpdated.getAddress() NEQ arguments.address>
					<cfset userToBeUpdated.setAddress(arguments.address)>
				<cfelse>
					<cfset equalInputCnt++>
				</cfif>
			<cfelse>
				<cfset performUpdate = false>
				<cfif checkReturnStr EQ "">
					<cfset checkReturnStr = check>
				<cfelse>
					<cfset checkReturnStr = checkReturnStr & ", " & check>
				</cfif>
			</cfif>
			
			<cfif performUpdate AND equalInputCnt NEQ totalInputCheckCnt>
				<cfset usersDAO.updateUser(arguments.id)>
				<cfheader statusCode="201" statusText="Successfully updated User with id: #arguments.id#">
			<cfelse>
				<cfif checkReturnStr EQ "">
					<cfheader statusCode="400" statusText="At least one of the values need to be different from it's old value">
				<cfelse>
					<cfheader statusCode="400" statusText="#checkReturnStr#">
				</cfif>
			</cfif>
		</cfif>
	</cffunction>
	
	<cffunction name="getUser" access="remote" returnFormat="json" httpmethod="GET">
		<cfargument name="id" type="string" default="" >

		<cfset var req = GetHttpRequestData()>
		<cfif isDefined("req.content")>
			<cfset var data = deserializeJson(req.content)>
			<cfif isDefined("data.id")>
				<cfset arguments.id = data.id>
			</cfif>
		</cfif>

		<cfset check = checkInput("id", arguments.id)>
		<cfif check EQ true>
			<cfset user = usersDAO.getUser(arguments.id)>
			<cfif isDefined("user")>
				<cfreturn user>
			<cfelse>
				<cfheader statusCode="400" statusText="User with that id does not exist">
			</cfif>
		<cfelse>
			<cfheader statusCode="400" statusText="#check#">
		</cfif>
	</cffunction>
	
	<cffunction name="deleteUser" access="remote" >
		<cfargument name="id" type="string" default="" >
		
		<cfset var req = GetHttpRequestData()>
		<cfif isDefined("req.content")>
			<cfset var data = deserializeJson(req.content)>
			<cfif isDefined("data.id")>
				<cfset arguments.id = data.id>
			</cfif>
		</cfif>
		<cfset check = checkInput("id", arguments.id)>
		<cfif check EQ true>
			<cfset user = usersDAO.getUser(arguments.id)>
			<cfif isDefined("user")>
				<cfset usersDAO.deleteUser(arguments.id)>
				<cfheader statusCode="201" statusText="User with id: #arguments.id# deleted successfully">
			<cfelse>
				<cfheader statusCode="400" statusText="User with that id does not exist">
			</cfif>
		<cfelse>
			<cfheader statusCode="400" statusText="#check#">
		</cfif>
	</cffunction>
	
	<cffunction name="getUsers" access="remote" returnFormat="json" httpmethod="GET">
		<cfreturn usersDAO.getUsers()>
	</cffunction>

	<cffunction  name="checkInput" returnType="any">
		<cfargument name="inputType" type="string">
		<cfargument name="input" type="string">
		<cfif isDefined("input") AND arguments.input NEQ "" AND replace("#arguments.input#"," ","","all") NEQ "">
			<cfswitch expression="#inputType#">
				<cfcase value="id">
					<cfif isValid("integer", arguments.input)>
						<cfreturn true>
					<cfelse>
						<cfreturn "ID is not valid">
					</cfif>
				</cfcase>
				<cfcase value="phoneNumber">
					<cfif isValid("telephone", arguments.input)>
						<cfreturn true>
					<cfelse>
						<cfreturn "Phone Number is not valid">
					</cfif>
				</cfcase>
				<cfcase value="email">
					<cfif isValid("email", arguments.input)>
						<cfreturn true>
					<cfelse>
						<cfreturn "E-Mail is not valid">
					</cfif>
				</cfcase>
				<cfdefaultcase> 
					<cfreturn true>
				</cfdefaultcase>
			</cfswitch>
		</cfif>
		<cfreturn "#uCaseFirstLetter(arguments.inputType)# cannot be empty">
	</cffunction>

	<cffunction  name="uCaseFirstLetter" returnType="string">
		<cfargument name="string" type="string">
		<cfreturn uCase(left(arguments.string, 1 )) & right(arguments.string, len(arguments.string) - 1 )>
	</cffunction>
</cfcomponent>