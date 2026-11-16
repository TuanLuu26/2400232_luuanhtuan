# Bài kiểm tra thực hành: Linux và Lập trình Mã nguồn mở

## Thông tin sinh viên
- **Họ và tên:** Lưu Anh Tuấn
- **MSSV:** 2400232
- **Thư mục bài làm:** `2400232_luuanhtuan_linux`
- **Repository:** `https://github.com/TuanLuu26/2400232_luuanhtuan`

## Giới thiệu bài thực hành
Bài thực hành rèn luyện kỹ năng thao tác trên môi trường Linux (Ubuntu/WSL2), lập trình Shell Script kiểm tra hệ thống, xử lý dữ liệu văn bản, sao lưu dữ liệu và quản lý mã nguồn bằng Git & GitHub.

## Mô tả chức năng từng script
- **`scripts/hethong.sh`**: Hiển thị tên người dùng, tên máy tính, ngày giờ hiện tại, phiên bản Linux Kernel, dung lượng RAM (`free -h`), dung lượng ổ đĩa (`df -h`), kiểm tra kết nối tới `google.com.vn` và ghi toàn bộ kết quả vào `logs/hethong.log`.
- **`scripts/quanlysv.sh`**: Đọc dữ liệu từ `data/sinhvien.txt`, hiển thị menu lặp cho phép xem danh sách, tìm kiếm theo mã sinh viên, thống kê đạt/không đạt (điểm chuẩn 5.0), tính điểm trung bình, hiển thị sinh viên điểm cao nhất và sắp xếp điểm giảm dần.
- **`scripts/saoluu.sh`**: Kiểm tra sự tồn tại của thư mục `data`, nén thành `backup/backup_YYYYMMDD_HHMMSS.tar.gz`, ghi thời gian, tên file và trạng thái vào `logs/backup.log`, đồng thời hiển thị danh sách file đã sao lưu.

## Hướng dẫn cấp quyền và chạy chương trình
```bash
cd ~/2400232_luuanhtuan_linux
chmod +x scripts/hethong.sh scripts/quanlysv.sh scripts/saoluu.sh

./scripts/hethong.sh
./scripts/quanlysv.sh
./scripts/saoluu.sh
