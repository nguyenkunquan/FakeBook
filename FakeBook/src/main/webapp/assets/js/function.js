var userSettings = document.querySelector(".user-settings");
var darkBtn = document.getElementById("dark-button");
var LoadMoreBackground =document.querySelector(".btn-LoadMore");
function UserSettingToggle(){
    userSettings.classList.toggle("user-setting-showup-toggle");
}
// darkBtn.onclick = function(){
//     darkBtn.classList.toggle("dark-mode-on");
// }

function darkModeON(){
    darkBtn.classList.toggle("dark-mode-on");
   document.body.classList.toggle("dark-theme");
};

function LoadMoreToggle(){
    LoadMoreBackground.classList.toggle("loadMoreToggle");
};
function validateSearchForm() {
    var searchInput = document.getElementById('searchInput').value;

    // Kiểm tra nếu trường nhập trống
    if (searchInput.trim() === "") {
        //alert("Please enter a search term.");
        return false; // Ngăn chặn việc gửi biểu mẫu nếu trường nhập trống
    }

    // Tiếp tục gửi biểu mẫu nếu trường nhập không trống
    return true;
}

function BlurPost(){
//    var blur = document.getElementById("blur");
var popup = document.getElementById("popup");
//   blur.classList.toggle("active");
popup.classList.toggle("active");
        var popupElement = document.getElementById("select-post");
        popupElement.style.display = "none";

};

function deletePost(id) {
    // Lấy giá trị cusId dựa vào mã nguồn
    var posId = id; 
    
    // Chuyển hướng người dùng đến trang ./DeleteCustomerController với tham số cusId
    window.location.href = "./deletepost?posId=" + posId;
}
