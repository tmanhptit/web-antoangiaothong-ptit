let countdownTime = 8 * 60 - 1; // 8 phút
let interval; // Biến lưu trữ interval

function startCountdown() {
    countdownTime = 8 * 60 - 1; // Reset thời gian về 8 phút
    const countdownElement = document.getElementById("countdown");

    clearInterval(interval); // Dừng interval hiện tại nếu có

    interval = setInterval(() => {
        const minutes = Math.floor(countdownTime / 60);
        const seconds = countdownTime % 60;
        const formattedSeconds = seconds < 10 ? `0${seconds}` : seconds;
        countdownElement.textContent = `${minutes}:${formattedSeconds}`;
        countdownTime--;

        // Khi hết thời gian, dừng bộ đếm và hiển thị 00:00
        if (countdownTime < 0) {
            clearInterval(interval);
            countdownElement.textContent = "00:00";
        }
    }, 1000);
}

// Dừng bộ đếm khi modal bị đóng
document.getElementById('paymentModal').addEventListener('hidden.bs.modal', () => {
    clearInterval(interval);
});

// Bắt đầu đếm ngược khi modal được hiển thị
document.getElementById('paymentModal').addEventListener('shown.bs.modal', startCountdown);
