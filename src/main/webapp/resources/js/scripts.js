document.addEventListener("DOMContentLoaded", function () {
    const body = document.body;
    const btn = document.getElementById("btnSidebar");
    const overlay = document.querySelector(".sidebar-overlay");

    if (!btn) return;

    const MOBILE_WIDTH = 992;

    function toggleSidebar() {
        body.classList.toggle("sidebar-collapsed");
    }

    function closeSidebar() {
        body.classList.add("sidebar-collapsed");
    }

    function openSidebar() {
        body.classList.remove("sidebar-collapsed");
    }

    // Click button to toggle
    btn.addEventListener("click", toggleSidebar);

    // Click overlay to close
    if (overlay) {
        overlay.addEventListener("click", closeSidebar);
    }

    // **ALWAYS START COLLAPSED** - removed auto-open logic
    closeSidebar();

    // Responsive resize - always close on mobile
    window.addEventListener("resize", function () {
        if (window.innerWidth <= MOBILE_WIDTH) {
            closeSidebar();
        }
    });

    // ESC key to close sidebar
    document.addEventListener("keydown", function (e) {
        if (e.key === "Escape") {
            closeSidebar();
        }
    });

    // Close sidebar when navigating to new page
    window.addEventListener("beforeunload", function () {
        closeSidebar();
    });
});