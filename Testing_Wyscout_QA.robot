*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary

*** Variables ***
${Testing}    Sheet1
${Random}   Invalid ID password

** Test Cases ***


Open Browser

		Open Browser   https://platformrc.wyscout.com/app/      chrome
		Maximize Browser Window
		Sleep 	5s
	
NegetiveTestCase	

		ExcelLibrary.Open Excel     C:\\Users\\ShivRekha\\Desktop\\MAIN TESTING\\Testing.xls
	
		${strRowCount}  Get Row Count   ${Testing}
		${strColumnCount}	Get Column Count   ${Testing}	
		Log To Console  \nRow are => ${strRowCount}
		Log To Console  \nColumn are => ${strColumnCount}
	
			FOR    ${Row}     IN RANGE	1	${strRowCount}
			
				Exit For Loop If    ${Row} == ${strRowCount}
				${Username}     Read Cell Data By Coordinates   	${Testing}    	0     ${Row}
				Input Text		xpath = //*[@id="login_username"] 	${Username}
				
				Sleep 	2s
			   
				${Password}     Read Cell Data By Coordinates   	${Testing}    	1     ${Row}
				Input Text		xpath = //*[@id="login_password"] 	${Password}	 
				capture page screenshot
				Sleep	2s
					
				Click Button    id = login_button
				Sleep   5s
					
				
				Page Should Contain 	Invalid username or password
				Click Element     xpath=/html/body/div[9]/div[2]/div[3]/div
				capture page screenshot
				Sleep   5s
			END
				Sleep	5s
	
Positive Test Cases	

				Input Text		xpath = //*[@id="login_username"]		ashishmashal5@gmail.com
				
				Input Text		xpath = //*[@id="login_password"]		pw_IndiaTest!  
				##Sleep   5s
            
				Click Button    id = login_button
				Sleep   5s
				capture page screenshot
				
DarkMode 
			##dark
            Click Element     xpath=/html/body/div[1]/div/div[1]/div[5]/div[1]/div[1]
            Sleep   5s
			capture page screenshot
			
Profile

			Click Element   xpath=/html/body/div[1]/div/div[1]/div[5]/div[2]/div/a
			capture page screenshot
            Sleep   5s
			
LogOut
			Sleep   5s
			Click Element   xpath=/html/body/div[12]/div[1]/div/div/div/div[3]/div[2]/a
			capture page screenshot					