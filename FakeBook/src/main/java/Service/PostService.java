package Service;

import DAO.PostDAO;
import DAO.UserDAO;
import Model.Comment;
import Model.Like;
import Model.Post;
import Model.User;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PostService {
    
    private PostDAO postDao;
    private UserDAO userDao;
    
    public PostService() {
        this.postDao = PostDAO.getInstance();
        this.userDao = UserDAO.getInstance();
    }
    //post
    public int insertPost(Post post) {
        return postDao.insert(post);
    }
    public int deletePost(int id){
        return postDao.deleteByID(id);
    }
    public int updateByID(String content, String img, int posID) {
        return postDao.updateByID(content, img, posID);
    }
    public List<Map<String, Object>> selectAllPost() {
        List<Map<String, Object>> list = new ArrayList<>();
        list = postDao.selectAllPost();
        return list;
    }
    public boolean isExist(int postID){
        List<Post> list = postDao.selectPostById(postID);
        
        return list.size()==1?true:false;
    }

    //like
    public int insertLike(int id_post, String user_name) {
        return postDao.insertLikeByID(id_post, user_name);
    }

    public int deleteLikeByID(int id_post, String user_name) {
        return postDao.deleteLikeByID(id_post, user_name);
    }

    public List<Like> selectLikeByID(int postID, String user_name) {
        List<Like> list = new ArrayList<>();
        list = postDao.selectLikeByID(postID, user_name);
        return list;
    }
    public boolean isLiked(int postID, String user_name){
        List<Like> listUser = selectLikeByID(postID,  user_name);
        
        return listUser.size()==1? true : false;
        
    }

    //comment
    public int insertComment(int id_post, String user_name, String content) {
        return postDao.insertComment(id_post, user_name, content);
    }

    public int deleteComment(int id_comment) {
        return postDao.deleteComment(id_comment);
    }

    public List<Comment> selectAllComment(int id_post) {
        List<Comment> list = new ArrayList<>();
        list = postDao.selectAllComment(id_post);
        return list;
    }
    
    public Map<Comment, User> selectUserComment(int id_post) {
        Map<Comment, User> list = new HashMap<>();
        List<Comment> list1 = postDao.selectAllComment(id_post);
        for (Comment comment : list1) {
            User user = userDao.selectByUserName(comment.getUserName());
            list.put(comment, user);
        }
        return list;
    }
}
