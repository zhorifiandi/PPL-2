$("#login-btn").popover({
    html: true,
    placement: "bottom",
    trigger: "hover",
    title: function () {
        return $("#popover-title").html();
    },
    content: function () {
        return $("#popover-content").html();
    }
});