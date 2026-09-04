*** Settings ***
Library     Browser
Resource    ../pages/login_page.robot
Resource    ../../variables/account.robot

*** Keywords ***

Login With Account
    [Arguments]     ${phone}    ${password}
    Input Phone Number      ${phone}
    Input Password          ${password}
    Click Login Button

Login Succesfully
    [Arguments]     ${phone}    ${password}
    Login With Account      ${phone}    ${password}
    Verify Login Success

Login Failed
    [Arguments]    ${phone}    ${password}  ${error_field}    ${expected_message}

    Login With Account
    ...    ${phone}
    ...    ${password}

    Verify Login Error
        ...    ${LBL_ERROR_MSG}[${error_field}]
        ...    ${expected_message}
    
Run Login Template
    [Arguments]
    ...    ${description}
    ...    ${phone}
    ...    ${password}
    ...    ${expected}
    ...    ${error_field}
    ...    ${message}

    Log To Console    ===== ${description} =====

    IF    '${expected}' == 'SUCCESS'
        Login Succesfully
        ...    ${phone}
        ...    ${password}
    ELSE
            Login Failed
        ...    ${phone}
        ...    ${password}
        ...    ${error_field}
        ...    ${message}
    END