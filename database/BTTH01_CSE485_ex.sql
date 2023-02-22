

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
/*liệt kê các bài viết có tự bài hát chứa 1 trong các từ "yêu","thương","anh","em"*/
SELECT*from baiviet where ten_bhat like '%yêu%';
SELECT*from baiviet where ten_bhat like '%thương%';
SELECT*from baiviet where ten_bhat like '%anh%';
SELECT*from baiviet where ten_bhat like '%em%';

/*Liệt kê các bài viết về các bài hát có tiêu đề bài viết hoặc tựa bài hát chứa 1 trong các từ  "yêu","thương","anh","em"*/

select*from baiviet where tieude or ten_bhat