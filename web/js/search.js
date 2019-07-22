function searchFunction(){
    let name = document.getElementById("inputName").value;
    let description = document.getElementById("inputDescription").value;
    let location = document.getElementById("inputLocation").value;
    if(name===''&& description===''&&location===''){
        alert("请至少输入一项搜索");
        return false;
    }
    return true;
}