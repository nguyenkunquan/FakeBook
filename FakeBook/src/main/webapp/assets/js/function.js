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
