package kh.bookday.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostLikeDAO {

	@Autowired
	private SqlSession db;
}