<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>

   

    <div style="margin-left:30% ; margin-right: 30%;margin-top: 5%;">
        <form action="index.php" method="POST">
            <h1 style="text-align: center;"> Đăng Nhập Hệ Thống</h1>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Tên tài khoản</label>
                <input type="text" name="tendangnhap" class="form-control" placeholder="Nhập tên tài khoản ">

            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Mật khẩu</label>
                <input type="password" name="matkhau" class="form-control" id="exampleInputPassword1" placeholder="Nhập mật khẩu ">
            </div>
            <?php
    //Xử lý đăng nhập

    if (isset($_POST['dangnhap']) == true) {
        $tendangnhap = $_POST['tendangnhap'];
        $matkhau = $_POST['matkhau'];

        $conn = new PDO("mysql:host=localhost;dbname=btth01_cse485;charset=utf8", "root", "");
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        // Kiểm tra đã nhập đủ tên đăng nhập với mật khẩu chưa
        if (!$tendangnhap || !$matkhau) {
            echo "Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu. <a href='javascript: history.go(-1)'>Trở lại</a>";
            exit;
        }
        $sql = "select * from acountadmin where user = ? and password = ?";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$tendangnhap, $matkhau]);
        if ($stmt->rowCount() == 1) {
            $user = $stmt->fetch();
            header("location:home.php");
        } else {
            echo "<p style='color: red;'> Đăng nhập sai.Vui lòng đăng nhập lại  </p>";
        }
    }
    ?>

            <button type="submit" name="dangnhap" class="btn btn-primary">Đăng nhập</button>
        </form>
    </div>

</body>

</html>