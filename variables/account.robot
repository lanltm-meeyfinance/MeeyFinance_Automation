*** Variables ***

&{VALID_ACCOUNT}
...     phone=0941019623
...     password=Lan.04062003

&{WRONG_PASSWORD_ACCOUNT}
...     phone=0941019623
...     password=123456
...     error_field=password
...     expected=Mật khẩu không chính xác. Vui lòng kiểm tra và thử lại

&{INVALID_PHONE_ACCOUNT}
...     phone=09123456
...     password=Lan.04062003
...     error_field=phone
...     expected=Số điện thoại không hợp lệ

&{NOT_EXIST_ACCOUNT}
...    phone=0999999999
...    password=Lan.04062003
...    error_field=phone
...    expected=Số điện thoại không tồn tại. Vui lòng kiểm tra lại


