function loginFunction(){
    let username = document.getElementById("inputUsername").value;
    let password = document.getElementById("inputPassword").value;
    if(username===''){
        alert("用户名不能为空");
        return false;
    }
    if(password===''){
        alert("密码不能为空");
        return false;
    }
    return true;
}