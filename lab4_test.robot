
*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    /Users/thitikorn/Desktop/oodo/CP353004/SetupLAB4/ChromeForTesting/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing
${CHROME_DRIVER_PATH}     /Users/thitikorn/Desktop/oodo/CP353004/SetupLAB4/ChromeForTesting/chromedriver-mac-arm64/chromedriver
${URL}                    http://localhost:7272/Lab4/Registration.html
${SUCCESS_URL}            http://localhost:7272/Lab4/Success.html

*** Test Cases ***
UAT-Lab04-001-TC01: Register Success
    Open Chrome Browser
    Input Text    id=firstname    Somyod
    Input Text    id=lastname     Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email        somyod@kkumail.com
    Input Text    id=phone        091-001-1234
    Click Button    id=registerButton
    Sleep    2s
    Location Should Contain    Success.html
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.
    Close Browser

UAT-Lab04-001-TC02: Register Success No Organization
    Open Chrome Browser
    Input Text    id=firstname    Somyod
    Input Text    id=lastname     Sodsai
    Input Text    id=email        somyod@kkumail.com
    Input Text    id=phone        091-001-1234
    Click Button    id=registerButton
    Sleep    2s
    Location Should Contain    Success.html
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.
    Close Browser

UAT-Lab04-002-TC01: Empty First Name
    Open Chrome Browser
    Input Text    id=lastname     Sodyod
    Input Text    id=organization    CS KKU
    Input Text    id=email        somyod@kkumail.com
    Input Text    id=phone        091-001-1234
    Click Button    id=registerButton
    Sleep    2s
    Location Should Be    ${URL}
    Page Should Contain    Please enter your first name!!
    Close Browser

UAT-Lab04-002-TC02: Empty Last Name
    Open Chrome Browser
    Input Text    id=firstname    Somyod
    Input Text    id=organization    CS KKU
    Input Text    id=email        somyod@kkumail.com
    Input Text    id=phone        091-001-1234
    Click Button    id=registerButton
    Sleep    2s
    Location Should Be    ${URL}
    Page Should Contain    Please enter your last name!!
    Close Browser

UAT-Lab04-002-TC03: Empty First Name and Last Name
    Open Chrome Browser
    Input Text    id=organization    CS KKU
    Input Text    id=email        somyod@kkumail.com
    Input Text    id=phone        091-001-1234
    Click Button    id=registerButton
    Sleep    2s
    Location Should Be    ${URL}
    Page Should Contain    Please enter your name!!
    Close Browser

UAT-Lab04-002-TC04: Empty Email
    Open Chrome Browser
    Input Text    id=firstname    Somyod
    Input Text    id=lastname     Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=phone        091-001-1234
    Click Button    id=registerButton
    Sleep    2s
    Location Should Be    ${URL}
    Page Should Contain    Please enter your email!!
    Close Browser

UAT-Lab04-002-TC05: Empty Phone Number
    Open Chrome Browser
    Input Text    id=firstname    Somyod
    Input Text    id=lastname     Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email        somyod@kkumail.com
    Click Button    id=registerButton
    Sleep    2s
    Location Should Be    ${URL}
    Page Should Contain    Please enter your phone number!!
    Close Browser

UAT-Lab04-002-TC06: Invalid Phone Number
    Open Chrome Browser
    Input Text    id=firstname    Somyod
    Input Text    id=lastname     Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email        somyod@kkumail.com
    Input Text    id=phone        1234
    Click Button    id=registerButton
    Sleep    2s
    Location Should Be    ${URL}
    Page Should Contain    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)
    Close Browser

*** Keywords ***
Open Chrome Browser
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}=    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${URL}
