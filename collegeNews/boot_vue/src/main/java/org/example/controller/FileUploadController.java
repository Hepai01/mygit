package org.example.controller;

import org.example.pojo.Result;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@RestController
public class FileUploadController {
    @PostMapping("/upload")
    public Result<String> upload(MultipartFile file) throws IOException{
        String originalFilename = file.getOriginalFilename();
        //保证文件名唯一从而防止覆盖
        assert originalFilename != null;
        String filename = UUID.randomUUID().toString()+originalFilename.substring(originalFilename.lastIndexOf("."));
        file.transferTo(new File("D:\\60文件\\zy\\ps\\"+filename));
        return Result.success("D:\\60文件\\zy\\ps\\"+filename);
    }
}
