*** Variables ***
# Locator rieng cho luong Register
# Dien locator thuc te vao day, giu quy uoc dat ten TXT_/BTN_/LBL_ nhu login_locators.robot

${BTN_REGISTER_NOW}         //a[@href="/signup"]
${TXT_REGISTER_PHONE}       //input[@id=":r4:"]
${TXT_REGISTER_EMAIL}       //input[@id=":r5:"]
${TXT_REFERRAL_CODE}        //input[@id=":r6:"]"
${CHK_AGREE_TERMS}          //input[@name='checked']
${BTN_REGISTER_CONTINUE}    //button[@type="submit"]

# Locator bao loi
${LBL_MSG_REGISTER_PHONE}     //p[@id=":r4:-helper-text"]
${LBL_MSG_REGISTER_EMAIL}     //p[@id=":r5:-helper-text"]
${LBL_MSG_REGISTER_REFERRAL_CODE}     //p[@id=":r6:-helper-text"]

&{LBL_REGISTER_ERROR_MSG}
...     phone=${LBL_MSG_REGISTER_PHONE}
...     email=${LBL_MSG_REGISTER_EMAIL}
...     referral_code=${LBL_MSG_REGISTER_REFERRAL_CODE}

