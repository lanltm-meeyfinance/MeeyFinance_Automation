*** Settings ***
Resource    ../../resources/common.robot
Resource   ../../resources/keywords/login_keywords.robot
Resource   ../../variables/account.robot

Test Setup      Open Browser To Login Page
Test Teardown   Run Keywords
...     Capture Screenshot If Test Failed
...     AND
...     Close Browser Session

*** Test Cases ***
TC_Login_001_Login_Success
    [Documentation]     Verify customer can login successfully
    [Tags]      smoke       regression      login
    Login Succesfully      
    ...     ${VALID_ACCOUNT.phone}
    ...     ${VALID_ACCOUNT.password}

TC_Login_002_Login_Incorrect_Password
    [Documentation]     Verify customer cannot login successfully with incorrect password
    [Tags]      smoke             login
    Login Failed     
    ...     ${WRONG_PASSWORD_ACCOUNT.phone}
    ...     ${WRONG_PASSWORD_ACCOUNT.password}
    ...     ${WRONG_PASSWORD_ACCOUNT.error_field}
    ...     ${WRONG_PASSWORD_ACCOUNT.expected}

TC_Login_003_Login_Invalid_Phone
    [Documentation]     Verify customer cannot login successfully with invalid phone number

    [Tags]      smoke      login
    Login Failed      
    ...     ${INVALID_PHONE_ACCOUNT.phone}
    ...     ${INVALID_PHONE_ACCOUNT.password}
    ...     ${INVALID_PHONE_ACCOUNT.error_field}
    ...     ${INVALID_PHONE_ACCOUNT.expected}

TC_Login_004_Login_Not_Exist_Phone
    [Documentation]     Verify customer cannot login successfully with not exists phone number

    [Tags]      smoke             login
    Login Failed      
    ...     ${NOT_EXIST_ACCOUNT.phone}
    ...     ${NOT_EXIST_ACCOUNT.password}
    ...     ${NOT_EXIST_ACCOUNT.error_field}
    ...     ${NOT_EXIST_ACCOUNT.expected}


