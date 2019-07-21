function registerFunction(){
    let username = document.getElementById("inputUsername").value;
    let password = document.getElementById("inputPassword").value;
    let email = document.getElementById("inputEmail").value;
    let number = document.getElementById("inputNumber").value;
    let address = document.getElementById("inputAddress").value;
    let checkPassword = /^(?![a-z0-9]+$)(?![A-Za-z]+$)(?![A-Z0-9]+$)[a-zA-Z0-9]{6,10}$/;
    let checkEmail = /^[a-z0-9A-Z]+[- |a-z0-9A-Z._]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\.)+[a-z]{2,}$/;
    if(username===''){
        alert("用户名不能为空");
        return false;
    }
    if(password===''){
        alert("密码不能为空");
        return false;
    }
    if(email===''){
        alert("邮箱不能为空");
        return false;
    }
    if(number===''){
        alert("号码不能为空");
        return false;
    }
    if(address===''){
        alert("地址不能为空");
        return false;
    }
    if(username.length < 4 || username.length > 15) {
        alert("用户名长度4至15位，包含4和15！");
        return false;
    }
    if(checkPassword.test(password) === false) {
        alert("密码必须包含数字和大小写字母，长度6至10位，包含6和10！");
        return false;
    }
    if(checkEmail.test(email) === false) {
        alert("邮箱格式不正确！");
        return false;
    }
    return true;
}