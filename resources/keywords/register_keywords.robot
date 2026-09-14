*** Settings ***
Library     Browser
Resource    ../pages/register_page.robot
Resource    ../../variables/account.robot

*** Keywords ***

Fill Register Form Step 1
    [Arguments]     ${phone}    ${email}    ${referral_code}=${EMPTY}
    Input Register Phone Number    ${phone}
    Input Register Email           ${email}
    IF    '${referral_code}' != '${EMPTY}'
        Input Referral Code    ${referral_code}
    END
    Check Agree Terms

Register With Info
    [Arguments]     ${phone}    ${email}    ${referral_code}=${EMPTY}
    Fill Register Form Step 1    ${phone}    ${email}    ${referral_code}
    Click Register Continue Button

Register Failed
    [Arguments]    ${phone}    ${email}    ${referral_code}    ${error_field}    ${expected_message}

    Fill Register Form Step 1
    ...    ${phone}
    ...    ${email}
    ...    ${referral_code}

    Click Register Continue Button

    Verify Register Error
    ...    ${LBL_REGISTER_ERROR_MSG}[${error_field}]
    ...    ${expected_message}

# ----- Buoc 2: OTP -----

Get OTP From Telegram
    [Documentation]
    ...    TODO: Cam logic doc OTP tu Telegram vao day.
    ...    Goi y: viet 1 Python library trong libraries/ (vi du TelegramOtpReader.py)
    ...    dung Telegram Bot API de lay tin nhan OTP moi nhat, RETURN ve string OTP.
    ...    Truoc khi co logic that, co the tra ve gia tri co dinh de test cac buoc con lai.
    ${otp}=    Set Variable    000000
    RETURN    ${otp}

Verify OTP Step
    ${otp}=    Get OTP From Telegram
    Input OTP Code    ${otp}
    Click OTP Confirm Button

# ----- Buoc 3: Tao mat khau -----

Create Password Step
    [Arguments]    ${password}
    Input New Password        ${password}
    Input Confirm Password    ${password}
    Click Create Password Button

# ----- Toan bo luong -----

Register Successfully
    [Arguments]     ${phone}    ${email}    ${password}    ${referral_code}=${EMPTY}

    Register With Info    ${phone}    ${email}    ${referral_code}
    Verify OTP Step
    Create Password Step    ${password}
    Verify Register Success Popup Visible

Register And Choose Login Now
    [Arguments]     ${phone}    ${email}    ${password}    ${referral_code}=${EMPTY}
    Register Successfully    ${phone}    ${email}    ${password}    ${referral_code}
    Click Popup Login Now

Register And Choose Verify Account
    [Arguments]     ${phone}    ${email}    ${password}    ${referral_code}=${EMPTY}
    Register Successfully    ${phone}    ${email}    ${password}    ${referral_code}
    Click Popup Verify Account
