function reloadPage() {
    // Save current scroll position in session storage
    sessionStorage.setItem('scrollPosition', window.scrollY);

    // Reload page
    location.reload();
}

// Restore scroll position on page load
window.onload = function() {
    var scrollPosition = sessionStorage.getItem('scrollPosition');
    if (scrollPosition !== null) {
        window.scrollTo(0, scrollPosition);
    }
};
