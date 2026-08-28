*** Settings ***
Library     Browser
Library     BuiltIn
Resource    ../variables/env.robot

*** Keywords ***
Open Browser To Login Page
    New Browser     
    ...     ${BROWSER}
    ...      headless=${HEADLESS}
    New Context     viewport={'width': 1440, 'height': 900}
    Set Browser Timeout     ${TIMEOUT}
    New Page        ${BASE_URL}/login

Close Browser Session
    Close Browser

Capture Screenshot If Test Failed
    IF      '${TEST STATUS}' == 'FAIL'
        Take Screenshot
        ...     filename=${CURDIR}/../screenshots/${TEST NAME}_${TEST STATUS}.png
        ...     fullPage=True
    END