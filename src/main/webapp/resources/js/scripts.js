document.addEventListener('DOMContentLoaded', function () {
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('main-content');
    const sidebarOverlay = document.getElementById('sidebar-overlay');

    // select any possible toggle buttons used in templates
    const toggles = Array.from(document.querySelectorAll('#sidebarToggle, #sidebarCollapse, #sidebarCollapseTop, .sidebar-toggle, [data-toggle="sidebar"]'));

    function isMobile() {
        return window.innerWidth <= 768;
    }

    function setAriaExpanded(button, expanded) {
        if (!button) return;
        try {
            button.setAttribute('aria-expanded', expanded ? 'true' : 'false');
        } catch (e) { /* ignore */
        }
    }

    function openMobileSidebar() {
        if (!sidebar) return;
        sidebar.classList.add('show');
        if (sidebarOverlay) sidebarOverlay.classList.add('show');
        // set aria on toggles
        toggles.forEach(t => setAriaExpanded(t, true));
        document.body.style.overflow = 'hidden';
    }

    function closeMobileSidebar() {
        if (!sidebar) return;
        sidebar.classList.remove('show');
        if (sidebarOverlay) sidebarOverlay.classList.remove('show');
        toggles.forEach(t => setAriaExpanded(t, false));
        document.body.style.overflow = '';
    }

    function toggleDesktopCollapse() {
        if (!sidebar) return;
        sidebar.classList.toggle('collapsed');
        if (mainContent) mainContent.classList.toggle('expanded');
        const collapsed = sidebar.classList.contains('collapsed');
        toggles.forEach(t => setAriaExpanded(t, !collapsed));
    }

    function toggleSidebar(e) {
        // prevent unexpected form submits / links
        if (e) e.preventDefault();

        if (!sidebar) return;

        if (isMobile()) {
            if (sidebar.classList.contains('show')) closeMobileSidebar();
            else openMobileSidebar();
        } else {
            toggleDesktopCollapse();
        }
    }

    // attach listeners to all toggles
    toggles.forEach(btn => {
        if (!btn) return;
        btn.addEventListener('click', toggleSidebar);
    });

    // overlay click closes mobile sidebar
    if (sidebarOverlay) {
        sidebarOverlay.addEventListener('click', function () {
            closeMobileSidebar();
        });
    }

    // Close sidebar with Escape key (mobile)
    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape' || e.key === 'Esc') {
            if (sidebar && sidebar.classList.contains('show')) closeMobileSidebar();
        }
    });

    // Add data-tooltip attributes for collapsed mode (used in CSS ::after)
    if (sidebar) {
        const menuLinks = sidebar.querySelectorAll('.components li a, .list-unstyled.components li a');
        menuLinks.forEach(link => {
            const textEl = link.querySelector('.menu-text') || link.querySelector('span');
            const text = textEl ? textEl.textContent.trim() : link.textContent.trim();
            if (text) link.setAttribute('data-tooltip', text);
        });
    }

    // Ensure layout adapts on resize: if switching between mobile and desktop, reset classes
    let resizeTimeout;
    window.addEventListener('resize', function () {
        clearTimeout(resizeTimeout);
        resizeTimeout = setTimeout(function () {
            if (!sidebar) return;
            if (isMobile()) {
                // if mobile, remove collapsed desktop state so sidebar can slide in
                sidebar.classList.remove('collapsed');
                if (mainContent) mainContent.classList.remove('expanded');
                toggles.forEach(t => setAriaExpanded(t, false));
            } else {
                // remove mobile show/overlay if present
                sidebar.classList.remove('show');
                if (sidebarOverlay) sidebarOverlay.classList.remove('show');
                document.body.style.overflow = '';
            }
        }, 150);
    });
});
