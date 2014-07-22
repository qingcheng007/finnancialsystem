
 <?php
if (!empty($_FILES)) {
 $tempFile = $_FILES['Filedata']['tmp_name'];
 $targetPath = $_SERVER['DOCUMENT_ROOT'] . $_GET['folder'] . '/';
 $targetFile =  str_replace('//','/',$targetPath) . $_FILES['Filedata']['name'];
 
 if(move_uploaded_file($tempFile,$targetFile)){
  echo "".$_FILES['Filedata']['name'];//此行表示要返回所上传的文件名;
 }else{
  echo "2";
 }
 
}else{
 
echo '1';
}

?>