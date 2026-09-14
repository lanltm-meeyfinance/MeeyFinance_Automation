*** Settings ***
Library     Browser
Resource        ../locators/common_locators.robot
Resource        ../locators/login_locators.robot

*** Keywords ***

Input Phone Number
    [Arguments]     ${phone}
    Fill Text   ${TXT_PHONE_NUMBER}    ${phone}

Input Password
    [Arguments]     ${password}
    Fill Text   ${TXT_PASSWORD}    ${password}

Click Login button
    Click   ${BTN_LOGIN}

Click Show Password
    Click   ${BTN_SHOW_PW}

Verify Login Success
    Wait For Elements State
    ...     ${LBL_DASHBOARD}
    ...     state=visible

Verify Login Error
    [Arguments]    ${locator}    ${message}

    Wait For Elements State
    ...    ${locator}
    ...    visible

    ${actual_message}=    Get Text    ${locator}

    Should Be Equal As Strings
    ...    ${actual_message}
    ...    ${message}
