package org.example.service;

import org.example.pojo.Article;
import org.example.pojo.PageBean;

import java.util.List;

public interface ArticleService {
    //新增文章
    void add(Article article);
    //条件分页列表查询
    PageBean<Article> list(Integer pageNum, Integer pageSize, Integer categoryId, String state);
    //通过Id获取文章详情
    Article getById(Integer id);
    //更新文章
    void updateArticle(Article article);
    //删除文章
    void deleteArticle(Integer id);
}
