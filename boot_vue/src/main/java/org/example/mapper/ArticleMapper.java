package org.example.mapper;

import org.apache.ibatis.annotations.*;
import org.example.pojo.Article;

import java.util.List;

@Mapper
public interface ArticleMapper {
    //增加文章
    @Insert("insert into article(title, content, cover_img, state, category_id, create_user, create_time, update_time)"+
            " VALUES (#{title},#{content},#{coverImg},#{state},#{categoryId},#{createUser},#{createTime},#{updateTime})")
    void add(Article article);
    //分页查询
    List<Article> list(Integer userId, Integer categoryId, String state);
    //按照id查找
    @Select("select * from article where id = #{id}")
    Article getById(Integer id);
    //更新文章
    @Update("update article set title=#{title},content=#{content},cover_img=#{coverImg},"+
            "state=#{state},category_id=#{categoryId},update_time=#{updateTime} where id=#{id}")
    void updateArticle(Article article);
    //根据id删除文章
    @Delete("delete from article where id=#{id}")
    void deleteArticle(Integer id);
}
