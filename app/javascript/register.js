var avatarInputElement = window.document.getElementById("user_img")
var avatarRegisterImg = window.document.getElementById("avatar-register-img")

    var handleClickAvatarRegisterImg = (e) => {
        avatarInputElement.click()
    }

    var handleChangeAvatarInputElement = (e) => {
        const [file] = avatarInputElement.files
        if (file) {
            avatarRegisterImg.src = URL.createObjectURL(file)
        }
    }
    avatarRegisterImg?.addEventListener("click", handleClickAvatarRegisterImg)
    avatarInputElement?.addEventListener("change", handleChangeAvatarInputElement)