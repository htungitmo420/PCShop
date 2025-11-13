document.addEventListener("DOMContentLoaded", function () {
    const body = document.body;
    const btn = document.getElementById("btnSidebar");
    const overlay = document.querySelector(".sidebar-overlay");

    if (!btn) return;

    const MOBILE_WIDTH = 992;

    function toggleSidebar() {
        body.classList.toggle("sidebar-open");
        body.classList.toggle("sidebar-collapsed");
    }

    function closeSidebar() {
        body.classList.add("sidebar-collapsed");
        body.classList.remove("sidebar-open");
    }

    function openSidebar() {
        body.classList.add("sidebar-open");
        body.classList.remove("sidebar-collapsed");
    }

    btn.addEventListener("click", toggleSidebar);

    if (overlay) {
        overlay.addEventListener("click", closeSidebar);
    }

    // start collapsed
    closeSidebar();

    window.addEventListener("resize", function () {
        if (window.innerWidth <= MOBILE_WIDTH) {
            closeSidebar();
        }
    });
});