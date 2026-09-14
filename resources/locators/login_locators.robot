*** Variables ***
# Locator rieng cho luong Login

${TXT_PHONE_NUMBER}     id=:r2:
${TXT_PASSWORD}         id=:r3:

${BTN_LOGIN}            css=button[type=submit]
${BTN_SHOW_PW}          css=button[aria-label="toggle password visibility"]

${LBL_MSG_PHONE}            id=:r2:-helper-text
${LBL_MSG_PASSWORD}         id=:r3:-helper-text

&{LBL_ERROR_MSG}
...     phone=${LBL_MSG_PHONE}
...     password=${LBL_MSG_PASSWORD}
