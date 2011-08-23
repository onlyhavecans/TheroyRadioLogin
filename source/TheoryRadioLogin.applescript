--  TheoryRadioLogin.applescript
--
--  Created by theBunnyMan on 2009-04-25.
--  Copyright (c) 2009 White Rabbit Code. All rights reserved.
--
(*
This is a script for linking up to theory radio!
I created it cause I am LAZY and feel anything that needs to be done quickly or repeditivly should be scripted ^_^
DO NOT DISTRIBUTE!!!!

Also this assumes four things.
1) You are using a Mac... duh
2) You have not ripped safari off your machine
2) You use Nicecast for broadcasting
3) Nicecast is all ready configured to connect to theory radio by default (optionally archiving is also already set up)
*)

on run
	
	set theoryURL to "http://admin@broadcast.theoryradio.org:8000/admin.cgi"
	set theoryKickURL to "?mode=kicksrc"
	
	-- Launch our apps FIRST before we propmt the user to make the actual actions quicker
	tell app "Nicecast"
		activate
		set monitor volume to 0
	end tell
	
	-- We also open the admin interface so you can log in for the second command to work
	tell app "Safari"
		activate
		open document
		set URL of document 1 to theoryURL
	end tell
	
	-- The Dialog 
	display dialog "Are you ready? Make sure you logged in first! This will boot the stream and start you!" ¬
		with icon 1 ¬
		buttons {"Cancel", "OK"} ¬
		default button "OK"
	set button_pressed to button returned of result
	if button_pressed is "OK" then
		
		tell app "Safari"
			set URL of document 1 to theoryURL & theoryKickURL
		end tell
		
		tell app "Nicecast"
			-- Feel free to uncomment out the line below if you want to force archive to start
			--start archiving
			start broadcast
		end tell
		
		tell app "Safari"
			activate
			set URL of document 1 to theoryURL
		end tell
				
	end if

end run