*** Variables ***

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


