var avatarEditUser = window.document.getElementById("user_img")
var avatarEditImg = window.document.getElementById("user_image_tag")

var handleClickAvatarRegisterImg3 = (e) => {
    avatarEditUser.click()
}

var handleChangeAvatarInputElement3 = (e) => {
    const [file] = avatarEditUser.files
    if (file) {
        avatarEditImg.src = URL.createObjectURL(file)
    }
}
avatarEditImg?.addEventListener("click", handleClickAvatarRegisterImg3)
avatarEditUser?.addEventListener("change", handleChangeAvatarInputElement3)