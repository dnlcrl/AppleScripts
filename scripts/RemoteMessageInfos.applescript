(*	to use this script you also need:
		MessageWithSnap.scpt
		MessageWithPublicIP.scpt
	place all files in your iChat scripts folder and select this file from iMessage's Applescript manager settings*)

using terms from application "Messages"
	
	on run_script(_scriptName)
		tell application "Finder"
			set _myPath to container of (path to me) as text
		end tell
		
		run script (alias (_myPath & _scriptName))
	end run_script
	
	
	-- handler to respond to all incoming messages.
	on runRemoteControl(theMessage, theBuddyName)
		
		(*-- use default "unknown" command, just in case.
		set theResponse to "Unknown command."*)
		set theResponse to ""
		if theBuddyName is "Daniele Ciriello" then -- check if the message is from trusted user
			if (theMessage is "snapshot") then
				
				run_script("MessageWithSnapPrivate.scpt") -- remove Private to make it work
				
			else if (theMessage is "ip") then
				
				run_script("MessageWithPublicIPPrivate.scpt") -- remove Private to make it work
				
			end if
			
		end if
		return theResponse
	end runRemoteControl
	
	-- When first message is received, accept the invitation and pass the message directly to the Remote Control.
	on received text invitation theMessage from theBuddy for theChat
		accept theChat
		
		-- run the Remote Control parser.
		set theResponse to runRemoteControl(theMessage, full name of theBuddy)
		
		-- send back the response.		
		send theResponse to theChat
	end received text invitation
	
	-- On subsequent messages, pass the message directly to Remote Control.
	on message received theMessage from theBuddy for theChat
		
		-- run the Remote Control parser.
		set theResponse to runRemoteControl(theMessage, full name of theBuddy)
		
		-- send back the response.		
		send theResponse to theChat
		
	end message received
	
	-- Sample, so you can test run this through Script Editor.
	display dialog "Send a command to iTunes Remote Control:" default answer "yo"
	set theMessage to the text returned of the result
	set theResponse to runRemoteControl(theMessage, "Daniele Ciriello")
	display dialog theResponse
	
	# The following are unused but need to be defined to avoid an error
	
	on received audio invitation theText from theBuddy for theChat
		
	end received audio invitation
	
	on received video invitation theText from theBuddy for theChat
		
	end received video invitation
	
	on received remote screen sharing invitation from theBuddy for theChat
		
	end received remote screen sharing invitation
	
	on received local screen sharing invitation from theBuddy for theChat
		
	end received local screen sharing invitation
	
	on received file transfer invitation theFileTransfer
		
	end received file transfer invitation
	
	on buddy authorization requested theRequest
		
	end buddy authorization requested
	
	on message sent theMessage for theChat
		
	end message sent
	
	on chat room message received theMessage from theBuddy for theChat
		
	end chat room message received
	
	on active chat message received theMessage
		
	end active chat message received
	
	on addressed chat room message received theMessage from theBuddy for theChat
		
	end addressed chat room message received
	
	on addressed message received theMessage from theBuddy for theChat
		
	end addressed message received
	
	on av chat started
		
	end av chat started
	
	on av chat ended
		
	end av chat ended
	
	on login finished for theService
		
	end login finished
	
	on logout finished for theService
		
	end logout finished
	
	on buddy became available theBuddy
		
	end buddy became available
	
	on buddy became unavailable theBuddy
		
	end buddy became unavailable
	
	on completed file transfer
		
	end completed file transfer
	
end using terms from
