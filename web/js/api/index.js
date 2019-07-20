var api = {
    'logout':'users/logout',
    'login': 'users/login',
    'register': 'users/register',
    'userInfo': 'users/info'
};

function axios(option){
    var dtd = $.Deferred();
    $.ajax({
        ...option,
        success: function (res) {
            dtd.resolve(res);
        },
        error: function (error) {
            dtd.reject(error);
        }
    });
    return dtd.promise()
}
