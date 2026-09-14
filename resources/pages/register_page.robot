*** Settings ***
Library     Browser
Resource        ../locators/common_locators.robot
Resource        ../locators/register_locators.robot

*** Keywords ***

Click Register Now Link
    Click   ${BTN_REGISTER_NOW}

Input Register Phone Number
    [Arguments]     ${phone}
    Fill Text   ${TXT_REGISTER_PHONE}    ${phone}

Input Register Email
    [Arguments]     ${email}
    Fill Text   ${TXT_REGISTER_EMAIL}    ${email}

Input Referral Code
    [Arguments]     ${referral_code}
    Fill Text   ${TXT_REFERRAL_CODE}    ${referral_code}

Check Agree Terms
    Check Checkbox    ${CHK_AGREE_TERMS}

Click Register Continue Button
    Click   ${BTN_REGISTER_CONTINUE}

Verify Register Error
    [Arguments]    ${locator}    ${message}

    Wait For Elements State
    ...    ${locator}
    ...    visible

    ${actual_message}=    Get Text    ${locator}

    Should Be Equal As Strings
    ...    ${actual_message}
    ...    ${message}

# ----- Buoc 2: OTP -----

Input OTP Code
    [Arguments]     ${otp}
    Fill Text   ${TXT_OTP_INPUT}    ${otp}

Click OTP Confirm Button
    Click   ${BTN_OTP_CONFIRM}

Click OTP Resend Button
    Click   ${BTN_OTP_RESEND}

Verify OTP Error
    [Arguments]    ${message}

    Wait For Elements State
    ...    ${LBL_OTP_ERROR}
    ...    visible

    ${actual_message}=    Get Text    ${LBL_OTP_ERROR}

    Should Be Equal As Strings
    ...    ${actual_message}
    ...    ${message}

# ----- Buoc 3: Tao mat khau -----

Input New Password
    [Arguments]     ${password}
    Fill Text   ${TXT_NEW_PASSWORD}    ${password}

Input Confirm Password
    [Arguments]     ${password}
    Fill Text   ${TXT_CONFIRM_PASSWORD}    ${password}

Click Create Password Button
    Click   ${BTN_CREATE_PASSWORD}

Verify Create Password Error
    [Arguments]    ${message}

    Wait For Elements State
    ...    ${LBL_PASSWORD_ERROR}
    ...    visible

    ${actual_message}=    Get Text    ${LBL_PASSWORD_ERROR}

    Should Be Equal As Strings
    ...    ${actual_message}
    ...    ${message}

# ----- Popup sau khi tao mat khau thanh cong -----

Verify Register Success Popup Visible
    Wait For Elements State
    ...     ${POPUP_AFTER_REGISTER}
    ...     state=visible

Click Popup Login Now
    Click   ${BTN_POPUP_LOGIN_NOW}
