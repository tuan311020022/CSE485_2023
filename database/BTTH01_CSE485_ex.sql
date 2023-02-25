#Liệt kê các bài viết về các bài hát thuộc thể loại Nhạc trữ tình
select * from baiviet where baiviet.ma_tloai = "2";

#Liệt kê các bài viết của tác giả “Nhacvietplus”
select * from baiviet WHERE baiviet.ma_tgia = "1";

#Liệt kê các thể loại nhạc chưa có bài viết cảm nhận nào. 
select theloai.ten_tloai from theloai,baiviet WHERE theloai.ma_tloai=baiviet.ma_tloai and baiviet.noidung = null;

#Liệt kê các bài viết với các thông tin sau: mã bài viết, tên bài viết, tên bài hát, tên tác giả, tên thể loại, ngày viết.
SELECT baiviet.ma_bviet,baiviet.tieude,baiviet.ten_bhat,tacgia.ten_tgia,theloai.ten_tloai,baiviet.ngayviet from theloai,tacgia,baiviet 
WHERE baiviet.ma_tloai = theloai.ma_tloai and baiviet.ma_tgia=tacgia.ma_tgia;

#Tìm thể loại có số bài viết nhiều nhất 
SELECT theloai.ten_tloai from baiviet,theloai WHERE baiviet.ma_tloai=theloai.ma_tloai 
group by theloai.ten_tloai 
having count(theloai.ma_tloai) >= all(
	SELECT count(baiviet.ma_tloai) from baiviet
    group by baiviet.ma_tloai
);

#Liệt kê 2 tác giả có số bài viết nhiều nhất
SELECT tacgia.ten_tgia FROM tacgia,baiviet where tacgia.ma_tgia = baiviet.ma_tgia
group by tacgia.ten_tgia
having count(baiviet.ma_tgia) >= (
	SELECT top(2)  count(baiviet.ma_tgia)
    FROM baiviet
    group by baiviet.ma_tgia
    DESC
);

   
/*liệt kê các bài viết có tự bài hát chứa 1 trong các từ "yêu","thương","anh","em"*/
SELECT*from baiviet where ten_bhat like '%yêu%'or  ten_bhat like '%thương%' or ten_bhat like '%anh%'or ten_bhat like '%em%';


/*Liệt kê các bài viết về các bài hát có tiêu đề bài viết hoặc tựa bài hát chứa 1 trong các từ  "yêu","thương","anh","em"*/

select*from baiviet where ten_bhat like '%yêu%'or  ten_bhat like '%thương%' or ten_bhat like '%anh%'or ten_bhat like '%em%'or tieude  like '%yêu%' or tieude  like '%thương%' or tieude  like '%anh%' or tieude  like '%em%'; 



-- tạo view

CREATE VIEW vw_Music AS
SELECT baiviet.ma_bviet,baiviet.noidung, theloai.ten_tloai,tacgia.ten_tgia
FROM  baiviet, theloai,tacgia;
SELECT * FROM vw_Music;


ALTER TABLE theloai
  ADD SLBaiViet int;
  
CREATE TRIGGER tg_CapNhat ON theloai
FOR {DELETE, INSERT, UPDATE}
AS 
  câu_lệnh_sql