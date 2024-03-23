var imagePublication = window.document.getElementById("publication_image")
var imageTagPublication = window.document.getElementById("avatar-register-img")

    var handleClickAvatarRegisterImg2 = (e) => {
        imagePublication.click()
    }

    var handleChangeAvatarInputElement2 = (e) => {
        const [file] = imagePublication.files
        if (file) {
            imageTagPublication.src = URL.createObjectURL(file)
        }
    }
    imageTagPublication?.addEventListener("click", handleClickAvatarRegisterImg2)
    imagePublication?.addEventListener("change", handleChangeAvatarInputElement2)