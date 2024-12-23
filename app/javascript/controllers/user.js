document.addEventListener("turbo:load", function () {
    const userName = document.getElementById("userName");
    const userMenu = document.getElementById("userMenu");

    if (userName && userMenu) {
        userName.addEventListener("click",  (e) => {
            e.preventDefault();
            userMenu.classList.toggle("show");
        });

        document.addEventListener("click",  (e) => {
            if (!userMenu.contains(e.target) && e.target !== userName) {
                userMenu.classList.remove("show");
            }
        });
    }
});