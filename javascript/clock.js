$(document).ready(function() {
    setInterval(timestamp, 1000);
});

function timestamp() {
    $.ajax({
        url: 'timestamp.php',
        success: function(data) {
            $('#timestamp').html(data);
        },
    });
}
