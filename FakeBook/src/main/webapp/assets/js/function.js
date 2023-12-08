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
/* CỦA QUÂN ĐỪNG XÓA NHÉ */
/*-----------------------*/

document.getElementById('coverImage').addEventListener('click', function () {
    var form = document.getElementById('postForm-cover');
    form.style.display = form.style.display === 'none' ? 'block' : 'none';
});
document.getElementById('dashboard-img').addEventListener('click', function () {
    var form = document.getElementById('postForm-avatar');
    form.style.display = form.style.display === 'none' ? 'block' : 'none';
});
document.getElementById('myGender').addEventListener('click', function() {
    var form = document.getElementById('showFormGender');
    form.style.display = form.style.display === 'none' ? 'block' : 'none';
});
document.getElementById('myBirthday').addEventListener('click', function() {
    var form = document.getElementById('showFormBirthday');
    form.style.display = form.style.display === 'none' ? 'block' : 'none';
});
document.getElementById('myPhone').addEventListener('click', function() {
    var form = document.getElementById('showFormPhone');
    form.style.display = form.style.display === 'none' ? 'block' : 'none';
});
document.getElementById('myEmail').addEventListener('click', function() {
    var form = document.getElementById('showFormEmail');
    form.style.display = form.style.display === 'none' ? 'block' : 'none';
});

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
/* CỦA QUÂN ĐỪNG XÓA NHÉ */
/*-----------------------*/