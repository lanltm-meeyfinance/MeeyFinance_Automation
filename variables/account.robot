*** Variables ***
${VALID_PHONE}      0941019623

${INVALID_PHONE}    012345678

${NOT_EXIST_PHONE}   0988877713

${VALID_PASSWORD}   Lan.04062003

${INVALID_PASSWORD}     12345678

//Dictionary
&{VALID_ACCOUNT}
...     phone=0941019623
...     password=Lan.04062003

&{WRONG_PASSWORD-ACCOUNT}
...     phone=0941019623
...     password=123456
...     expected=Mật khẩu không chính xác. Vui lòng kiểm tra và thử lại.

&{INVALID_PHONE_ACCOUNT}
...     phone=0912345634
...     password=Lan.04062003
...     expected=Số điện thoại không hợp lệ.

&{NOT_EXIST_ACCOUNT}
...    phone=0999999999
...    password=Lan.04062003
...    expected=Tài khoản không tồn tại.


