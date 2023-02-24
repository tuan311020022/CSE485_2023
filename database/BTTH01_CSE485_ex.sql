

/*Liệt kê các bài viết về các bài hát thuộc thể loại Nhạc trữ tình*/
SELECT * FROM baiviet WHERE ma_tloai=2



/*Liệt kê các bài viết của tác giả “Nhacvietplus” */
SELECT * FROM baiviet WHERE ma_tgia=1

/*Liệt kê các thể loại nhạc chưa có bài viết cảm nhận nào.*/
SELECT * FROM baiviet 

/*Liệt kê các bài viết với các thông tin sau: mã bài viết, tên bài viết, tên bài hát, tên tác giả, tên 
thể loại, ngày viết. */
SELECT * FROM baiviet WHERE ma_bviet=?;
SELECT * FROM baiviet WHERE tieude=?;
SELECT * FROM baiviet WHERE ma_bhat=?;
SELECT * FROM baiviet WHERE ma_bhat=?;

Select ma_tloai, count(1) SO_LAN_XUAT_HIEN
FROM baiviet
Group By ma_tloai


/*Tìm thể loại có số bài viết nhiều nhất*/
SELECT ma_tloai, COUNT(*)  SO_LAN_XUAT_HIEN_nhieu_nhat
from baiviet
 GROUP BY ma_tloai
HAVING COUNT(*) >= ( SELECT MAX(SO_LAN_XUAT_HIEN_nhieu_nhat)
                       FROM (SELECT COUNT(*) AS SO_LAN_XUAT_HIEN_nhieu_nhat
                               FROM baiviet
                              GROUP BY ma_tloai) TMP);
	/*Liệt kê 2 tác giả có số bài viết nhiều nhất*/
   
   
   SELECT ma_tgia, COUNT(*)  SO_LAN_XUAT_HIEN_nhieu_nhat
from baiviet
 GROUP BY ma_tgia
HAVING COUNT(*) >= ( SELECT top(2)* MAX(SO_LAN_XUAT_HIEN_nhieu_nhat)
                       from (SELECT COUNT(*) AS SO_LAN_XUAT_HIEN_nhieu_nhat
                               FROM baiviet
                              GROUP BY ma_tgia) TMP);
SELECT ma_tgia, COUNT(*)  SO_LAN_XUAT_HIEN_nhieu_nhat
from baiviet
 GROUP BY ma_tgia
HAVING COUNT(*) >= ( SELECT top(2)* MAX(SO_LAN_XUAT_HIEN_nhieu_nhat)
                       from (SELECT COUNT(*) AS SO_LAN_XUAT_HIEN_nhieu_nhat
                               FROM baiviet
                              GROUP BY ma_tgia) TMP);
/*liệt kê các bài viết có tự bài hát chứa 1 trong các từ "yêu","thương","anh","em"*/
SELECT*from baiviet where ten_bhat like '%yêu%'or  ten_bhat like '%thương%' or ten_bhat like '%anh%'or ten_bhat like '%em%';

/*Liệt kê các bài viết về các bài hát có tiêu đề bài viết hoặc tựa bài hát chứa 1 trong các từ  "yêu","thương","anh","em"*/

select*from baiviet where ten_bhat like '%yêu%'or  ten_bhat like '%thương%' or ten_bhat like '%anh%'or ten_bhat like '%em%'or tieude  like '%yêu%' or tieude  like '%thương%' or tieude  like '%anh%' or tieude  like '%em%';

--  Bổ sung thêm bảng Users để lưu thông tin Tài khoản đăng nhập và sử dụng cho chức năng  Đăng nhập/Quản trị trang web
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`) VALUES
(1, 'admin1', 'admin1'),
(2, 'admin2', 'admin2');